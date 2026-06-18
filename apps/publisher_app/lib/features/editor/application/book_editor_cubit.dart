import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:book_core/book_core.dart';
import 'package:book_exporters/book_exporters.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:publisher_app/features/editor/application/book_editor_state.dart';

class BookEditorCubit extends Cubit<BookEditorState> {
  BookEditorCubit({
    BookProjectCreator? creator,
    BookProjectLoader? loader,
    BookProjectWriter? writer,
    MarkBookContainerService? containerService,
    PdfBookExporter? pdfExporter,
  })  : _creator = creator ?? BookProjectCreator(),
        _loader = loader ?? BookProjectLoader(),
        _writer = writer ?? BookProjectWriter(),
        _containerService = containerService ?? MarkBookContainerService(),
        _pdfExporter = pdfExporter ?? PdfBookExporter(),
        super(const BookEditorState.initial());

  final BookProjectCreator _creator;
  final BookProjectLoader _loader;
  final BookProjectWriter _writer;
  final MarkBookContainerService _containerService;
  final PdfBookExporter _pdfExporter;

  Future<void> createMarkBook({
    required String parentDirectoryPath,
    required String title,
    required String author,
  }) async {
    emit(
      state.copyWith(
        status: BookEditorStatus.loading,
        clearError: true,
        clearPdfPreview: true,
      ),
    );

    try {
      final safeName = _slugify(title);
      final workingRoot = p.join(parentDirectoryPath, safeName);
      final markBookPath = p.join(parentDirectoryPath, '$title.markbook');

      await _creator.create(
        rootPath: workingRoot,
        title: title,
        author: author,
      );

      await _containerService.packDirectory(
        sourceDirectoryPath: workingRoot,
        outputFilePath: markBookPath,
      );

      final loadedProject = await _loader.load(workingRoot);
      final firstChapter = loadedProject.chapters.first;

      emit(
        state.copyWith(
          status: BookEditorStatus.ready,
          project: loadedProject,
          selectedChapter: firstChapter,
          openedMarkBookPath: markBookPath,
          workingDirectoryPath: workingRoot,
          markdownDraft: firstChapter.markdown,
          recentFiles: _upsertRecentFile(
            RecentMarkBook(
              title: loadedProject.config.title,
              filePath: markBookPath,
              directoryPath: p.dirname(markBookPath),
              coverImagePath: loadedProject.config.coverImagePath,
            ),
          ),
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: BookEditorStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> openMarkBook(String markBookPath) async {
    emit(
      state.copyWith(
        status: BookEditorStatus.loading,
        clearError: true,
        clearPdfPreview: true,
      ),
    );

    try {
      final workspaceRoot = await _workspaceRootPath();
      final fileName = p.basenameWithoutExtension(markBookPath);
      final workingRoot = p.join(workspaceRoot, fileName);

      await _containerService.unpackToDirectory(
        markBookFilePath: markBookPath,
        destinationDirectoryPath: workingRoot,
      );

      final loadedProject = await _loader.load(workingRoot);
      final firstChapter = loadedProject.chapters.first;

      emit(
        state.copyWith(
          status: BookEditorStatus.ready,
          project: loadedProject,
          selectedChapter: firstChapter,
          openedMarkBookPath: markBookPath,
          workingDirectoryPath: workingRoot,
          markdownDraft: firstChapter.markdown,
          recentFiles: _upsertRecentFile(
            RecentMarkBook(
              title: loadedProject.config.title,
              filePath: markBookPath,
              directoryPath: p.dirname(markBookPath),
              coverImagePath: loadedProject.config.coverImagePath,
            ),
          ),
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: BookEditorStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void selectChapter(BookChapter chapter) {
    emit(
      state.copyWith(
        selectedChapter: chapter,
        markdownDraft: chapter.markdown,
        clearPdfPreview: true,
      ),
    );
  }

  void updateMarkdownDraft(String value) {
    emit(state.copyWith(markdownDraft: value));
  }

  Future<void> saveMarkBook() async {
    final project = state.project;
    final selectedChapter = state.selectedChapter;
    final openedMarkBookPath = state.openedMarkBookPath;
    final workingDirectoryPath = state.workingDirectoryPath;

    if (project == null ||
        selectedChapter == null ||
        openedMarkBookPath == null ||
        workingDirectoryPath == null) {
      return;
    }

    emit(
      state.copyWith(
        status: BookEditorStatus.saving,
        clearError: true,
      ),
    );

    try {
      await _writer.saveChapter(
        rootPath: project.rootPath,
        chapterPath: selectedChapter.path,
        markdown: state.markdownDraft,
      );

      await _containerService.packDirectory(
        sourceDirectoryPath: workingDirectoryPath,
        outputFilePath: openedMarkBookPath,
      );

      final reloadedProject = await _loader.load(workingDirectoryPath);
      final reloadedChapter = reloadedProject.chapters.firstWhere(
            (chapter) => chapter.path == selectedChapter.path,
      );

      emit(
        state.copyWith(
          status: BookEditorStatus.ready,
          project: reloadedProject,
          selectedChapter: reloadedChapter,
          markdownDraft: reloadedChapter.markdown,
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: BookEditorStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<Uint8List?> buildPdfPreview() async {
    final project = state.project;

    if (project == null) {
      return null;
    }

    emit(
      state.copyWith(
        status: BookEditorStatus.exporting,
        clearError: true,
        clearPdfPreview: true,
      ),
    );

    try {
      await saveMarkBook();

      final workingDirectoryPath = state.workingDirectoryPath;
      if (workingDirectoryPath == null) {
        return null;
      }

      final reloadedProject = await _loader.load(workingDirectoryPath);
      final bytes = await _pdfExporter.export(reloadedProject);

      emit(
        state.copyWith(
          status: BookEditorStatus.ready,
          pdfPreviewBytes: bytes,
        ),
      );

      return bytes;
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: BookEditorStatus.failure,
          errorMessage: error.toString(),
        ),
      );

      return null;
    }
  }

  List<RecentMarkBook> _upsertRecentFile(RecentMarkBook item) {
    return [
      item,
      ...state.recentFiles.where((recent) => recent.filePath != item.filePath),
    ];
  }

  Future<String> _workspaceRootPath() async {
    final supportDirectory = await getApplicationSupportDirectory();
    final workspaceDirectory = Directory(
      p.join(supportDirectory.path, 'markbook_workspaces'),
    );

    await workspaceDirectory.create(recursive: true);

    return workspaceDirectory.path;
  }

  String _slugify(String value) {
    final slug = value
        .trim()
        .toLowerCase()
        .replaceAll(RegExp('[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');

    if (slug.isEmpty) {
      return 'untitled-book';
    }

    return slug;
  }
}
