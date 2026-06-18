import 'package:book_core/src/models/book_chapter.dart';
import 'package:book_core/src/models/book_config.dart';

class BookProject {
  const BookProject({
    required this.rootPath,
    required this.config,
    required this.chapters,
  });

  final String rootPath;
  final BookConfig config;
  final List<BookChapter> chapters;

  BookProject copyWith({
    String? rootPath,
    BookConfig? config,
    List<BookChapter>? chapters,
  }) {
    return BookProject(
      rootPath: rootPath ?? this.rootPath,
      config: config ?? this.config,
      chapters: chapters ?? this.chapters,
    );
  }
}
