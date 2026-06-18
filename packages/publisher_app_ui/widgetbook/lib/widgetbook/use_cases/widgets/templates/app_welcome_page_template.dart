import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_catalog/core/i18n/translations.g.dart';

@widgetbook.UseCase(name: 'mobile', type: AppWelcomePageTemplate)
Widget mobileWelcomePage(BuildContext context) {
  return _WelcomePreviewFrame(
    width: 390,
    height: 844,
    child: _buildWelcomeTemplate(context),
  );
}

@widgetbook.UseCase(name: 'tablet', type: AppWelcomePageTemplate)
Widget tabletWelcomePage(BuildContext context) {
  return _WelcomePreviewFrame(
    width: 820,
    height: 1180,
    child: _buildWelcomeTemplate(context),
  );
}

@widgetbook.UseCase(name: 'desktop', type: AppWelcomePageTemplate)
Widget desktopWelcomePage(BuildContext context) {
  return _WelcomePreviewFrame(
    width: 1366,
    height: 768,
    child: _buildWelcomeTemplate(context),
  );
}

@widgetbook.UseCase(name: 'matrix', type: AppWelcomePageTemplate)
Widget welcomePageMatrix(BuildContext context) {
  final spacing = context.appSpacing;

  return SingleChildScrollView(
    padding: EdgeInsets.all(spacing.lg),
    child: Wrap(
      spacing: spacing.lg,
      runSpacing: spacing.lg,
      children: [
        _WelcomePreviewFrame(
          label: 'Mobile',
          width: 390,
          height: 700,
          child: _buildWelcomeTemplate(context),
        ),
        _WelcomePreviewFrame(
          label: 'Tablet',
          width: 760,
          height: 700,
          child: _buildWelcomeTemplate(context),
        ),
        _WelcomePreviewFrame(
          label: 'Desktop',
          width: 1100,
          height: 700,
          child: _buildWelcomeTemplate(context),
        ),
      ],
    ),
  );
}

AppWelcomePageTemplate _buildWelcomeTemplate(BuildContext context) {
  final translations = Translations.of(context);
  final knobs = context.knobs;

  final showTagline = knobs.boolean(
    label: 'Show brand tagline',
    initialValue: true,
  );

  final showSecondaryAction = knobs.boolean(
    label: 'Show secondary action',
    initialValue: true,
  );

  final showIllustration = knobs.boolean(
    label: 'Show illustration slider',
    initialValue: true,
  );

  final autoPlay = knobs.boolean(
    label: 'Auto play slider',
    initialValue: true,
  );

  return AppWelcomePageTemplate(
    brand: AppLogo.horizontal(
      translations.app.name,
      appTagline: showTagline ? translations.app.tagline : null,
    ),
    title: translations.welcome.title,
    description: translations.welcome.description,
    primaryAction: AppButton(
      onPressed: () {},
      size: AppButtonSize.large,
      child: Text(translations.welcome.actions.getStarted),
    ),
    secondaryAction: showSecondaryAction
        ? AppButton(
            onPressed: () {},
            variant: AppButtonVariant.outline,
            size: AppButtonSize.large,
            child: Text(translations.welcome.actions.signIn),
          )
        : null,
    illustration: showIllustration
        ? AppWelcomeIllustrationSlider(
            autoPlay: autoPlay,
            indicatorSemanticLabel:
                translations.welcome.slider.indicatorSemanticLabel,
            slides: _buildSlides(context, translations),
          )
        : null,
    footer: AppText.caption(
      translations.welcome.footer,
      textAlign: TextAlign.center,
    ),
  );
}

List<AppWelcomeSlide> _buildSlides(
  BuildContext context,
  Translations translations,
) {
  final welcome = translations.welcome;

  return [
    AppWelcomeSlide(
      title: welcome.slides.sales.title,
      description: welcome.slides.sales.description,
      semanticLabel: welcome.slides.sales.semanticLabel,
      illustration: const _WelcomeIllustration(
        icon: Icons.point_of_sale_rounded,
      ),
    ),
    AppWelcomeSlide(
      title: welcome.slides.inventory.title,
      description: welcome.slides.inventory.description,
      semanticLabel: welcome.slides.inventory.semanticLabel,
      illustration: const _WelcomeIllustration(icon: Icons.inventory_2_rounded),
    ),
    AppWelcomeSlide(
      title: welcome.slides.reports.title,
      description: welcome.slides.reports.description,
      semanticLabel: welcome.slides.reports.semanticLabel,
      illustration: const _WelcomeIllustration(icon: Icons.analytics_rounded),
    ),
  ];
}

class _WelcomePreviewFrame extends StatelessWidget {
  const _WelcomePreviewFrame({
    required this.width,
    required this.height,
    required this.child,
    this.label,
  });

  final double width;
  final double height;
  final Widget child;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    final colorScheme = Theme.of(context).colorScheme;

    final frame = ClipRRect(
      borderRadius: radius.lgBorder,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );

    if (label == null) {
      return Center(child: frame);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText.label(label!),
        SizedBox(height: spacing.sm),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.outlineVariant),
            borderRadius: radius.lgBorder,
          ),
          child: frame,
        ),
      ],
    );
  }
}

class _WelcomeIllustration extends StatelessWidget {
  const _WelcomeIllustration({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = context.appRadius;
    final spacing = context.appSpacing;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: radius.xxlBorder,
      ),
      child: Padding(
        padding: EdgeInsets.all(spacing.xl),
        child: FittedBox(
          child: Icon(
            icon,
            color: colorScheme.onPrimaryContainer,
            size: 220,
          ),
        ),
      ),
    );
  }
}
