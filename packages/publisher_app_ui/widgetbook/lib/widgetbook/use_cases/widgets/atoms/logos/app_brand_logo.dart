import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Default [AppBrandLogo] use case.
@widgetbook.UseCase(name: 'default', type: AppBrandLogo)
Widget defaultLogo(BuildContext context) {
  return const Center(
    child: AppBrandLogo(),
  );
}

/// [AppBrandLogo] size variants.
@widgetbook.UseCase(name: 'sizes', type: AppBrandLogo)
Widget logoSizes(BuildContext context) {
  final spacing = context.appSpacing;

  return Center(
    child: Wrap(
      spacing: spacing.xl,
      runSpacing: spacing.xl,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: const [
        _LogoSizePreview(size: 32),
        _LogoSizePreview(size: 48),
        _LogoSizePreview(size: 56),
        _LogoSizePreview(size: 72),
        _LogoSizePreview(size: 96),
      ],
    ),
  );
}

/// [AppBrandLogo] color variants.
@widgetbook.UseCase(name: 'colors', type: AppBrandLogo)
Widget logoColors(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  final colors = context.appColors;
  final spacing = context.appSpacing;

  return Center(
    child: Wrap(
      spacing: spacing.xl,
      runSpacing: spacing.xl,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const _LogoColorPreview(label: 'Default'),
        _LogoColorPreview(
          label: 'Primary',
          color: colorScheme.primary,
        ),
        _LogoColorPreview(
          label: 'Success',
          color: colors.success,
        ),
        _LogoColorPreview(
          label: 'Warning',
          color: colors.warning,
        ),
        _LogoColorPreview(
          label: 'Info',
          color: colors.info,
        ),
      ],
    ),
  );
}

class _LogoSizePreview extends StatelessWidget {
  const _LogoSizePreview({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBrandLogo(size: size),
        SizedBox(height: spacing.sm),
        Text('${size.toStringAsFixed(0)} px'),
      ],
    );
  }
}

class _LogoColorPreview extends StatelessWidget {
  const _LogoColorPreview({
    required this.label,
    this.color,
  });

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBrandLogo(
          size: 72,
          color: color,
        ),
        SizedBox(height: spacing.sm),
        Text(label),
      ],
    );
  }
}
