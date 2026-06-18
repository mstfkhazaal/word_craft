import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Brand mark atom.
///
/// This widget renders only the Publisher mark. It does not render brand text,
/// tagline, layout, spacing, or localization.
class AppBrandLogo extends StatelessWidget {
  /// Creates a brand mark atom.
  const AppBrandLogo({
    this.size = 56,
    this.color,
    this.semanticLabel,
    super.key,
  });

  /// Square logo size.
  final double size;

  /// Optional monochrome tint.
  final Color? color;

  /// Optional semantic label for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final mark = SizedBox.square(
      dimension: size,
      child: FittedBox(
        child: Assets.images.logos.publisherLogo.svg(
          package: ConstantText.packageName,
        ),
      ),
    );

    final child = color == null
        ? mark
        : ColorFiltered(
            colorFilter: ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            ),
            child: mark,
          );

    if (semanticLabel == null) {
      return ExcludeSemantics(child: child);
    }

    return Semantics(
      image: true,
      label: semanticLabel,
      child: child,
    );
  }
}
