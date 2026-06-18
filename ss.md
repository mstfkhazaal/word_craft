Your next step is **not PDF/EPUB yet**. First build the foundation: the app must create, load, edit, and save a local book project folder.

Very Good Core is already a good choice because it gives you a scalable Flutter app base with Bloc, testing, linting, flavors, and CI. The docs describe the Core template as a multi-platform Flutter starter with folder-by-feature architecture and Bloc-based separation between UI and business logic. ([Very Good CLI][1])

## Target structure now

You have:

```txt
apps/
  publisher_app/

packages/
  book_core/
  book_exporters/
```

Now make them work together like this:

```txt
publisher_app
  uses book_core
  uses book_exporters

book_core
  owns models
  owns config parser
  owns project file creation/loading/saving
  owns validation

book_exporters
  owns PDF exporter
  owns HTML exporter
  owns EPUB exporter later
  depends on book_core
```

The `pdf` package is a good fit for `book_exporters` because it creates PDF files for Dart and Flutter and includes a Flutter-like widget system for multi-page PDF generation. ([Dart packages][2])

---

# Step 1: connect packages to Flutter app

In:

```txt
apps/publisher_app/pubspec.yaml
```

add:

```yaml
dependencies:
  book_core:
    path: ../../packages/book_core
  book_exporters:
    path: ../../packages/book_exporters
```

In:

```txt
packages/book_exporters/pubspec.yaml
```

add:

```yaml
dependencies:
  book_core:
    path: ../book_core
  markdown: ^7.3.0
  pdf: ^3.13.0
```

In:

```txt
apps/publisher_app/pubspec.yaml
```

also add UI/export dependencies:

```yaml
dependencies:
  file_picker: ^10.0.0
  flutter_markdown_plus: ^1.0.4
  printing: ^5.14.2
```

`flutter_markdown_plus` is the package I would use for the live Markdown preview UI. `printing` is useful later for previewing, printing, and sharing PDFs from Flutter. ([Dart packages][3])

Run from repo root or each package:

```bash
flutter pub get
```

---

# Step 2: build `book_core` first

Create this structure:

```txt
packages/book_core/lib/
  book_core.dart
  src/
    models/
      book_config.dart
      book_chapter.dart
      book_project.dart
      book_theme_config.dart
    services/
      book_project_creator.dart
      book_project_loader.dart
      book_project_writer.dart
      book_project_validator.dart
```

## `packages/book_core/lib/book_core.dart`

```dart
export 'src/models/book_chapter.dart';
export 'src/models/book_config.dart';
export 'src/models/book_project.dart';
export 'src/models/book_theme_config.dart';
export 'src/services/book_project_creator.dart';
export 'src/services/book_project_loader.dart';
export 'src/services/book_project_validator.dart';
export 'src/services/book_project_writer.dart';
```

## `packages/book_core/lib/src/models/book_theme_config.dart`

```dart
class BookThemeConfig {
  const BookThemeConfig({
    required this.pageSize,
    required this.fontFamily,
    required this.fontSize,
    required this.lineHeight,
    required this.pageMargin,
    required this.primaryColor,
    required this.textColor,
    required this.backgroundColor,
    required this.headingColor,
  });

  factory BookThemeConfig.fromJson(Map<String, dynamic> json) {
    return BookThemeConfig(
      pageSize: json['pageSize'] as String? ?? 'a4',
      fontFamily: json['fontFamily'] as String? ?? 'serif',
      fontSize: (json['fontSize'] as num? ?? 13).toDouble(),
      lineHeight: (json['lineHeight'] as num? ?? 1.55).toDouble(),
      pageMargin: (json['pageMargin'] as num? ?? 48).toDouble(),
      primaryColor: json['primaryColor'] as String? ?? '#1E293B',
      textColor: json['textColor'] as String? ?? '#111827',
      backgroundColor: json['backgroundColor'] as String? ?? '#FFFFFF',
      headingColor: json['headingColor'] as String? ?? '#0F172A',
    );
  }

  final String pageSize;
  final String fontFamily;
  final double fontSize;
  final double lineHeight;
  final double pageMargin;
  final String primaryColor;
  final String textColor;
  final String backgroundColor;
  final String headingColor;

  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'lineHeight': lineHeight,
      'pageMargin': pageMargin,
      'primaryColor': primaryColor,
      'textColor': textColor,
      'backgroundColor': backgroundColor,
      'headingColor': headingColor,
    };
  }

  BookThemeConfig copyWith({
    String? pageSize,
    String? fontFamily,
    double? fontSize,
    double? lineHeight,
    double? pageMargin,
    String? primaryColor,
    String? textColor,
    String? backgroundColor,
    String? headingColor,
  }) {
    return BookThemeConfig(
      pageSize: pageSize ?? this.pageSize,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      pageMargin: pageMargin ?? this.pageMargin,
      primaryColor: primaryColor ?? this.primaryColor,
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headingColor: headingColor ?? this.headingColor,
    );
  }
}
```

