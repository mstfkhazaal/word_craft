import 'dart:convert';
import 'dart:io';

class BookProjectCreator {
  Future<void> create({
    required String rootPath,
    required String title,
    required String author,
  }) async {
    final root = Directory(rootPath);
    final chaptersDirectory = Directory('$rootPath/chapters');
    final assetsDirectory = Directory('$rootPath/assets');
    final imagesDirectory = Directory('$rootPath/assets/images');
    final outputDirectory = Directory('$rootPath/output');

    await root.create(recursive: true);
    await chaptersDirectory.create(recursive: true);
    await assetsDirectory.create(recursive: true);
    await imagesDirectory.create(recursive: true);
    await outputDirectory.create(recursive: true);

    final config = {
      'title': title,
      'author': author,
      'language': 'en',
      'description': 'A beautiful book generated from Markdown.',
      'coverImagePath': null,
      'theme': {
        'pageSize': 'a4',
        'fontFamily': 'serif',
        'fontSize': 13,
        'lineHeight': 1.55,
        'pageMargin': 48,
        'primaryColor': '#1E293B',
        'textColor': '#111827',
        'backgroundColor': '#FFFFFF',
        'headingColor': '#0F172A',
      },
      'chapters': [
        {
          'title': 'Introduction',
          'path': 'chapters/01-introduction.md',
          'order': 1,
        },
      ],
    };

    const markdown = '''
# Introduction

Welcome to your new book.

This book is written in **Markdown**.

## Start writing

Edit this chapter and preview your changes live.
''';

    await File('$rootPath/book.config.json').writeAsString(
      const JsonEncoder.withIndent('  ').convert(config),
    );

    await File('$rootPath/chapters/01-introduction.md').writeAsString(markdown);
  }
}
