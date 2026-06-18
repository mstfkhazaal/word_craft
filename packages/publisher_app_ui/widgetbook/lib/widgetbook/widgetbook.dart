import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_catalog/core/i18n/translations.g.dart';
import 'package:widgetbook_catalog/widgetbook/widgetbook.directories.g.dart';
import 'package:widgetbook_catalog/widgetbook/widgets/widgets.dart';

/// The Widgetbook catalog app.
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  /// Creates a [WidgetbookApp].
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      lightTheme: AppTheme.light,
      darkTheme: AppTheme.dark,
      addons: [
        LocalizationAddon(
          locales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
        ),
        BuilderAddon(
          name: 'Decorator',
          builder: (context, child) {
            return _WidgetbookLocaleThemeSync(
              child: UseCaseDecorator(child: child),
            );
          },
        ),
        /// @nodoc
        /// ignore: deprecated_member_use
        DeviceFrameAddon(
          devices: [
            ...Devices.ios.all,
            ...Devices.android.all,
            ...Devices.windows.all,
            ...Devices.macOS.all,
          ],
        ),
        InspectorAddon(),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: AppTheme.light,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: AppTheme.dark,
            ),
          ],
        ),
      ],
    );
  }
}

class _WidgetbookLocaleThemeSync extends StatefulWidget {
  const _WidgetbookLocaleThemeSync({
    required this.child,
  });

  final Widget child;

  @override
  State<_WidgetbookLocaleThemeSync> createState() =>
      _WidgetbookLocaleThemeSyncState();
}

class _WidgetbookLocaleThemeSyncState
    extends State<_WidgetbookLocaleThemeSync> {
  String? _lastLanguageTag;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    final languageTag = locale.toLanguageTag();

    if (_lastLanguageTag == languageTag) {
      return;
    }

    _lastLanguageTag = languageTag;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) {
        return;
      }

      await LocaleSettings.setLocaleRaw(languageTag);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isRtl = _isRtlLocale(locale);
    final currentTheme = Theme.of(context);
    final isDark = currentTheme.brightness == Brightness.dark;

    final theme = switch ((isDark, isRtl)) {
      (true, true) => AppTheme.darkRtl,
      (true, false) => AppTheme.dark,
      (false, true) => AppTheme.lightRtl,
      (false, false) => AppTheme.light,
    };

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Theme(
        data: theme,
        child: widget.child,
      ),
    );
  }

  bool _isRtlLocale(Locale locale) {
    return switch (locale.languageCode.toLowerCase()) {
      'ar' || 'fa' || 'he' || 'ur' => true,
      _ => false,
    };
  }
}
