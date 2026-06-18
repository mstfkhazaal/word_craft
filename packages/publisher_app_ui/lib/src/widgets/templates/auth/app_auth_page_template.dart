import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Reusable responsive authentication page template.
///
/// This template owns layout only. Auth state, validation rules, routing,
/// API calls, persistence, and localization must stay in the app layer.
class AppAuthPageTemplate extends StatelessWidget {
  const AppAuthPageTemplate({
    required this.title,
    required this.form,
    this.subtitle,
    this.brand,
    this.sideContent,
    this.footer,
    this.topTrailing,
    this.background,
    this.maxFormWidth = 440,
    this.maxContentWidth = 1180,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? brand;
  final Widget form;
  final Widget? sideContent;
  final Widget? footer;
  final Widget? topTrailing;
  final Widget? background;
  final double maxFormWidth;
  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType = AppBreakpoints.deviceTypeForWidth(
          constraints.maxWidth,
        );

        final content = switch (deviceType) {
          AppDeviceType.mobile => _MobileAuthLayout(
            title: title,
            subtitle: subtitle,
            brand: brand,
            form: form,
            footer: footer,
            topTrailing: topTrailing,
            maxFormWidth: maxFormWidth,
          ),
          AppDeviceType.tablet => _TabletAuthLayout(
            title: title,
            subtitle: subtitle,
            brand: brand,
            form: form,
            footer: footer,
            topTrailing: topTrailing,
            maxFormWidth: maxFormWidth,
          ),
          AppDeviceType.desktop || AppDeviceType.wide => _DesktopAuthLayout(
            title: title,
            subtitle: subtitle,
            brand: brand,
            form: form,
            footer: footer,
            sideContent: sideContent,
            topTrailing: topTrailing,
            maxFormWidth: maxFormWidth,
            maxContentWidth: maxContentWidth,
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
                key: ValueKey<AppDeviceType>(deviceType),
                child: content,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MobileAuthLayout extends StatelessWidget {
  const _MobileAuthLayout({
    required this.title,
    required this.subtitle,
    required this.brand,
    required this.form,
    required this.footer,
    required this.topTrailing,
    required this.maxFormWidth,
  });

  final String title;
  final String? subtitle;
  final Widget? brand;
  final Widget form;
  final Widget? footer;
  final Widget? topTrailing;
  final double maxFormWidth;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxFormWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (topTrailing != null) ...[
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: topTrailing,
                ),
                SizedBox(height: spacing.lg),
              ],
              AppAuthHeader(
                title: title,
                subtitle: subtitle,
                brand: brand,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              SizedBox(height: spacing.xl),
              AppAuthFormCard(child: form),
              if (footer != null) ...[
                SizedBox(height: spacing.lg),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TabletAuthLayout extends StatelessWidget {
  const _TabletAuthLayout({
    required this.title,
    required this.subtitle,
    required this.brand,
    required this.form,
    required this.footer,
    required this.topTrailing,
    required this.maxFormWidth,
  });

  final String title;
  final String? subtitle;
  final Widget? brand;
  final Widget form;
  final Widget? footer;
  final Widget? topTrailing;
  final double maxFormWidth;

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
          constraints: BoxConstraints(maxWidth: maxFormWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (topTrailing != null) ...[
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: topTrailing,
                ),
                SizedBox(height: spacing.lg),
              ],
              AppAuthHeader(
                title: title,
                subtitle: subtitle,
                brand: brand,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              SizedBox(height: spacing.xl),
              AppAuthFormCard(child: form),
              if (footer != null) ...[
                SizedBox(height: spacing.lg),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopAuthLayout extends StatelessWidget {
  const _DesktopAuthLayout({
    required this.title,
    required this.subtitle,
    required this.brand,
    required this.form,
    required this.footer,
    required this.sideContent,
    required this.topTrailing,
    required this.maxFormWidth,
    required this.maxContentWidth,
  });

  final String title;
  final String? subtitle;
  final Widget? brand;
  final Widget form;
  final Widget? footer;
  final Widget? sideContent;
  final Widget? topTrailing;
  final double maxFormWidth;
  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    final formPanel = Align(
      alignment: AlignmentDirectional.centerEnd,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxFormWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppAuthHeader(
              title: title,
              subtitle: subtitle,
              brand: brand,
            ),
            SizedBox(height: spacing.xl),
            AppAuthFormCard(child: form),
            if (footer != null) ...[
              SizedBox(height: spacing.lg),
              footer!,
            ],
          ],
        ),
      ),
    );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: spacing.xxl,
            vertical: spacing.xl,
          ),
          child: Column(
            children: [
              if (topTrailing != null) ...[
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: topTrailing,
                ),
                SizedBox(height: spacing.lg),
              ],
              Expanded(
                child: Row(
                  children: [
                    if (sideContent != null) ...[
                      Expanded(child: sideContent!),
                      SizedBox(width: spacing.xxl),
                    ],
                    Expanded(child: formPanel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
