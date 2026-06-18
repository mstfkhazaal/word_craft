import 'dart:convert';
import 'dart:io';

import 'package:book_core/src/models/book_config.dart';

class BookProjectWriter {
  Future<void> saveConfig({
    required String rootPath,
    required BookConfig config,
  }) async {
    final file = File('$rootPath/book.config.json');

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(config.toJson()),
    );
  }

  Future<void> saveChapter({
    required String rootPath,
    required String chapterPath,
    required String markdown,
  }) async {
    final file = File('$rootPath/$chapterPath');

    if (! file.existsSync()) {
      throw FormatException('Chapter file was not found: $chapterPath');
    }

    await file.writeAsString(markdown);
  }
}
