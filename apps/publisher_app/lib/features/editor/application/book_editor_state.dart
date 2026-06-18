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
