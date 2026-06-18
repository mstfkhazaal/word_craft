import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Inline auth footer action such as "Do not have an account? Register".
class AppAuthFooterAction extends StatelessWidget {
  const AppAuthFooterAction({
    required this.label,
    required this.actionLabel,
    required this.onPressed,
    this.textAlign = TextAlign.center,
    super.key,
  });

  final String label;
  final String actionLabel;
  final VoidCallback? onPressed;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      alignment: switch (textAlign) {
        TextAlign.center => WrapAlignment.center,
        TextAlign.end || TextAlign.right => WrapAlignment.end,
        _ => WrapAlignment.start,
      },
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AppText.body(label, textAlign: textAlign),
        TextButton(
          onPressed: onPressed,
          child: AppText.label(
            actionLabel,
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
