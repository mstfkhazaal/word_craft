import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Marker component for font foundation use cases.
class AppFontPreview extends StatelessWidget {
  /// Creates an [AppFontPreview].
  const AppFontPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// Font families available in Publisher App UI.
@widgetbook.UseCase(name: 'font families', type: AppFontPreview)
Widget fontFamilies(BuildContext context) {
  final spacing = context.appSpacing;

  return SingleChildScrollView(
    padding: EdgeInsets.all(spacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Font Families',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: spacing.lg),
        const _FontPreviewCard(
          title: 'Inter',
          fontFamily: FontFamily.inter,
          sample: 'Publisher POS Inventory Dashboard 1234567890',
        ),
        SizedBox(height: spacing.md),
        const _FontPreviewCard(
          title: 'IBM Plex Sans Arabic',
          fontFamily: FontFamily.iBMPlexSansArabic,
          sample: 'وريد لإدارة المخزون ونقاط البيع ١٢٣٤٥٦٧٨٩٠',
        ),
      ],
    ),
  );
}

/// Font weight scale for Inter.
@widgetbook.UseCase(name: 'inter weights', type: AppFontPreview)
Widget interWeights(BuildContext context) {
  return const _FontWeightPreview(
    title: 'Inter Weights',
    fontFamily: FontFamily.inter,
    sample: 'Publisher App UI',
    textDirection: TextDirection.ltr,
  );
}

/// Font weight scale for IBM Plex Sans Arabic.
@widgetbook.UseCase(name: 'arabic weights', type: AppFontPreview)
Widget arabicWeights(BuildContext context) {
  return const _FontWeightPreview(
    title: 'أوزان IBM Plex Sans Arabic',
    fontFamily: FontFamily.iBMPlexSansArabic,
    sample: 'وريد لإدارة المخزون',
    textDirection: TextDirection.rtl,
  );
}

class _FontPreviewCard extends StatelessWidget {
  const _FontPreviewCard({
    required this.title,
    required this.fontFamily,
    required this.sample,
  });

  final String title;
  final String fontFamily;
  final String sample;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: spacing.sm),
          Text(
            sample,
            style: TextStyle(
              fontFamily: fontFamily,
              package: 'publisher_app_ui',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: spacing.xs),
          Text(
            fontFamily,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _FontWeightPreview extends StatelessWidget {
  const _FontWeightPreview({
    required this.title,
    required this.fontFamily,
    required this.sample,
    required this.textDirection,
  });

  final String title;
  final String fontFamily;
  final String sample;
  final TextDirection textDirection;

  static const _weights = [
    _FontWeightToken(name: 'Thin / 100', weight: FontWeight.w100),
    _FontWeightToken(name: 'ExtraLight / 200', weight: FontWeight.w200),
    _FontWeightToken(name: 'Light / 300', weight: FontWeight.w300),
    _FontWeightToken(name: 'Regular / 400', weight: FontWeight.w400),
    _FontWeightToken(name: 'Medium / 500', weight: FontWeight.w500),
    _FontWeightToken(name: 'SemiBold / 600', weight: FontWeight.w600),
    _FontWeightToken(name: 'Bold / 700', weight: FontWeight.w700),
    _FontWeightToken(name: 'ExtraBold / 800', weight: FontWeight.w800),
    _FontWeightToken(name: 'Black / 900', weight: FontWeight.w900),
  ];

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Directionality(
      textDirection: textDirection,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: spacing.lg),
            for (final token in _weights) ...[
              _FontWeightRow(
                token: token,
                fontFamily: fontFamily,
                sample: sample,
              ),
              SizedBox(height: spacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}

class _FontWeightToken {
  const _FontWeightToken({
    required this.name,
    required this.weight,
  });

  final String name;
  final FontWeight weight;
}

class _FontWeightRow extends StatelessWidget {
  const _FontWeightRow({
    required this.token,
    required this.fontFamily,
    required this.sample,
  });

  final _FontWeightToken token;
  final String fontFamily;
  final String sample;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final spacing = context.appSpacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(token.name),
          ),
          SizedBox(width: spacing.md),
          Expanded(
            child: Text(
              sample,
              style: TextStyle(
                fontFamily: fontFamily,
                package: 'publisher_app_ui',
                fontSize: 22,
                fontWeight: token.weight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
