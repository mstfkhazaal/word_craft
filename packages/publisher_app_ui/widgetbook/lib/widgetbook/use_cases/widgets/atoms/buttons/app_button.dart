import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Primary [AppButton] use case.
@widgetbook.UseCase(name: 'primary', type: AppButton)
Widget primary(BuildContext context) => Center(
  child: AppButton(
    onPressed: () {},
    child: const Text('Primary'),
  ),
);

/// Secondary [AppButton] use case.
@widgetbook.UseCase(name: 'secondary', type: AppButton)
Widget secondary(BuildContext context) => Center(
  child: AppButton(
    onPressed: () {},
    variant: AppButtonVariant.secondary,
    child: const Text('Secondary'),
  ),
);

/// Outline [AppButton] use case.
@widgetbook.UseCase(name: 'outline', type: AppButton)
Widget outline(BuildContext context) => Center(
  child: AppButton(
    onPressed: () {},
    variant: AppButtonVariant.outline,
    child: const Text('Outline'),
  ),
);

/// Disabled [AppButton] use case.
@widgetbook.UseCase(name: 'disabled', type: AppButton)
Widget disabled(BuildContext context) => const Center(
  child: AppButton(
    onPressed: null,
    child: Text('Disabled'),
  ),
);

/// All sizes [AppButton] use case.
@widgetbook.UseCase(name: 'all sizes', type: AppButton)
Widget allSizes(BuildContext context) {
  final spacing = context.appSpacing;

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing.sm,
      children: [
        for (final size in AppButtonSize.values)
          AppButton(
            onPressed: () {},
            size: size,
            child: Text(size.name),
          ),
      ],
    ),
  );
}

/// Full [AppButton] variant and size matrix.
@widgetbook.UseCase(name: 'matrix', type: AppButton)
Widget matrix(BuildContext context) {
  final spacing = context.appSpacing;

  return SingleChildScrollView(
    padding: EdgeInsets.all(spacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enabled',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: spacing.md),
        const _ButtonMatrix(enabled: true),
        SizedBox(height: spacing.xl),
        Text(
          'Disabled',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: spacing.md),
        const _ButtonMatrix(enabled: false),
      ],
    ),
  );
}

class _ButtonMatrix extends StatelessWidget {
  const _ButtonMatrix({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Wrap(
      spacing: spacing.lg,
      runSpacing: spacing.lg,
      children: [
        for (final variant in AppButtonVariant.values)
          _ButtonVariantColumn(
            variant: variant,
            enabled: enabled,
          ),
      ],
    );
  }
}

class _ButtonVariantColumn extends StatelessWidget {
  const _ButtonVariantColumn({
    required this.variant,
    required this.enabled,
  });

  final AppButtonVariant variant;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing.sm,
      children: [
        Text(
          variant.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        for (final size in AppButtonSize.values)
          AppButton(
            onPressed: enabled ? () {} : null,
            variant: variant,
            size: size,
            child: Text(size.name),
          ),
      ],
    );
  }
}
