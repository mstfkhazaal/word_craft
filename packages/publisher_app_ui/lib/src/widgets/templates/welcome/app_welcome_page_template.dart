import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Responsive welcome layout mode.
enum AppWelcomeLayoutMode {
  /// Single-column phone layout.
  mobile,

  /// Centered tablet layout.
  tablet,

  /// Two-column desktop layout.
  desktop,
}

/// Responsive welcome page template.
///
/// Owns layout only. It does not own Scaffold, translations, routing,
/// authentication, persistence, or onboarding state.
class AppWelcomePageTemplate extends StatelessWidget {
  /// Creates a responsive welcome page template.
  const AppWelcomePageTemplate({
    required this.brand,
    required this.title,
    required this.description,
    required this.primaryAction,
    this.secondaryAction,
    this.illustration,
    this.footer,
    this.background,
    this.mobileIllustrationHeight = 220,
    this.tabletIllustrationHeight = 280,
    this.desktopIllustrationHeight = 420,
    this.maxContentWidth = 560,
    this.maxPageWidth = 1180,
    super.key,
  });

  /// Brand/logo widget.
  final Widget brand;

  /// Main title.
  final String title;

  /// Supporting description.
  final String description;

  /// Main action.
  final Widget primaryAction;

  /// Optional secondary action.
  final Widget? secondaryAction;

  /// Optional responsive illustration.
  final Widget? illustration;

  /// Optional footer.
  final Widget? footer;

  /// Optional decorative background.
  final Widget? background;

  /// Mobile illustration height.
  final double mobileIllustrationHeight;

  /// Tablet illustration height.
  final double tabletIllustrationHeight;

  /// Desktop illustration height.
  final double desktopIllustrationHeight;

  /// Maximum content width on mobile/tablet.
  final double maxContentWidth;

  /// Maximum page width on desktop.
  final double maxPageWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutMode = _layoutForWidth(constraints.maxWidth);

        final content = switch (layoutMode) {
          AppWelcomeLayoutMode.mobile => _MobileWelcomeLayout(
            brand: brand,
            title: title,
            description: description,
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            illustration: illustration,
            footer: footer,
            illustrationHeight: mobileIllustrationHeight,
            maxContentWidth: maxContentWidth,
          ),
          AppWelcomeLayoutMode.tablet => _TabletWelcomeLayout(
            brand: brand,
            title: title,
            description: description,
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            illustration: illustration,
            footer: footer,
            illustrationHeight: tabletIllustrationHeight,
            maxContentWidth: maxContentWidth,
          ),
          AppWelcomeLayoutMode.desktop => _DesktopWelcomeLayout(
            brand: brand,
            title: title,
            description: description,
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            illustration: illustration,
            footer: footer,
            maxPageWidth: maxPageWidth, illustrationHeight: 50,
          ),
        };

        return Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            if (background != null) Positioned.fill(child: background!),
            SafeArea(
              child: KeyedSubtree(
                key: ValueKey<AppWelcomeLayoutMode>(layoutMode),
                child: content,
              ),
            ),
          ],
        );
      },
    );
  }
  AppWelcomeLayoutMode _layoutForWidth(double width) {
    final deviceType = AppBreakpoints.deviceTypeForWidth(width);

    return switch (deviceType) {
      AppDeviceType.mobile => AppWelcomeLayoutMode.mobile,
      AppDeviceType.tablet => AppWelcomeLayoutMode.tablet,
      AppDeviceType.desktop || AppDeviceType.wide => AppWelcomeLayoutMode.desktop,
    };
  }
}

class _MobileWelcomeLayout extends StatelessWidget {
  const _MobileWelcomeLayout({
    required this.brand,
    required this.title,
    required this.description,
    required this.primaryAction,
    required this.secondaryAction,
    required this.illustration,
    required this.footer,
    required this.illustrationHeight,
    required this.maxContentWidth,
  });

  final Widget brand;
  final String title;
  final String description;
  final Widget primaryAction;
  final Widget? secondaryAction;
  final Widget? illustration;
  final Widget? footer;
  final double illustrationHeight;
  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              brand,
              SizedBox(height: spacing.xl),
              if (illustration != null) ...[
                SizedBox(
                  height: illustrationHeight,
                  child: illustration,
                ),
                SizedBox(height: spacing.xl),
              ],
              AppWelcomeHero(
                title: title,
                description: description,
                primaryAction: primaryAction,
                secondaryAction: secondaryAction,
                footer: footer,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabletWelcomeLayout extends StatelessWidget {
  const _TabletWelcomeLayout({
    required this.brand,
    required this.title,
    required this.description,
    required this.primaryAction,
    required this.secondaryAction,
    required this.illustration,
    required this.footer,
    required this.illustrationHeight,
    required this.maxContentWidth,
  });

  final Widget brand;
  final String title;
  final String description;
  final Widget primaryAction;
  final Widget? secondaryAction;
  final Widget? illustration;
  final Widget? footer;
  final double illustrationHeight;
  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: spacing.xxl,
          vertical: spacing.xl,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              brand,
              if (illustration != null) ...[
                SizedBox(height: spacing.xl),
                SizedBox(
                  height: illustrationHeight,
                  child: illustration,
                ),
              ],
              SizedBox(height: spacing.xl),
              AppWelcomeHero(
                title: title,
                description: description,
                primaryAction: primaryAction,
                secondaryAction: secondaryAction,
                footer: footer,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                actionsAxis: Axis.horizontal,
                maxWidth: maxContentWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopWelcomeLayout extends StatelessWidget {
  const _DesktopWelcomeLayout({
    required this.brand,
    required this.title,
    required this.description,
    required this.primaryAction,
    required this.secondaryAction,
    required this.illustration,
    required this.footer,
    required this.illustrationHeight,
    required this.maxPageWidth,
  });

  final Widget brand;
  final String title;
  final String description;
  final Widget primaryAction;
  final Widget? secondaryAction;
  final Widget? illustration;
  final Widget? footer;
  final double illustrationHeight;
  final double maxPageWidth;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxPageWidth),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: spacing.xxl,
            vertical: spacing.xl,
          ),
          child: Row(
            children: [
              Expanded(
                child: AppWelcomeHero(
                  brand: brand,
                  title: title,
                  description: description,
                  primaryAction: primaryAction,
                  secondaryAction: secondaryAction,
                  footer: footer,
                  actionsAxis: Axis.horizontal,
                  actionsStretch: false,
                ),
              ),
              if (illustration != null) ...[
                SizedBox(width: spacing.xxl),
                Expanded(
                  child: SizedBox(
                    height: illustrationHeight,
                    child: illustration,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
