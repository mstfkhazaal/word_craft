import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_catalog/core/i18n/translations.g.dart';

/// Logo mark only.
@widgetbook.UseCase(name: 'mark', type: AppLogo)
Widget mark(BuildContext context) {
  final brand = _BrandLogoKnobs.from(context);

  return Center(
    child: AppLogo.mark(
      brand.name,
      logoSize: brand.logoSize,
      color: brand.color,
    ),
  );
}

/// Logo with label only.
@widgetbook.UseCase(name: 'label', type: AppLogo)
Widget label(BuildContext context) {
  final brand = _BrandLogoKnobs.from(context);

  return Center(
    child: AppLogo.label(
      brand.name,
      logoSize: brand.logoSize,
      color: brand.color,
    ),
  );
}

/// Horizontal logo with label and optional tagline.
@widgetbook.UseCase(name: 'horizontal', type: AppLogo)
Widget horizontal(BuildContext context) {
  final brand = _BrandLogoKnobs.from(context);

  return Center(
    child: AppLogo.horizontal(
      brand.name,
      logoSize: brand.logoSize,
      color: brand.color,
      appTagline: brand.subtitle,
    ),
  );
}

/// Vertical logo with label and optional tagline.
@widgetbook.UseCase(name: 'vertical', type: AppLogo)
Widget vertical(BuildContext context) {
  final brand = _BrandLogoKnobs.from(context);

  return Center(
    child: AppLogo.vertical(
      brand.name,
      logoSize: brand.logoSize,
      color: brand.color,
      appTagline: brand.subtitle,
    ),
  );
}

/// Compact horizontal logo.
@widgetbook.UseCase(name: 'compact', type: AppLogo)
Widget compact(BuildContext context) {
  final brand = _BrandLogoKnobs.from(context);

  return SafeArea(
    child: Center(
      child: AppLogo.compact(
        brand.name,
        logoSize: brand.logoSize,
        color: brand.color,
        appTagline: brand.subtitle,
      ),
    ),
  );
}

/// Logo sizes.
@widgetbook.UseCase(name: 'sizes', type: AppLogo)
Widget sizes(BuildContext context) {
  final spacing = context.appSpacing;
  final brand = _BrandLogoKnobs.from(context);

  return Center(
    child: Wrap(
      spacing: spacing.xl,
      runSpacing: spacing.xl,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _LogoSizePreview(
          size: 32,
          subtitle: brand.subtitle,
        ),
        _LogoSizePreview(
          size: 40,
          subtitle: brand.subtitle,
        ),
        _LogoSizePreview(
          size: 56,
          subtitle: brand.subtitle,
        ),
        _LogoSizePreview(
          size: 72,
          subtitle: brand.subtitle,
        ),
        _LogoSizePreview(
          size: 96,
          subtitle: brand.subtitle,
        ),
      ],
    ),
  );
}

/// Logo variants matrix.
@widgetbook.UseCase(name: 'matrix', type: AppLogo)
Widget matrix(BuildContext context) {
  final spacing = context.appSpacing;
  final brand = _BrandLogoKnobs.from(context);
  final themeInfo = _ThemeDebugInfo.from(context);

  return SingleChildScrollView(
    padding: EdgeInsets.all(spacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ThemeDebugPanel(info: themeInfo),
        SizedBox(height: spacing.lg),
        Text(
          'AppLogo Variants',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: spacing.lg),
        _LogoSection(
          title: 'Mark',
          child: AppLogo.mark(
            brand.name,
            logoSize: brand.logoSize,
            color: brand.color,
          ),
        ),
        _LogoSection(
          title: 'Label',
          child: AppLogo.label(
            brand.name,
            logoSize: brand.logoSize,
            color: brand.color,
          ),
        ),
        _LogoSection(
          title: 'Horizontal',
          child: AppLogo.horizontal(
            brand.name,
            logoSize: brand.logoSize,
            color: brand.color,
            appTagline: brand.subtitle,
          ),
        ),
        _LogoSection(
          title: 'Horizontal without tagline',
          child: AppLogo.horizontal(
            brand.name,
            logoSize: brand.logoSize,
            color: brand.color,
          ),
        ),
        _LogoSection(
          title: 'Vertical',
          child: AppLogo.vertical(
            brand.name,
            logoSize: brand.logoSize,
            color: brand.color,
            appTagline: brand.subtitle,
          ),
        ),
        _LogoSection(
          title: 'Compact',
          child: AppLogo.compact(
            brand.name,
            logoSize: brand.logoSize,
            color: brand.color,
            appTagline: brand.subtitle,
          ),
        ),
      ],
    ),
  );
}

