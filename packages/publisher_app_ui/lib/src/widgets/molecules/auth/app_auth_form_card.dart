import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Responsive card container for auth forms.
class AppAuthFormCard extends StatelessWidget {
  const AppAuthFormCard({
    required this.child,
    this.padding,
    this.maxWidth = 440,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Card(
        elevation: 0,
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: context.appRadius.xlBorder,
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: Padding(
          padding: padding ?? EdgeInsetsDirectional.all(spacing.lg),
          child: child,
        ),
      ),
    );
  }
}
