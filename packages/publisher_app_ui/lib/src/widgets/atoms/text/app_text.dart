import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Semantic text variants for [AppText].
enum AppTextVariant {
  /// Large page or section heading.
  heading,

  /// Regular body text.
  body,

  /// Supporting or muted caption text.
  caption,

  /// Form or metadata label text.
  label,

  /// Error message text.
  error,

  /// Success message text.
  success,

  /// Warning message text.
  warning,

  /// Informational message text.
  info,

  /// Required field marker.
  requiredMark,
}

/// {@template app_text}
/// A semantic text atom that maps common product text patterns to the app theme.
/// {@endtemplate}
class AppText extends StatelessWidget {
  /// {@macro app_text}
  const AppText(
    this.data, {
    this.variant = AppTextVariant.body,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  });

  /// Heading text.
  const AppText.heading(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.heading;

  /// Body text.
  const AppText.body(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.body;

  /// Caption text.
  const AppText.caption(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.caption;

  /// Label text.
  const AppText.label(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.label;

  /// Error text.
  const AppText.error(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.error;

  /// Success text.
  const AppText.success(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.success;

  /// Warning text.
  const AppText.warning(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.warning;

  /// Info text.
  const AppText.info(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  }) : variant = AppTextVariant.info;

  /// Required field marker.
  const AppText.requiredMark({
    this.data = '*',
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel = 'required',
    super.key,
  }) : variant = AppTextVariant.requiredMark;

  /// Text value.
  final String data;

  /// Semantic text variant.
  final AppTextVariant variant;

  /// Optional style override.
  final TextStyle? style;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Maximum number of lines.
  final int? maxLines;

  /// Overflow behavior.
  final TextOverflow? overflow;

  /// Whether text should wrap.
  final bool? softWrap;

  /// Accessibility label.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = _resolveStyle(context).merge(style);

    return Text(
      data,
      style: resolvedStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
    );
  }

  TextStyle _resolveStyle(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final appColors = context.appColors;

    return switch (variant) {
      AppTextVariant.heading => textTheme.headlineSmall!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      AppTextVariant.body => textTheme.bodyMedium!.copyWith(
        color: colorScheme.onSurface,
      ),
      AppTextVariant.caption => textTheme.bodySmall!.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      AppTextVariant.label => textTheme.labelLarge!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      AppTextVariant.error => textTheme.bodySmall!.copyWith(
        color: colorScheme.error,
        fontWeight: FontWeight.w500,
      ),
      AppTextVariant.success => textTheme.bodySmall!.copyWith(
        color: appColors.success,
        fontWeight: FontWeight.w500,
      ),
      AppTextVariant.warning => textTheme.bodySmall!.copyWith(
        color: appColors.warning,
        fontWeight: FontWeight.w500,
      ),
      AppTextVariant.info => textTheme.bodySmall!.copyWith(
        color: appColors.info,
        fontWeight: FontWeight.w500,
      ),
      AppTextVariant.requiredMark => textTheme.labelLarge!.copyWith(
        color: colorScheme.error,
        fontWeight: FontWeight.w700,
      ),
    };
  }
}
