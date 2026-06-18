import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Header molecule for authentication pages.
class AppAuthHeader extends StatelessWidget {
  const AppAuthHeader({
    required this.title,
    this.subtitle,
    this.brand,
    this.textAlign = TextAlign.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? brand;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (brand != null) ...[
          brand!,
          SizedBox(height: spacing.xl),
        ],
        AppText.heading(
          title,
          textAlign: textAlign,
        ),
        if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
          SizedBox(height: spacing.xs),
          AppText.body(
            subtitle!,
            textAlign: textAlign,
          ),
        ],
      ],
    );
  }
}
