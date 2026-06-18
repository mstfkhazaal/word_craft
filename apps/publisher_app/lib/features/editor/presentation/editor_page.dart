import 'package:auto_route/auto_route.dart';
import 'package:book_core/book_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:printing/printing.dart';
import 'package:publisher_app/features/editor/application/book_editor_cubit.dart';
import 'package:publisher_app/features/editor/application/book_editor_state.dart';

@RoutePage()
class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  Future<void> _previewPdf(BuildContext context) async {
    final bytes = await context.read<BookEditorCubit>().buildPdfPreview();

    if (bytes == null || !context.mounted) {
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
              canChangeOrientation: false,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookEditorCubit, BookEditorState>(
      listener: (context, state) {
        final error = state.errorMessage;

        if (error == null) {
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      builder: (context, state) {
        final project = state.project;

        return Scaffold(
          appBar: AppBar(
            title: Text(project?.config.title ?? 'Word Craft'),
            leading: IconButton(
              onPressed: () => context.router.maybePop(),
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              TextButton.icon(
                onPressed: state.canSave
                    ? () => context.read<BookEditorCubit>().saveMarkBook()
                    : null,
                icon: const Icon(Icons.save_outlined),
                label: const Text('Save'),
              ),
              TextButton.icon(
                onPressed: project == null ? null : () => _previewPdf(context),
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: const Text('Preview PDF'),
              ),
              const SizedBox(width: 12),
            ],
          ),
          body: project == null
              ? const Center(
            child: Text('Open or create a .markbook first.'),
          )
              : _EditorLayout(
            project: project,
            state: state,
          ),
        );
      },
    );
  }
}

class _EditorLayout extends StatelessWidget {
  const _EditorLayout({
    required this.project,
    required this.state,
  });

  final BookProject project;
  final BookEditorState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ChapterSidebar(
          chapters: project.chapters,
          selectedChapter: state.selectedChapter,
        ),
        const VerticalDivider(width: 1),
        const Expanded(
          child: _MarkdownEditorPane(),
        ),
        const VerticalDivider(width: 1),
        const Expanded(
          child: _MarkdownPreviewPane(),
        ),
      ],
    );
  }
}

class _ChapterSidebar extends StatelessWidget {
  const _ChapterSidebar({
    required this.chapters,
    required this.selectedChapter,
  });

  final List<BookChapter> chapters;
  final BookChapter? selectedChapter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                'Chapters',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (final chapter in chapters)
              ListTile(
                title: Text(chapter.title),
                subtitle: Text(chapter.path),
                selected: chapter.path == selectedChapter?.path,
                onTap: () {
                  context.read<BookEditorCubit>().selectChapter(chapter);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _MarkdownEditorPane extends StatefulWidget {
  const _MarkdownEditorPane();

  @override
  State<_MarkdownEditorPane> createState() => _MarkdownEditorPaneState();
}

class _MarkdownEditorPaneState extends State<_MarkdownEditorPane> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookEditorCubit, BookEditorState>(
      listenWhen: (previous, current) {
        return previous.selectedChapter?.path != current.selectedChapter?.path ||
            previous.markdownDraft != current.markdownDraft;
      },
      listener: (context, state) {
        if (controller.text == state.markdownDraft) {
          return;
        }

        controller.value = TextEditingValue(
          text: state.markdownDraft,
          selection: TextSelection.collapsed(
            offset: state.markdownDraft.length,
          ),
        );
      },
      child: TextField(
        controller: controller,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
          height: 1.55,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(24),
          hintText: 'Write Markdown...',
        ),
        onChanged: context.read<BookEditorCubit>().updateMarkdownDraft,
      ),
    );
  }
}

class _MarkdownPreviewPane extends StatelessWidget {
  const _MarkdownPreviewPane();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BookEditorCubit, BookEditorState>(
      builder: (context, state) {
        return Markdown(
          data: state.markdownDraft,
          padding: const EdgeInsets.all(32),
        );
      },
    );
  }
}
