Yes. Do it this way:

1. **AutoRoute** for navigation.
2. **Cubit** for open/save/create/publish state.
3. **No use cases now**. Use services directly inside Cubit. That is enough for this stage.
4. First page should be a **Welcome / Recent Files** page like Vellum.

Your current `App` still uses `MaterialApp` with `home: const EditorPage()` , and your current `EditorPage` owns too much state directly with `setState`, file services, exporter, and `.markbook` paths inside the widget . Move that logic to a Cubit. Keep your existing `MarkBookContainerService`; it already packs/unpacks `.markbook` and validates `markbook.json` / `book.config.json` .

AutoRoute is a good fit because it generates strongly typed route objects and is wired through `MaterialApp.router` with `routerConfig: _appRouter.config()` after generation. ([Dart packages][1]) Flutter Bloc’s `BlocProvider` is the right place to create and provide your Cubit, and it closes blocs automatically when it creates them. ([Dart packages][2]) For macOS file picking, `file_picker` supports directory picking, custom extensions, and save dialogs, including `getDirectoryPath()` and `saveFile()`. ([Dart packages][3])

---

## 1. Add dependencies

In:

```txt
apps/publisher_app/pubspec.yaml
```

add:

```yaml
dependencies:
  auto_route: ^11.1.0
  flutter_bloc: ^9.1.1
  file_picker: ^10.3.7
  path_provider: ^2.1.5
  path: ^1.9.1

dev_dependencies:
  auto_route_generator: ^11.0.0
  build_runner: ^2.4.15
```

Run:

```bash
cd apps/publisher_app
flutter pub get
```

---

## 2. Add AutoRoute

Create:

```txt
apps/publisher_app/lib/app/router/app_router.dart
```

```dart
import 'package:auto_route/auto_route.dart';
import 'package:publisher_app/features/editor/presentation/editor_page.dart';
import 'package:publisher_app/features/welcome/presentation/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: WelcomeRoute.page,
        path: '/',
        initial: true,
      ),
      AutoRoute(
        page: EditorRoute.page,
        path: '/editor',
      ),
    ];
  }
}
```

Then generate routes:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 3. Replace `App`

Replace:

```txt
apps/publisher_app/lib/app/view/app.dart
```

with:

```dart
import 'package:flutter/material.dart';
import 'package:publisher_app/app/router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Word Craft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFFC77DFF),
        fontFamily: '.SF Pro Display',
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
```

---

## 4. Add editor state

Create:

```txt
apps/publisher_app/lib/features/editor/application/book_editor_state.dart
```

```dart
import 'dart:typed_data';

import 'package:book_core/book_core.dart';

enum BookEditorStatus {
  initial,
  loading,
  ready,
  saving,
  exporting,
  failure,
}

class RecentMarkBook {
  const RecentMarkBook({
    required this.title,
    required this.filePath,
    required this.directoryPath,
    this.coverImagePath,
  });

  final String title;
  final String filePath;
  final String directoryPath;
  final String? coverImagePath;
}

class BookEditorState {
  const BookEditorState({
    required this.status,
    required this.recentFiles,
    this.project,
    this.selectedChapter,
    this.openedMarkBookPath,
    this.workingDirectoryPath,
    this.markdownDraft = '',
    this.errorMessage,
    this.pdfPreviewBytes,
  });

  const BookEditorState.initial()
      : status = BookEditorStatus.initial,
        recentFiles = const [],
        project = null,
        selectedChapter = null,
        openedMarkBookPath = null,
        workingDirectoryPath = null,
        markdownDraft = '',
        errorMessage = null,
        pdfPreviewBytes = null;

  final BookEditorStatus status;
  final List<RecentMarkBook> recentFiles;
  final BookProject? project;
  final BookChapter? selectedChapter;
  final String? openedMarkBookPath;
  final String? workingDirectoryPath;
  final String markdownDraft;
  final String? errorMessage;
  final Uint8List? pdfPreviewBytes;

  bool get hasProject => project != null;

  bool get canSave {
    return project != null &&
        selectedChapter != null &&
        openedMarkBookPath != null &&
        workingDirectoryPath != null;
  }

  BookEditorState copyWith({
    BookEditorStatus? status,
    List<RecentMarkBook>? recentFiles,
    BookProject? project,
    BookChapter? selectedChapter,
    String? openedMarkBookPath,
    String? workingDirectoryPath,
    String? markdownDraft,
    String? errorMessage,
    Uint8List? pdfPreviewBytes,
    bool clearError = false,
    bool clearPdfPreview = false,
  }) {
    return BookEditorState(
      status: status ?? this.status,
      recentFiles: recentFiles ?? this.recentFiles,
      project: project ?? this.project,
      selectedChapter: selectedChapter ?? this.selectedChapter,
      openedMarkBookPath: openedMarkBookPath ?? this.openedMarkBookPath,
      workingDirectoryPath: workingDirectoryPath ?? this.workingDirectoryPath,
      markdownDraft: markdownDraft ?? this.markdownDraft,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      pdfPreviewBytes:
          clearPdfPreview ? null : pdfPreviewBytes ?? this.pdfPreviewBytes,
    );
  }
}
```

