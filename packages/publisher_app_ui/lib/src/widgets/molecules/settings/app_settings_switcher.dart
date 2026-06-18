import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Small app settings switcher for theme and language.
///
/// This is UI-only. It does not persist settings and does not know about Slang,
/// Bloc, HydratedBloc, SharedPreferences, or routing.
class AppSettingsSwitcher extends StatelessWidget {
  const AppSettingsSwitcher({
    required this.themeMode,
    required this.localeLabel,
    required this.onToggleThemeMode,
    required this.onToggleLocale,
    this.themeTooltip,
    this.localeTooltip,
    this.showLabels = false,
    super.key,
  });

  final ThemeMode themeMode;
  final String localeLabel;
  final VoidCallback onToggleThemeMode;
  final VoidCallback onToggleLocale;
  final String? themeTooltip;
  final String? localeTooltip;
  final bool showLabels;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tooltip(
            message: themeTooltip ?? 'Theme',
            child: IconButton.filledTonal(
              onPressed: onToggleThemeMode,
              icon: Icon(_themeIcon),
            ),
          ),
          SizedBox(width: spacing.xs),
          Tooltip(
            message: localeTooltip ?? 'Language',
            child: OutlinedButton(
              onPressed: onToggleLocale,
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.onSurface,
                minimumSize: Size(
                  context.appSize.controlLg,
                  context.appSize.controlLg,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: spacing.sm,
                ),
              ),
              child: AppText.label(localeLabel),
            ),
          ),
        ],
      ),
    );
  }

  IconData get _themeIcon {
    return switch (themeMode) {
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
      ThemeMode.system => Icons.brightness_auto_outlined,
    };
  }
}