/// RTL logo preview.
///
/// Keep this use case only if you want a forced RTL test.
/// Your normal Arabic locale should already apply RTL from Widgetbook locale.
@widgetbook.UseCase(name: 'rtl', type: AppLogo)
Widget rtl(BuildContext context) {
  final brand = _BrandLogoKnobs.from(context);

  return Directionality(
    textDirection: TextDirection.rtl,
    child: Center(
      child: AppLogo.horizontal(
        brand.name,
        logoSize: brand.logoSize,
        color: brand.color,
        appTagline: brand.subtitle,
      ),
    ),
  );
}

/// Logo on primary surface.
@widgetbook.UseCase(name: 'on primary', type: AppLogo)
Widget onPrimary(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  final spacing = context.appSpacing;
  final brand = _BrandLogoKnobs.from(context);

  return Center(
    child: Container(
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: context.appRadius.lgBorder,
      ),
      child: AppLogo.horizontal(
        brand.name,
        logoSize: brand.logoSize,
        color: colorScheme.onPrimary,
        appTagline: brand.subtitle,
      ),
    ),
  );
}

/// Theme debug preview.
///
/// Use this to verify if Arabic is using RTL theme and English is using LTR.
@widgetbook.UseCase(name: 'theme debug', type: AppLogo)
Widget themeDebug(BuildContext context) {
  final info = _ThemeDebugInfo.from(context);

  return Center(
    child: _ThemeDebugPanel(info: info),
  );
}

class _LogoSizePreview extends StatelessWidget {
  const _LogoSizePreview({
    required this.size,
    required this.subtitle,
  });

  final double size;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final appName = Translations.of(context).app.name;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLogo.horizontal(
          appName,
          logoSize: size,
          appTagline: subtitle,
        ),
        SizedBox(height: spacing.sm),
        Text('${size.toStringAsFixed(0)} px'),
      ],
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: spacing.md),
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: context.appRadius.lgBorder,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.label(title),
          SizedBox(height: spacing.md),
          child,
        ],
      ),
    );
  }
}

class _BrandLogoKnobs {
  const _BrandLogoKnobs({
    required this.name,
    required this.subtitle,
    required this.logoSize,
    required this.color,
  });

  factory _BrandLogoKnobs.from(BuildContext context) {
    final translations = Translations.of(context);
    final knobs = context.knobs;

    final showSubtitle = knobs.boolean(
      label: 'Show subtitle',
      initialValue: true,
      description: 'Show either app tagline or app description under the logo.',
    );

    final useDescription = knobs.boolean(
      label: 'Use description instead of tagline',
      description: 'OFF = t.app.tagline, ON = t.app.description.',
    );

    final logoSize = knobs.double.slider(
      label: 'Logo size',
      initialValue: 56,
      min: 24,
      max: 120,
      divisions: 24,
    );

    final color = knobs.color(
      label: 'Logo color',
      initialValue: Theme.of(context).colorScheme.primary,
    );

    return _BrandLogoKnobs(
      name: translations.app.name,
      subtitle: showSubtitle
          ? useDescription
                ? translations.app.description
                : translations.app.tagline
          : null,
      logoSize: logoSize,
      color: color,
    );
  }

  final String name;
  final String? subtitle;
  final double logoSize;
  final Color? color;
}

class _ThemeDebugInfo {
  const _ThemeDebugInfo({
    required this.locale,
    required this.textDirection,
    required this.brightness,
    required this.expectedThemeName,
  });

  factory _ThemeDebugInfo.from(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final direction = Directionality.of(context);
    final brightness = Theme.of(context).brightness;
    final isRtl = direction == TextDirection.rtl;
    final isDark = brightness == Brightness.dark;

    final expectedThemeName = switch ((isDark, isRtl)) {
      (true, true) => 'AppTheme.darkRtl',
      (true, false) => 'AppTheme.dark',
      (false, true) => 'AppTheme.lightRtl',
      (false, false) => 'AppTheme.light',
    };

    return _ThemeDebugInfo(
      locale: locale,
      textDirection: direction,
      brightness: brightness,
      expectedThemeName: expectedThemeName,
    );
  }

  final Locale locale;
  final TextDirection textDirection;
  final Brightness brightness;
  final String expectedThemeName;
}

class _ThemeDebugPanel extends StatelessWidget {
  const _ThemeDebugPanel({
    required this.info,
  });

  final _ThemeDebugInfo info;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: context.appRadius.mdBorder,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: colorScheme.onSurface,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Debug',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: spacing.sm),
            Text('Locale: ${info.locale.toLanguageTag()}'),
            Text('Direction: ${info.textDirection.name}'),
            Text('Brightness: ${info.brightness.name}'),
            Text('Expected theme: ${info.expectedThemeName}'),
          ],
        ),
      ),
    );
  }
}