---

## 5. Add editor Cubit

Create:

```txt
apps/publisher_app/lib/features/editor/application/book_editor_cubit.dart
```

```dart
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
    } catch (error) {
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
    } catch (error) {
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
    } catch (error) {
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
    } catch (error) {
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
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');

    if (slug.isEmpty) {
      return 'untitled-book';
    }

    return slug;
  }
}
```

---

## 6. Add Welcome page like Vellum

Create:

```txt
apps/publisher_app/lib/features/welcome/presentation/welcome_page.dart
```

```dart
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publisher_app/app/router/app_router.gr.dart';
import 'package:publisher_app/features/editor/application/book_editor_cubit.dart';
import 'package:publisher_app/features/editor/application/book_editor_state.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  Future<void> _createNewBook(BuildContext context) async {
    final directoryPath = await FilePicker.platform.getDirectoryPath();

    if (directoryPath == null || !context.mounted) {
      return;
    }

    final result = await showDialog<_NewBookResult>(
      context: context,
      builder: (_) => const _NewBookDialog(),
    );

    if (result == null || !context.mounted) {
      return;
    }

    await context.read<BookEditorCubit>().createMarkBook(
          parentDirectoryPath: directoryPath,
          title: result.title,
          author: result.author,
        );

    if (!context.mounted) {
      return;
    }

    await context.router.push(const EditorRoute());
  }

  Future<void> _openOther(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['markbook'],
      allowMultiple: false,
    );

    final path = result?.files.single.path;

    if (path == null || !context.mounted) {
      return;
    }

    await context.read<BookEditorCubit>().openMarkBook(path);

    if (!context.mounted) {
      return;
    }

    await context.router.push(const EditorRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookEditorCubit, BookEditorState>(
      listener: (context, state) {
        final error = state.errorMessage;

        if (error == null) {
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      builder: (context, state) {
        final isBusy = state.status == BookEditorStatus.loading;

        return Scaffold(
          backgroundColor: const Color(0xFF1F1F22),
          body: Center(
            child: Container(
              width: 1180,
              height: 700,
              decoration: BoxDecoration(
                color: const Color(0xFF202023),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF4A4A4F)),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 40,
                    offset: Offset(0, 24),
                    color: Color(0x66000000),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Row(
                  children: [
                    Expanded(
                      child: _WelcomeBrandPanel(
                        isBusy: isBusy,
                        onNewBook: () => _createNewBook(context),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: const Color(0xFF171719),
                    ),
                    Expanded(
                      child: _RecentFilesPanel(
                        isBusy: isBusy,
                        recentFiles: state.recentFiles,
                        onOpenOther: () => _openOther(context),
                        onOpenRecent: (filePath) async {
                          await context
                              .read<BookEditorCubit>()
                              .openMarkBook(filePath);

                          if (!context.mounted) {
                            return;
                          }

                          await context.router.push(const EditorRoute());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WelcomeBrandPanel extends StatelessWidget {
  const _WelcomeBrandPanel({
    required this.isBusy,
    required this.onNewBook,
  });

  final bool isBusy;
  final VoidCallback onNewBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF252528),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(70, 44, 70, 36),
        child: Column(
          children: [
            const _MacWindowDots(),
            const Spacer(),
            const _MarkBookFlower(),
            const SizedBox(height: 36),
            const Text(
              'WORD CRAFT',
              style: TextStyle(
                color: Color(0xFFD8D8DD),
                fontSize: 54,
                letterSpacing: 3,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Version 0.1.0',
              style: TextStyle(
                color: Color(0xFF9E9EA4),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Divider(color: Color(0xFF4A4A4F)),
            const SizedBox(height: 30),
            const _HelpLink(
              icon: Icons.local_florist_outlined,
              label: 'Show Word Craft Tutorial',
            ),
            const SizedBox(height: 18),
            const _HelpLink(
              icon: Icons.help_outline,
              label: 'Open Help Overview',
            ),
            const SizedBox(height: 38),
            const Divider(color: Color(0xFF4A4A4F)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: isBusy ? null : onNewBook,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF3D3D43),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                  ),
                  child: const Text(
                    'New Book',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 16),
                FilledButton(
                  onPressed: isBusy ? null : () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF3D3D43),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                  ),
                  child: const Text(
                    'Import Word File...',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentFilesPanel extends StatelessWidget {
  const _RecentFilesPanel({
    required this.isBusy,
    required this.recentFiles,
    required this.onOpenOther,
    required this.onOpenRecent,
  });

  final bool isBusy;
  final List<RecentMarkBook> recentFiles;
  final VoidCallback onOpenOther;
  final ValueChanged<String> onOpenRecent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF20201F),
      padding: const EdgeInsets.fromLTRB(32, 36, 32, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Files',
            style: TextStyle(
              color: Color(0xFFA7A7AC),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: recentFiles.isEmpty
                ? const _EmptyRecentFiles()
                : ListView.separated(
                    itemCount: recentFiles.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final recentFile = recentFiles[index];

                      return _RecentFileTile(
                        recentFile: recentFile,
                        onTap: isBusy
                            ? null
                            : () => onOpenRecent(recentFile.filePath),
                      );
                    },
                  ),
          ),
          const Divider(color: Color(0xFF4A4A4F)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: isBusy ? null : onOpenOther,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF3D3D43),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 13,
                  ),
                ),
                child: const Text(
                  'Open Other...',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: null,
                style: FilledButton.styleFrom(
                  disabledBackgroundColor: const Color(0xFF333337),
                  disabledForegroundColor: const Color(0xFF6B6B70),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 13,
                  ),
                ),
                child: const Text(
                  'Open Selected',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecentFileTile extends StatelessWidget {
  const _RecentFileTile({
    required this.recentFile,
    required this.onTap,
  });

  final RecentMarkBook recentFile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final coverPath = recentFile.coverImagePath;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 76,
              height: 108,
              decoration: BoxDecoration(
                color: const Color(0xFFE8DCC7),
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: const Color(0xFF48484D)),
                image: coverPath != null && File(coverPath).existsSync()
                    ? DecorationImage(
                        image: FileImage(File(coverPath)),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: coverPath == null
                  ? const Icon(
                      Icons.menu_book_rounded,
                      color: Color(0xFF3C3C42),
                      size: 36,
                    )
                  : null,
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recentFile.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFE5E5EA),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.folder_outlined,
                        color: Color(0xFFA7A7AC),
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          recentFile.directoryPath,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFA7A7AC),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    recentFile.filePath.split(Platform.pathSeparator).last,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFA7A7AC),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyRecentFiles extends StatelessWidget {
  const _EmptyRecentFiles();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No recent books yet.\nCreate a new .markbook or open an existing one.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF8D8D93),
          fontSize: 18,
          height: 1.4,
        ),
      ),
    );
  }
}

class _HelpLink extends StatelessWidget {
  const _HelpLink({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFFCFA1D7), size: 28),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFCFA1D7),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            decorationColor: Color(0xFFCFA1D7),
          ),
        ),
      ],
    );
  }
}

class _MacWindowDots extends StatelessWidget {
  const _MacWindowDots();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          _WindowDot(),
          SizedBox(width: 14),
          _WindowDot(),
          SizedBox(width: 14),
          _WindowDot(),
        ],
      ),
    );
  }
}

class _WindowDot extends StatelessWidget {
  const _WindowDot();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF5A5A60),
        borderRadius: BorderRadius.circular(999),
      ),
      child: const SizedBox(width: 24, height: 24),
    );
  }
}

class _MarkBookFlower extends StatelessWidget {
  const _MarkBookFlower();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      height: 245,
      child: CustomPaint(
        painter: _FlowerPainter(),
      ),
    );
  }
}

class _FlowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final petalPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFFD7D1D3),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Offset.zero & size);

    final accentPaint = Paint()
      ..color = const Color(0xFFC638D5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 5; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(i * 1.2566370614);
      final path = Path()
        ..moveTo(0, -8)
        ..cubicTo(62, -92, 38, -138, 0, -156)
        ..cubicTo(-38, -138, -62, -92, 0, -8)
        ..close();

      canvas.drawPath(path, petalPaint);
      canvas.restore();
    }

    for (var i = 0; i < 10; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(i * 0.6283185307);
      canvas.drawLine(const Offset(0, 0), const Offset(0, -92), accentPaint);
      canvas.restore();
    }

    canvas.drawCircle(
      center,
      7,
      Paint()..color = const Color(0xFFC638D5),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _NewBookDialog extends StatefulWidget {
  const _NewBookDialog();

  @override
  State<_NewBookDialog> createState() => _NewBookDialogState();
}

class _NewBookDialogState extends State<_NewBookDialog> {
  final titleController = TextEditingController(text: 'My Book');
  final authorController = TextEditingController(text: 'Mostafa Khazaal');

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New MarkBook'),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Book title',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(
                labelText: 'Author',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            final title = titleController.text.trim();
            final author = authorController.text.trim();

            if (title.isEmpty || author.isEmpty) {
              return;
            }

            Navigator.of(context).pop(
              _NewBookResult(
                title: title,
                author: author,
              ),
            );
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}

class _NewBookResult {
  const _NewBookResult({
    required this.title,
    required this.author,
  });

  final String title;
  final String author;
}
```

