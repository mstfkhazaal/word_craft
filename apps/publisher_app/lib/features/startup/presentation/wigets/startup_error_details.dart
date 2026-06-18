import 'package:publisher_app_ui/publisher_app_ui.dart';

class StartupErrorDetails extends StatefulWidget {
  const StartupErrorDetails({
    required this.error,
    super.key,
  });

  final String error;

  @override
  State<StartupErrorDetails> createState() => _StartupErrorDetailsState();
}

class _StartupErrorDetailsState extends State<StartupErrorDetails> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(radius.md),
        border: Border.all(
          color: colorScheme.error.withValues(alpha: 0.28),
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 240),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            primary: false,
            padding: EdgeInsets.all(spacing.md),
            child: SelectableText(
              widget.error,
              textAlign: TextAlign.start,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
                height: 1.45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
