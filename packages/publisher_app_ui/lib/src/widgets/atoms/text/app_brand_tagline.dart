import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Brand tagline text atom.
///
/// Use for a short brand tagline or compact brand description. It delegates
/// rendering to [AppText] to avoid a separate text system.
class AppBrandTagline extends StatelessWidget {
  /// Creates a brand tagline text atom.
  const AppBrandTagline(
    this.data, {
    this.size,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    super.key,
  });

  /// Text to display.
  final String data;

  /// Optional font size override.
  final double? size;

  /// Optional text color override.
  final Color? color;

  /// Text alignment.
  final TextAlign textAlign;

  /// Maximum number of visible lines.
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppText.label(
      data,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: context.appTypography.label.copyWith(
        color: color ?? colorScheme.onSurfaceVariant,
        fontSize: size,
        height: 1.1,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