---

## 7. Update Editor page to use Cubit

Replace your current:

```txt
apps/publisher_app/lib/features/editor/presentation/editor_page.dart
```

with:

```dart
import 'package:auto_route/auto_route.dart';
import 'package:book_core/book_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:printing/printing.dart';
import 'package:publisher_app/features/editor/application/book_editor_cubit.dart';
import 'package:publisher_app/features/editor/application/book_editor_state.dart';

@RoutePage()
class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  Future<void> _previewPdf(BuildContext context) async {
    final bytes = await context.read<BookEditorCubit>().buildPdfPreview();

    if (bytes == null || !context.mounted) {
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('PDF Preview'),
            ),
            body: PdfPreview(
              build: (_) async => bytes,
              canChangeOrientation: false,
              canChangePageFormat: true,
              allowPrinting: true,
              allowSharing: true,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookEditorCubit, BookEditorState>(
      listener: (context, state) {
        final error = state.errorMessage;

        if (error == null) {
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      builder: (context, state) {
        final project = state.project;

        return Scaffold(
          appBar: AppBar(
            title: Text(project?.config.title ?? 'Word Craft'),
            leading: IconButton(
              onPressed: () => context.router.maybePop(),
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              TextButton.icon(
                onPressed: state.canSave
                    ? () => context.read<BookEditorCubit>().saveMarkBook()
                    : null,
                icon: const Icon(Icons.save_outlined),
                label: const Text('Save'),
              ),
              TextButton.icon(
                onPressed: project == null ? null : () => _previewPdf(context),
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: const Text('Preview PDF'),
              ),
              const SizedBox(width: 12),
            ],
          ),
          body: project == null
              ? const Center(
                  child: Text('Open or create a .markbook first.'),
                )
              : _EditorLayout(
                  project: project,
                  state: state,
                ),
        );
      },
    );
  }
}

class _EditorLayout extends StatelessWidget {
  const _EditorLayout({
    required this.project,
    required this.state,
  });

  final BookProject project;
  final BookEditorState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ChapterSidebar(
          chapters: project.chapters,
          selectedChapter: state.selectedChapter,
        ),
        const VerticalDivider(width: 1),
        const Expanded(
          child: _MarkdownEditorPane(),
        ),
        const VerticalDivider(width: 1),
        const Expanded(
          child: _MarkdownPreviewPane(),
        ),
      ],
    );
  }
}

class _ChapterSidebar extends StatelessWidget {
  const _ChapterSidebar({
    required this.chapters,
    required this.selectedChapter,
  });

  final List<BookChapter> chapters;
  final BookChapter? selectedChapter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                'Chapters',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (final chapter in chapters)
              ListTile(
                title: Text(chapter.title),
                subtitle: Text(chapter.path),
                selected: chapter.path == selectedChapter?.path,
                onTap: () {
                  context.read<BookEditorCubit>().selectChapter(chapter);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _MarkdownEditorPane extends StatefulWidget {
  const _MarkdownEditorPane();

  @override
  State<_MarkdownEditorPane> createState() => _MarkdownEditorPaneState();
}

class _MarkdownEditorPaneState extends State<_MarkdownEditorPane> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookEditorCubit, BookEditorState>(
      listenWhen: (previous, current) {
        return previous.selectedChapter?.path != current.selectedChapter?.path ||
            previous.markdownDraft != current.markdownDraft;
      },
      listener: (context, state) {
        if (controller.text == state.markdownDraft) {
          return;
        }

        controller.value = TextEditingValue(
          text: state.markdownDraft,
          selection: TextSelection.collapsed(
            offset: state.markdownDraft.length,
          ),
        );
      },
      child: TextField(
        controller: controller,
        expands: true,
        maxLines: null,
        minLines: null,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
          height: 1.55,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(24),
          hintText: 'Write Markdown...',
        ),
        onChanged: context.read<BookEditorCubit>().updateMarkdownDraft,
      ),
    );
  }
}

class _MarkdownPreviewPane extends StatelessWidget {
  const _MarkdownPreviewPane();

  @override
  Widget build(BuildContext context) {
    final markdown = context.select(
      (BookEditorCubit cubit) => cubit.state.markdownDraft,
    );

    return Markdown(
      data: markdown,
      padding: const EdgeInsets.all(32),
    );
  }
}
```

