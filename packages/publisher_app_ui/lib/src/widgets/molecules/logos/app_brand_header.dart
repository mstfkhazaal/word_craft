import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Layout direction for [AppBrandHeader].
enum AppBrandHeaderDirection {
  /// Logo beside text.
  horizontal,

  /// Logo above text.
  vertical,
}

/// Brand header molecule.
///
/// Composes a logo widget, brand name, and optional tagline. This component is
/// generic and does not know about translations, routing, or app state.
class AppBrandHeader extends StatelessWidget {
  /// Creates a brand header molecule.
  const AppBrandHeader({
    required this.logo,
    required this.name,
    this.tagline,
    this.logoSize = 56,
    this.direction = AppBrandHeaderDirection.horizontal,
    this.alignment = AlignmentDirectional.centerStart,
    this.textAlign = TextAlign.start,
    this.spacing,
    this.nameColor,
    this.taglineColor,
    super.key,
  });

  /// Logo widget, usually [AppBrandLogo].
  final Widget logo;

  /// Brand name.
  final String name;

  /// Optional brand tagline or short description.
  final String? tagline;

  /// Reserved logo box size.
  final double logoSize;

  /// Header layout direction.
  final AppBrandHeaderDirection direction;

  /// Alignment of the whole brand header.
  final AlignmentGeometry alignment;

  /// Text alignment for the name and tagline.
  final TextAlign textAlign;

  /// Spacing between logo and text.
  final double? spacing;

  /// Optional brand name color.
  final Color? nameColor;

  /// Optional tagline color.
  final Color? taglineColor;

  @override
  Widget build(BuildContext context) {
    final resolvedSpacing = spacing ?? context.appSpacing.sm;
    final content = switch (direction) {
      AppBrandHeaderDirection.horizontal => _HorizontalBrandHeader(
        logo: logo,
        name: name,
        tagline: tagline,
        logoSize: logoSize,
        spacing: resolvedSpacing,
        textAlign: textAlign,
        nameColor: nameColor,
        taglineColor: taglineColor,
      ),
      AppBrandHeaderDirection.vertical => _VerticalBrandHeader(
        logo: logo,
        name: name,
        tagline: tagline,
        logoSize: logoSize,
        spacing: resolvedSpacing,
        textAlign: textAlign,
        nameColor: nameColor,
        taglineColor: taglineColor,
      ),
    };

    return Align(
      alignment: alignment,
      child: content,
    );
  }
}

class _HorizontalBrandHeader extends StatelessWidget {
  const _HorizontalBrandHeader({
    required this.logo,
    required this.name,
    required this.tagline,
    required this.logoSize,
    required this.spacing,
    required this.textAlign,
    required this.nameColor,
    required this.taglineColor,
  });

  final Widget logo;
  final String name;
  final String? tagline;
  final double logoSize;
  final double spacing;
  final TextAlign textAlign;
  final Color? nameColor;
  final Color? taglineColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: logoSize,
          child: FittedBox(child: logo),
        ),
        SizedBox(width: spacing),
        Flexible(
          child: _BrandTextBlock(
            name: name,
            tagline: tagline,
            logoSize: logoSize,
            textAlign: textAlign,
            nameColor: nameColor,
            taglineColor: taglineColor,
          ),
        ),
      ],
    );
  }
}

class _VerticalBrandHeader extends StatelessWidget {
  const _VerticalBrandHeader({
    required this.logo,
    required this.name,
    required this.tagline,
    required this.logoSize,
    required this.spacing,
    required this.textAlign,
    required this.nameColor,
    required this.taglineColor,
  });

  final Widget logo;
  final String name;
  final String? tagline;
  final double logoSize;
  final double spacing;
  final TextAlign textAlign;
  final Color? nameColor;
  final Color? taglineColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: logoSize,
          child: FittedBox(child: logo),
        ),
        SizedBox(height: spacing),
        _BrandTextBlock(
          name: name,
          tagline: tagline,
          logoSize: logoSize,
          textAlign: textAlign,
          nameColor: nameColor,
          taglineColor: taglineColor,
        ),
      ],
    );
  }
}

class _BrandTextBlock extends StatelessWidget {
  const _BrandTextBlock({
    required this.name,
    required this.tagline,
    required this.logoSize,
    required this.textAlign,
    required this.nameColor,
    required this.taglineColor,
  });

  final String name;
  final String? tagline;
  final double logoSize;
  final TextAlign textAlign;
  final Color? nameColor;
  final Color? taglineColor;

  @override
  Widget build(BuildContext context) {
    final isCentered = textAlign == TextAlign.center;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        AppBrandName(
          name,
          size: logoSize * 0.38,
          color: nameColor,
          textAlign: textAlign,
        ),
        if (tagline != null && tagline!.trim().isNotEmpty) ...[
          SizedBox(height: context.appSpacing.xxs),
          AppBrandTagline(
            tagline!,
            size: logoSize * 0.17,
            color: taglineColor,
            textAlign: textAlign,
          ),
        ],
      ],
    );
  }
}
