import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Semantic app color tokens.
@widgetbook.UseCase(name: 'semantic colors', type: AppColors)
Widget semanticColors(BuildContext context) {
  final colors = context.appColors;

  return _TokenGrid(
    children: [
      _ColorTokenCard(
        name: 'success',
        color: colors.success,
        foregroundColor: colors.onSuccess,
      ),
      _ColorTokenCard(
        name: 'onSuccess',
        color: colors.onSuccess,
        foregroundColor: colors.success,
      ),
      _ColorTokenCard(
        name: 'warning',
        color: colors.warning,
        foregroundColor: colors.onWarning,
      ),
      _ColorTokenCard(
        name: 'onWarning',
        color: colors.onWarning,
        foregroundColor: colors.warning,
      ),
      _ColorTokenCard(
        name: 'info',
        color: colors.info,
        foregroundColor: colors.onInfo,
      ),
      _ColorTokenCard(
        name: 'onInfo',
        color: colors.onInfo,
        foregroundColor: colors.info,
      ),
    ],
  );
}

/// Material color scheme tokens.
@widgetbook.UseCase(name: 'material color scheme', type: AppColors)
Widget materialColorScheme(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  return _TokenGrid(
    children: [
      _ColorTokenCard(
        name: 'primary',
        color: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      _ColorTokenCard(
        name: 'onPrimary',
        color: colorScheme.onPrimary,
        foregroundColor: colorScheme.primary,
      ),
      _ColorTokenCard(
        name: 'secondary',
        color: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
      ),
      _ColorTokenCard(
        name: 'onSecondary',
        color: colorScheme.onSecondary,
        foregroundColor: colorScheme.secondary,
      ),
      _ColorTokenCard(
        name: 'surface',
        color: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      _ColorTokenCard(
        name: 'onSurface',
        color: colorScheme.onSurface,
        foregroundColor: colorScheme.surface,
      ),
      _ColorTokenCard(
        name: 'error',
        color: colorScheme.error,
        foregroundColor: colorScheme.onError,
      ),
      _ColorTokenCard(
        name: 'onError',
        color: colorScheme.onError,
        foregroundColor: colorScheme.error,
      ),
    ],
  );
}

class _TokenGrid extends StatelessWidget {
  const _TokenGrid({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SingleChildScrollView(
      padding: EdgeInsets.all(spacing.lg),
      child: Wrap(
        spacing: spacing.md,
        runSpacing: spacing.md,
        children: children,
      ),
    );
  }
}

class _ColorTokenCard extends StatelessWidget {
  const _ColorTokenCard({
    required this.name,
    required this.color,
    required this.foregroundColor,
  });

  final String name;
  final Color color;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      label: '$name color token',
      child: Container(
        width: 180,
        height: 112,
        padding: EdgeInsets.all(spacing.md),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        child: DefaultTextStyle(
          style: textTheme.bodyMedium!.copyWith(color: foregroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                name,
                style: textTheme.titleSmall?.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: spacing.xxs),
              Text(_colorToHex(color)),
            ],
          ),
        ),
      ),
    );
  }

  String _colorToHex(Color color) {
    final value = color.toARGB32().toRadixString(16).padLeft(8, '0');
    return '#${value.substring(2).toUpperCase()}';
  }
}
