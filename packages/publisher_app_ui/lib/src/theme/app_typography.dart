import 'package:publisher_app_ui/publisher_app_ui.dart';

/// {@template app_typography}
/// Typography tokens for Publisher App UI.
///
/// Uses Inter for LTR layouts and IBM Plex Sans Arabic for RTL layouts.
/// {@endtemplate}
class AppTypography extends ThemeExtension<AppTypography> {
  /// {@macro app_typography}
  const AppTypography({
    required this.fontFamily,
    required this.display,
    required this.heading,
    required this.title,
    required this.body,
    required this.caption,
    required this.label,
    required this.button,
    required this.error,
  });

  /// Resolves typography from [TextDirection].
  factory AppTypography.resolve(TextDirection textDirection) {
    return switch (textDirection) {
      TextDirection.rtl => AppTypography.rtl(),
      TextDirection.ltr => AppTypography.ltr(),
    };
  }

  /// LTR typography using Inter.
  factory AppTypography.ltr() {
    return const AppTypography._(
      fontFamily: FontFamily.inter,
    );
  }

  /// RTL typography using IBM Plex Sans Arabic.
  factory AppTypography.rtl() {
    return const AppTypography._(
      fontFamily: FontFamily.iBMPlexSansArabic,
    );
  }

  const AppTypography._({
    required this.fontFamily,
  }) : display = const TextStyle(
         fontSize: 36,
         height: 1.2,
         fontWeight: FontWeight.w700,
       ),
       heading = const TextStyle(
         fontSize: 28,
         height: 1.25,
         fontWeight: FontWeight.w700,
       ),
       title = const TextStyle(
         fontSize: 20,
         height: 1.3,
         fontWeight: FontWeight.w600,
       ),
       body = const TextStyle(
         fontSize: 16,
         height: 1.5,
         fontWeight: FontWeight.w400,
       ),
       caption = const TextStyle(
         fontSize: 12,
         height: 1.4,
         fontWeight: FontWeight.w400,
       ),
       label = const TextStyle(
         fontSize: 14,
         height: 1.4,
         fontWeight: FontWeight.w600,
       ),
       button = const TextStyle(
         fontSize: 14,
         height: 1.2,
         fontWeight: FontWeight.w600,
       ),
       error = const TextStyle(
         fontSize: 12,
         height: 1.4,
         fontWeight: FontWeight.w500,
       );

  /// Font family used by this typography set.
  final String fontFamily;

  /// Large display text.
  final TextStyle display;

  /// Page or section heading text.
  final TextStyle heading;

  /// Card, dialog, or content title text.
  final TextStyle title;

  /// Default body text.
  final TextStyle body;

  /// Caption and helper text.
  final TextStyle caption;

  /// Form label or metadata label text.
  final TextStyle label;

  /// Button text.
  final TextStyle button;

  /// Error and validation message text.
  final TextStyle error;

  /// Converts app typography tokens into a Material [TextTheme].
  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: display.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
      headlineSmall: heading.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
      titleLarge: title.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
      bodyMedium: body.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
      bodySmall: caption.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
      labelLarge: label.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
      labelMedium: button.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
      labelSmall: caption.copyWith(
        fontFamily: fontFamily,
        package: ConstantText.packageName,
      ),
    );
  }

  @override
  AppTypography copyWith({
    String? fontFamily,
    TextStyle? display,
    TextStyle? heading,
    TextStyle? title,
    TextStyle? body,
    TextStyle? caption,
    TextStyle? label,
    TextStyle? button,
    TextStyle? error,
  }) {
    return AppTypography(
      fontFamily: fontFamily ?? this.fontFamily,
      display: display ?? this.display,
      heading: heading ?? this.heading,
      title: title ?? this.title,
      body: body ?? this.body,
      caption: caption ?? this.caption,
      label: label ?? this.label,
      button: button ?? this.button,
      error: error ?? this.error,
    );
  }

  @override
  AppTypography lerp(AppTypography? other, double t) {
    if (other is! AppTypography) return this;

    return AppTypography(
      fontFamily: t < 0.5 ? fontFamily : other.fontFamily,
      display: TextStyle.lerp(display, other.display, t)!,
      heading: TextStyle.lerp(heading, other.heading, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      error: TextStyle.lerp(error, other.error, t)!,
    );
  }
}
