import 'dart:io';

import 'package:book_core/src/models/book_project.dart';

class BookProjectValidator {
  Future<List<String>> validate(BookProject project) async {
    final errors = <String>[];

    if (project.config.title.trim().isEmpty) {
      errors.add('Book title is required.');
    }

    if (project.config.author.trim().isEmpty) {
      errors.add('Book author is required.');
    }

    if (project.chapters.isEmpty) {
      errors.add('At least one chapter is required.');
    }

    for (final chapter in project.chapters) {
      final file = File('${project.rootPath}/${chapter.path}');

      if (! file.existsSync()) {
        errors.add('Missing chapter file: ${chapter.path}');
      }

      if (chapter.markdown.trim().isEmpty) {
        errors.add('Empty chapter: ${chapter.title}');
      }
    }

    return errors;
  }
}