---

## 8. Provide Cubit above router

Update `App` again so the Cubit is available to both `WelcomePage` and `EditorPage`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publisher_app/app/router/app_router.dart';
import 'package:publisher_app/features/editor/application/book_editor_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookEditorCubit(),
      child: MaterialApp.router(
        title: 'Word Craft',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: const Color(0xFFC77DFF),
          fontFamily: '.SF Pro Display',
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
```

---

## 9. Generate and run

```bash
cd apps/publisher_app

dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter run --flavor development -t lib/main_development.dart -d macos
```

---

## Important structure now

Your app should become:

```txt
apps/publisher_app/lib/
  app/
    router/
      app_router.dart
      app_router.gr.dart
    view/
      app.dart

  features/
    welcome/
      presentation/
        welcome_page.dart

    editor/
      application/
        book_editor_cubit.dart
        book_editor_state.dart
      presentation/
        editor_page.dart
```

No use cases yet. For now:

```txt
UI → Cubit → book_core services / book_exporters
```

Later, when the app grows:

```txt
UI → Cubit → Repository → Services
```

But today, Cubit + services is enough.

[1]: https://pub.dev/packages/auto_route "auto_route | Flutter package"
[2]: https://pub.dev/packages/flutter_bloc "flutter_bloc | Flutter package"
[3]: https://pub.dev/packages/file_picker "file_picker | Flutter package"
