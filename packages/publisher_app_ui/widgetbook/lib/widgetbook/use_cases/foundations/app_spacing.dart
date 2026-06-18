import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// App spacing scale tokens.
@widgetbook.UseCase(name: 'spacing scale', type: AppSpacing)
Widget spacingScale(BuildContext context) {
  final spacing = context.appSpacing;

  final tokens = [
    _SpacingToken(name: 'xxs', value: spacing.xxs),
    _SpacingToken(name: 'xs', value: spacing.xs),
    _SpacingToken(name: 'sm', value: spacing.sm),
    _SpacingToken(name: 'md', value: spacing.md),
    _SpacingToken(name: 'lg', value: spacing.lg),
    _SpacingToken(name: 'xl', value: spacing.xl),
    _SpacingToken(name: 'xxl', value: spacing.xxl),
  ];

  return SingleChildScrollView(
    padding: EdgeInsets.all(spacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spacing Scale',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: spacing.md),
        for (final token in tokens) ...[
          _SpacingTokenRow(token: token),
          SizedBox(height: spacing.sm),
        ],
      ],
    ),
  );
}

/// App spacing layout preview.
@widgetbook.UseCase(name: 'layout preview', type: AppSpacing)
Widget spacingLayoutPreview(BuildContext context) {
  final spacing = context.appSpacing;
  final colorScheme = Theme.of(context).colorScheme;

  return SingleChildScrollView(
    padding: EdgeInsets.all(spacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Layout Preview',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: spacing.md),
        Container(
          padding: EdgeInsets.all(spacing.md),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PreviewBlock(label: 'Header', height: 48),
              SizedBox(height: spacing.md),
              Row(
                children: [
                  const Expanded(
                    child: _PreviewBlock(label: 'Content', height: 160),
                  ),
                  SizedBox(width: spacing.md),
                  const SizedBox(
                    width: 120,
                    child: _PreviewBlock(label: 'Side', height: 160),
                  ),
                ],
              ),
              SizedBox(height: spacing.md),
              const _PreviewBlock(label: 'Footer', height: 48),
            ],
          ),
        ),
      ],
    ),
  );
}

class _SpacingToken {
  const _SpacingToken({
    required this.name,
    required this.value,
  });

  final String name;
  final double value;
}

class _SpacingTokenRow extends StatelessWidget {
  const _SpacingTokenRow({required this.token});

  final _SpacingToken token;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final spacing = context.appSpacing;

    return Row(
      children: [
        SizedBox(
          width: 72,
          child: Text(
            token.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          width: 64,
          child: Text('${token.value.toStringAsFixed(0)} px'),
        ),
        SizedBox(width: spacing.md),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Semantics(
              label: '${token.name} spacing token, ${token.value}px',
              child: Container(
                width: token.value,
                height: 32,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PreviewBlock extends StatelessWidget {
  const _PreviewBlock({
    required this.label,
    required this.height,
  });

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Text(label),
    );
  }
}