## `packages/book_core/lib/src/models/book_chapter.dart`

```dart
class BookChapter {
  const BookChapter({
    required this.title,
    required this.path,
    required this.order,
    required this.markdown,
  });

  factory BookChapter.fromJson(Map<String, dynamic> json) {
    return BookChapter(
      title: json['title'] as String,
      path: json['path'] as String,
      order: json['order'] as int,
      markdown: json['markdown'] as String? ?? '',
    );
  }

  final String title;
  final String path;
  final int order;
  final String markdown;

  Map<String, dynamic> toConfigJson() {
    return {
      'title': title,
      'path': path,
      'order': order,
    };
  }

  BookChapter copyWith({
    String? title,
    String? path,
    int? order,
    String? markdown,
  }) {
    return BookChapter(
      title: title ?? this.title,
      path: path ?? this.path,
      order: order ?? this.order,
      markdown: markdown ?? this.markdown,
    );
  }
}
```

## `packages/book_core/lib/src/models/book_config.dart`

```dart
import 'book_chapter.dart';
import 'book_theme_config.dart';

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
```

## `packages/book_core/lib/src/models/book_project.dart`

```dart
import 'book_chapter.dart';
import 'book_config.dart';

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
```

---

# Step 3: add project creation/loading/saving

## `packages/book_core/lib/src/services/book_project_creator.dart`

```dart
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
```

## `packages/book_core/lib/src/services/book_project_loader.dart`

```dart
import 'dart:convert';
import 'dart:io';

import '../models/book_chapter.dart';
import '../models/book_config.dart';
import '../models/book_project.dart';

class BookProjectLoader {
  Future<BookProject> load(String rootPath) async {
    final configFile = File('$rootPath/book.config.json');

    if (!await configFile.exists()) {
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

      if (!await chapterFile.exists()) {
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
```

## `packages/book_core/lib/src/services/book_project_writer.dart`

```dart
import 'dart:convert';
import 'dart:io';

import '../models/book_config.dart';

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

    if (!await file.exists()) {
      throw FormatException('Chapter file was not found: $chapterPath');
    }

    await file.writeAsString(markdown);
  }
}
```

## `packages/book_core/lib/src/services/book_project_validator.dart`

```dart
import 'dart:io';

import '../models/book_project.dart';

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

      if (!await file.exists()) {
        errors.add('Missing chapter file: ${chapter.path}');
      }

      if (chapter.markdown.trim().isEmpty) {
        errors.add('Empty chapter: ${chapter.title}');
      }
    }

    return errors;
  }
}
```

---

# Step 4: make `book_exporters`

Start with PDF only. Add EPUB after the book flow is stable.

## `packages/book_exporters/lib/book_exporters.dart`

```dart
export 'src/pdf/pdf_book_exporter.dart';
```

## `packages/book_exporters/lib/src/pdf/pdf_book_exporter.dart`

