import 'package:publisher_app_ui/publisher_app_ui.dart';

/// {@template app_theme}
/// Composes [ThemeData] with [ColorScheme.fromSeed] and custom
/// [ThemeExtension]s for light and dark variants.
/// {@endtemplate}
class AppTheme {
  /// Primary brand color.
  static const Color primaryColor = Color(0xFF4F46E5);

  /// The light [ThemeData].
  static ThemeData get light {
    return _buildTheme(
      brightness: Brightness.light,
      typography: AppTypography.ltr(),
    );
  }

  /// The dark [ThemeData].
  static ThemeData get dark {
    return _buildTheme(
      brightness: Brightness.dark,
      typography: AppTypography.ltr(),
    );
  }

  /// Light RTL [ThemeData].
  static ThemeData get lightRtl {
    return _buildTheme(
      brightness: Brightness.light,
      typography: AppTypography.rtl(),
    );
  }

  /// Dark RTL [ThemeData].
  static ThemeData get darkRtl {
    return _buildTheme(
      brightness: Brightness.dark,
      typography: AppTypography.rtl(),
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required AppTypography typography,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: brightness,
    );

    final appColors = switch (brightness) {
      Brightness.light => const AppColors(
        success: Color(0xFF16A34A),
        onSuccess: Color(0xFFFFFFFF),
        warning: Color(0xFFCA8A04),
        onWarning: Color(0xFFFFFFFF),
        info: Color(0xFF2563EB),
        onInfo: Color(0xFFFFFFFF),
      ),
      Brightness.dark => const AppColors(
        success: Color(0xFF4ADE80),
        onSuccess: Color(0xFF1C1B1F),
        warning: Color(0xFFFACC15),
        onWarning: Color(0xFF1C1B1F),
        info: Color(0xFF60A5FA),
        onInfo: Color(0xFF1C1B1F),
      ),
    };

    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: typography.fontFamily,
      package: 'publisher_app_ui',
      textTheme: typography.toTextTheme(),
      extensions: [
        appColors,
        const AppSpacing(),
        const AppRadius(),
        const AppSize(),
        typography,
      ],
    );
  }
}
