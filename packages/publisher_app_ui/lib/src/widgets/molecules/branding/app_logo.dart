import 'package:publisher_app_ui/publisher_app_ui.dart';

enum AppLogoLayout {
  mark,
  label,
  horizontal,
  vertical,
  compact,
}

/// Publisher logo molecule.
///
/// This is a convenience brand component.
/// It does not resolve translations internally.
/// Pass translated text from the app/widgetbook layer.
class AppLogo extends StatelessWidget {
  const AppLogo(
    this.appName, {
    this.layout = AppLogoLayout.horizontal,
    this.logoSize = 56,
    this.center = false,
    this.color,
    this.appTagline,
    this.nameColor,
    this.taglineColor,
    super.key,
  });

  const AppLogo.mark(
    this.appName, {
    this.logoSize = 56,
    this.center = false,
    this.color,
    this.appTagline,
    this.nameColor,
    this.taglineColor,
    super.key,
  }) : layout = AppLogoLayout.mark;

  const AppLogo.label(
    this.appName, {
    this.logoSize = 56,
    this.center = false,
    this.color,
    this.appTagline,
    this.nameColor,
    this.taglineColor,
    super.key,
  }) : layout = AppLogoLayout.label;

  const AppLogo.horizontal(
    this.appName, {
    this.logoSize = 56,
    this.center = false,
    this.color,
    this.appTagline,
    this.nameColor,
    this.taglineColor,
    super.key,
  }) : layout = AppLogoLayout.horizontal;

  const AppLogo.vertical(
    this.appName, {
    this.logoSize = 72,
    this.center = true,
    this.color,
    this.appTagline,
    this.nameColor,
    this.taglineColor,
    super.key,
  }) : layout = AppLogoLayout.vertical;

  const AppLogo.compact(
    this.appName, {
    this.logoSize = 40,
    this.center = false,
    this.color,
    this.appTagline,
    this.nameColor,
    this.taglineColor,
    super.key,
  }) : layout = AppLogoLayout.compact;

  final String appName;
  final String? appTagline;
  final AppLogoLayout layout;
  final double logoSize;
  final bool center;
  final Color? color;
  final Color? nameColor;
  final Color? taglineColor;

  @override
  Widget build(BuildContext context) {
    final alignment = center
        ? AlignmentDirectional.center
        : AlignmentDirectional.centerStart;

    if (layout == AppLogoLayout.mark) {
      return Align(
        alignment: alignment,
        child: Semantics(
          image: true,
          label: appName,
          child: AppBrandLogo(
            size: logoSize,
            color: color,
          ),
        ),
      );
    }

    final isVertical = layout == AppLogoLayout.vertical;
    final isLabelOnly = layout == AppLogoLayout.label;
    final isCompact = layout == AppLogoLayout.compact;

    return AppBrandHeader(
      logo: AppBrandLogo(
        size: isCompact ? 40 : logoSize,
        color: color,
      ),
      name: appName,
      tagline: isLabelOnly ? null : appTagline,
      logoSize: isCompact ? 40 : logoSize,
      direction: isVertical
          ? AppBrandHeaderDirection.vertical
          : AppBrandHeaderDirection.horizontal,
      alignment: alignment,
      textAlign: isVertical ? TextAlign.center : TextAlign.start,
      spacing: isCompact ? context.appSpacing.xs : context.appSpacing.sm,
      nameColor: nameColor,
      taglineColor: taglineColor,
    );
  }
}