```dart
import 'dart:typed_data';

import 'package:book_core/book_core.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfBookExporter {
  Future<Uint8List> export(BookProject project) async {
    final pdf = pw.Document(
      title: project.config.title,
      author: project.config.author,
      creator: 'Markdown Book Publisher',
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: _pageFormat(project.config.theme.pageSize).copyWith(
          marginLeft: project.config.theme.pageMargin,
          marginTop: project.config.theme.pageMargin,
          marginRight: project.config.theme.pageMargin,
          marginBottom: project.config.theme.pageMargin,
        ),
        build: (_) {
          return [
            _cover(project),
            pw.NewPage(),
            _toc(project),
            pw.NewPage(),
            for (final chapter in project.chapters) ...[
              pw.Header(
                level: 0,
                child: pw.Text(chapter.title),
              ),
              ..._markdownToPdf(chapter.markdown, project.config.theme),
              pw.NewPage(),
            ],
          ];
        },
      ),
    );

    return pdf.save();
  }

  PdfPageFormat _pageFormat(String pageSize) {
    return switch (pageSize.toLowerCase()) {
      'a5' => PdfPageFormat.a5,
      'letter' => PdfPageFormat.letter,
      _ => PdfPageFormat.a4,
    };
  }

  pw.Widget _cover(BookProject project) {
    return pw.Center(
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Text(
            project.config.title,
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: 32,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            project.config.author,
            style: const pw.TextStyle(fontSize: 16),
          ),
          pw.SizedBox(height: 40),
          pw.Text(
            project.config.description,
            textAlign: pw.TextAlign.center,
          ),
        ],
      ),
    );
  }

  pw.Widget _toc(BookProject project) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Table of Contents',
          style: pw.TextStyle(
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 16),
        for (final chapter in project.chapters)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 8),
            child: pw.Text(chapter.title),
          ),
      ],
    );
  }

  List<pw.Widget> _markdownToPdf(
    String markdown,
    BookThemeConfig theme,
  ) {
    final document = md.Document();
    final nodes = document.parseLines(markdown.split('\n'));
    final widgets = <pw.Widget>[];

    for (final node in nodes) {
      if (node is md.Element) {
        widgets.add(_elementToWidget(node, theme));
      } else if (node is md.Text) {
        widgets.add(_paragraph(node.text, theme));
      }
    }

    return widgets;
  }

  pw.Widget _elementToWidget(
    md.Element element,
    BookThemeConfig theme,
  ) {
    final text = element.textContent.trim();

    return switch (element.tag) {
      'h1' => _heading(text, 26),
      'h2' => _heading(text, 22),
      'h3' => _heading(text, 18),
      'blockquote' => _blockquote(text, theme),
      'pre' => _codeBlock(text),
      'ul' => _unorderedList(element),
      'ol' => _orderedList(element),
      _ => _paragraph(text, theme),
    };
  }

  pw.Widget _heading(String text, double fontSize) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(top: 18, bottom: 10),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: fontSize,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }

  pw.Widget _paragraph(String text, BookThemeConfig theme) {
    if (text.isEmpty) {
      return pw.SizedBox.shrink();
    }

    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: theme.fontSize,
          lineSpacing: theme.fontSize * (theme.lineHeight - 1),
        ),
      ),
    );
  }

  pw.Widget _blockquote(String text, BookThemeConfig theme) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 12),
      padding: const pw.EdgeInsets.only(left: 12, top: 8, bottom: 8),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          left: pw.BorderSide(width: 3),
        ),
      ),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: theme.fontSize,
          fontStyle: pw.FontStyle.italic,
        ),
      ),
    );
  }

  pw.Widget _codeBlock(String text) {
    return pw.Container(
      width: double.infinity,
      margin: const pw.EdgeInsets.only(bottom: 12),
      padding: const pw.EdgeInsets.all(12),
      decoration: const pw.BoxDecoration(
        color: PdfColors.grey200,
      ),
      child: pw.Text(
        text,
        style: const pw.TextStyle(
          font: pw.Font.courier(),
          fontSize: 10,
        ),
      ),
    );
  }

  pw.Widget _unorderedList(md.Element element) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        for (final child in element.children ?? <md.Node>[])
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 6),
            child: pw.Text('• ${child.textContent}'),
          ),
      ],
    );
  }

  pw.Widget _orderedList(md.Element element) {
    final children = element.children ?? <md.Node>[];

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        for (var index = 0; index < children.length; index++)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 6),
            child: pw.Text('${index + 1}. ${children[index].textContent}'),
          ),
      ],
    );
  }
}
```

---

# Step 5: make the first Flutter screen

In the app, your first real feature should be:

```txt
features/editor/
  application/
    book_editor_cubit.dart
    book_editor_state.dart
  presentation/
    editor_page.dart
```

For now, keep it simple. The screen should:

