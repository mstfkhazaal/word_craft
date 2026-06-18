import 'package:book_core/src/models/book_chapter.dart';
import 'package:book_core/src/models/book_theme_config.dart';

class BookConfig {
  const BookConfig({
    required this.title,
    required this.author,
    required this.language,
    required this.description,
    required this.coverImagePath,
    required this.theme,
    required this.chapters,
  });

  factory BookConfig.fromJson(Map<String, dynamic> json) {
    final chaptersJson = json['chapters'] as List<dynamic>? ?? [];

    return BookConfig(
      title: json['title'] as String? ?? 'Untitled Book',
      author: json['author'] as String? ?? 'Unknown Author',
      language: json['language'] as String? ?? 'en',
      description: json['description'] as String? ?? '',
      coverImagePath: json['coverImagePath'] as String?,
      theme: BookThemeConfig.fromJson(
        Map<String, dynamic>.from(json['theme'] as Map? ?? {}),
      ),
      chapters: chaptersJson
          .map(
            (chapter) => BookChapter.fromJson(
          Map<String, dynamic>.from(chapter as Map),
        ),
      )
          .toList()
        ..sort((a, b) => a.order.compareTo(b.order)),
    );
  }

  final String title;
  final String author;
  final String language;
  final String description;
  final String? coverImagePath;
  final BookThemeConfig theme;
  final List<BookChapter> chapters;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'language': language,
      'description': description,
      'coverImagePath': coverImagePath,
      'theme': theme.toJson(),
      'chapters': chapters.map((chapter) => chapter.toConfigJson()).toList(),
    };
  }

  BookConfig copyWith({
    String? title,
    String? author,
    String? language,
    String? description,
    String? coverImagePath,
    BookThemeConfig? theme,
    List<BookChapter>? chapters,
  }) {
    return BookConfig(
      title: title ?? this.title,
      author: author ?? this.author,
      language: language ?? this.language,
      description: description ?? this.description,
      coverImagePath: coverImagePath ?? this.coverImagePath,
      theme: theme ?? this.theme,
      chapters: chapters ?? this.chapters,
    );
  }
}
