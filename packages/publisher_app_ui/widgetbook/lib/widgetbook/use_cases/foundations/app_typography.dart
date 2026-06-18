import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Marker component for typography foundation use cases.
class AppTypographyPreview extends StatelessWidget {
  /// Creates an [AppTypographyPreview].
  const AppTypographyPreview({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

/// Typography tokens using Inter.
@widgetbook.UseCase(name: 'inter ltr', type: AppTypographyPreview)
Widget interLtr(BuildContext context) {
  return _TypographyPreview(
    title: 'Inter / LTR',
    typography: AppTypography.ltr(),
    textDirection: TextDirection.ltr,
    sampleHeading: 'Publisher Inventory',
    sampleBody: 'Manage products, stock, invoices, and reports.',
  );
}

/// Typography tokens using IBM Plex Sans Arabic.
@widgetbook.UseCase(
  name: 'ibm plex sans arabic rtl',
  type: AppTypographyPreview,
)
Widget ibmPlexSansArabicRtl(BuildContext context) {
  return _TypographyPreview(
    title: 'IBM Plex Sans Arabic / RTL',
    typography: AppTypography.rtl(),
    textDirection: TextDirection.rtl,
    sampleHeading: 'إدارة المخزون',
    sampleBody: 'إدارة المنتجات والكميات والفواتير والتقارير.',
  );
}

extension on AppTypography {
  //static AppTypography _ltrPreview() => AppTypography.ltr();

  //static AppTypography _rtlPreview() => AppTypography.rtl();
}

class _TypographyPreview extends StatelessWidget {
  const _TypographyPreview({
    required this.title,
    required this.typography,
    required this.textDirection,
    required this.sampleHeading,
    required this.sampleBody,
  });

  final String title;
  final AppTypography typography;
  final TextDirection textDirection;
  final String sampleHeading;
  final String sampleBody;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Directionality(
      textDirection: textDirection,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: spacing.lg),
            _TextTokenRow(
              name: 'display',
              text: sampleHeading,
              style: typography.display,
              fontFamily: typography.fontFamily,
            ),
            _TextTokenRow(
              name: 'heading',
              text: sampleHeading,
              style: typography.heading,
              fontFamily: typography.fontFamily,
            ),
            _TextTokenRow(
              name: 'title',
              text: sampleHeading,
              style: typography.title,
              fontFamily: typography.fontFamily,
            ),
            _TextTokenRow(
              name: 'body',
              text: sampleBody,
              style: typography.body,
              fontFamily: typography.fontFamily,
            ),
            _TextTokenRow(
              name: 'caption',
              text: sampleBody,
              style: typography.caption.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              fontFamily: typography.fontFamily,
            ),
            _TextTokenRow(
              name: 'label',
              text: sampleHeading,
              style: typography.label,
              fontFamily: typography.fontFamily,
            ),
            _TextTokenRow(
              name: 'button',
              text: sampleHeading,
              style: typography.button,
              fontFamily: typography.fontFamily,
            ),
            _TextTokenRow(
              name: 'error',
              text: sampleBody,
              style: typography.error.copyWith(color: colorScheme.error),
              fontFamily: typography.fontFamily,
            ),
          ],
        ),
      ),
    );
  }
}

class _TextTokenRow extends StatelessWidget {
  const _TextTokenRow({
    required this.name,
    required this.text,
    required this.style,
    required this.fontFamily,
  });

  final String name;
  final String text;
  final TextStyle style;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: spacing.md),
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: context.appRadius.lgBorder,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Theme.of(context).textTheme.labelSmall),
          SizedBox(height: spacing.xs),
          Text(
            text,
            style: style.copyWith(
              fontFamily: fontFamily,
              package: 'publisher_app_ui',
            ),
          ),
        ],
      ),
    );
  }
}