1. Create sample project.
2. Load project.
3. Show chapter list.
4. Edit selected chapter.
5. Show live Markdown preview.
6. Save chapter.
7. Preview PDF.

Do **not** add theme editor yet. Do **not** add EPUB yet.

---

# Step 6: add local package imports to app screen

Example minimal editor logic:

```dart
import 'dart:io';

import 'package:book_core/book_core.dart';
import 'package:book_exporters/book_exporters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:printing/printing.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  final controller = TextEditingController();

  BookProject? project;
  BookChapter? selectedChapter;

  final creator = BookProjectCreator();
  final loader = BookProjectLoader();
  final writer = BookProjectWriter();
  final exporter = PdfBookExporter();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> createAndLoadSampleProject() async {
    final rootPath = '${Directory.current.path}/sample_book';

    await creator.create(
      rootPath: rootPath,
      title: 'My First Book',
      author: 'Mostafa Khazaal',
    );

    final loadedProject = await loader.load(rootPath);
    final firstChapter = loadedProject.chapters.first;

    setState(() {
      project = loadedProject;
      selectedChapter = firstChapter;
      controller.text = firstChapter.markdown;
    });
  }

  Future<void> saveChapter() async {
    final currentProject = project;
    final chapter = selectedChapter;

    if (currentProject == null || chapter == null) {
      return;
    }

    await writer.saveChapter(
      rootPath: currentProject.rootPath,
      chapterPath: chapter.path,
      markdown: controller.text,
    );

    final reloadedProject = await loader.load(currentProject.rootPath);

    setState(() {
      project = reloadedProject;
      selectedChapter = reloadedProject.chapters.firstWhere(
        (item) => item.path == chapter.path,
      );
    });
  }

  Future<void> previewPdf() async {
    final currentProject = project;

    if (currentProject == null) {
      return;
    }

    await saveChapter();

    final reloadedProject = await loader.load(currentProject.rootPath);
    final bytes = await exporter.export(reloadedProject);

    if (!mounted) {
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
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentProject = project;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Markdown Book Publisher'),
        actions: [
          TextButton(
            onPressed: createAndLoadSampleProject,
            child: const Text('Create Sample'),
          ),
          TextButton(
            onPressed: saveChapter,
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: previewPdf,
            child: const Text('Preview PDF'),
          ),
        ],
      ),
      body: currentProject == null
          ? const Center(
              child: Text('Create a sample book project to start.'),
            )
          : Row(
              children: [
                SizedBox(
                  width: 240,
                  child: ListView(
                    children: [
                      for (final chapter in currentProject.chapters)
                        ListTile(
                          title: Text(chapter.title),
                          selected: chapter.path == selectedChapter?.path,
                          onTap: () {
                            setState(() {
                              selectedChapter = chapter;
                              controller.text = chapter.markdown;
                            });
                          },
                        ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: TextField(
                    controller: controller,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(24),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: Markdown(
                    data: controller.text,
                    padding: const EdgeInsets.all(24),
                  ),
                ),
              ],
            ),
    );
  }
}
```

---

# Step 7: run it

From the Flutter app:

```bash
cd apps/publisher_app
flutter pub get
flutter run -d macos
```

Or:

```bash
flutter run -d windows
```

Or:

```bash
flutter run -d linux
```

Desktop first is best for this product.

---

# Step 8: next milestones

After the first screen works, continue in this order:

```txt
1. Create sample book project
2. Load existing book project folder
3. Save selected markdown chapter
4. Live preview selected chapter
5. Preview generated PDF
6. Export PDF into output/
7. Add chapter
8. Rename/reorder chapters
9. Edit book.config.json visually
10. Add theme editor
11. Add HTML exporter
12. Add EPUB exporter
13. Add CLI app
```

Your immediate next task is:

```txt
Implement book_core first.
Then implement PDF exporter.
Then connect one simple Flutter editor page.
```

Do not start with EPUB. Do not start with advanced UI. Get this loop working first:

```txt
Create project → edit markdown → live preview → save → preview PDF
```

[1]: https://cli.vgv.dev/docs/templates/core "Flutter Starter App (Core)  | Very Good CLI"
[2]: https://pub.dev/packages/pdf "pdf | Dart package"
[3]: https://pub.dev/packages/printing "printing | Flutter package"
