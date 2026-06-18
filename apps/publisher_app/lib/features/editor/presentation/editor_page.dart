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
