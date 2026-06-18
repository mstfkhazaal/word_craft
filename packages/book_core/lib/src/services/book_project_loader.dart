import 'dart:convert';
import 'dart:io';

import 'package:book_core/src/models/book_chapter.dart';
import 'package:book_core/src/models/book_config.dart';
import 'package:book_core/src/models/book_project.dart';

class BookProjectLoader {
  Future<BookProject> load(String rootPath) async {
    final configFile = File('$rootPath/book.config.json');

    if (! configFile.existsSync()) {
      throw const FormatException('book.config.json was not found.');
    }

    final decoded = jsonDecode(await configFile.readAsString());

    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('book.config.json must contain an object.');
    }

    final config = BookConfig.fromJson(decoded);
    final chapters = <BookChapter>[];

    for (final chapter in config.chapters) {
      final chapterFile = File('$rootPath/${chapter.path}');

      if (! chapterFile.existsSync()) {
        throw FormatException('Chapter file was not found: ${chapter.path}');
      }

      chapters.add(
        chapter.copyWith(
          markdown: await chapterFile.readAsString(),
        ),
      );
    }

    return BookProject(
      rootPath: rootPath,
      config: config,
      chapters: chapters,
    );
  }
}
