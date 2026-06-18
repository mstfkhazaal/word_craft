import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Layout variants for [AppLogo].
enum AppLogoLayout {
  /// Logo mark only.
  mark,

  /// Logo mark with app name only.
  label,

  /// Horizontal logo with app name and optional tagline.
  horizontal,

  /// Vertical logo with app name and optional tagline.
  vertical,

  /// Compact horizontal logo.
  compact,
}

/// Publisher logo molecule.
///
/// This is a brand-specific shortcut around [AppBrandLogo] and
/// [AppBrandHeader]. It does not resolve translations internally. Pass
/// translated strings from the app or Widgetbook layer.
class AppLogo extends StatelessWidget {
  /// Creates a logo with a configurable [layout].
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

  /// Logo mark only.
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

  /// Logo mark with app name only.
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

  /// Horizontal logo with app name and optional tagline.
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

  /// Vertical logo with app name and optional tagline.
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

  /// Compact horizontal logo.
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

  /// App or product name.
  final String appName;

  /// Optional tagline.
  final String? appTagline;

  /// Logo layout.
  final AppLogoLayout layout;

  /// Logo mark size.
  final double logoSize;

  /// Whether to center the full logo composition.
  final bool center;

  /// Optional color override for the mark.
  final Color? color;

  /// Optional brand name color.
  final Color? nameColor;

  /// Optional tagline color.
  final Color? taglineColor;

  @override
  Widget build(BuildContext context) {
    final alignment = center
        ? AlignmentDirectional.center
        : AlignmentDirectional.centerStart;

    if (layout == AppLogoLayout.mark) {
      return Align(
        alignment: alignment,
        child: AppBrandLogo(
          size: logoSize,
          color: color,
          semanticLabel: appName,
        ),
      );
    }

    final isCompact = layout == AppLogoLayout.compact;
    final isVertical = layout == AppLogoLayout.vertical;
    final isLabelOnly = layout == AppLogoLayout.label;
    final resolvedLogoSize = isCompact ? context.appSize.logoSm : logoSize;

    return AppBrandHeader(
      logo: AppBrandLogo(
        size: resolvedLogoSize,
        color: color,
        semanticLabel: appName,
      ),
      name: appName,
      tagline: isLabelOnly ? null : appTagline,
      logoSize: resolvedLogoSize,
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
