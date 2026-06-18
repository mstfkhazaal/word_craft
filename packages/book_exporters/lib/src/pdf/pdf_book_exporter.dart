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
    )

    ..addPage(
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
            style: const pw.TextStyle(
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
          style: const pw.TextStyle(
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
        style: pw.TextStyle(
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
