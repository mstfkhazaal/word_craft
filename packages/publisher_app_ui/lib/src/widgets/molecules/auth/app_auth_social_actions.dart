import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Optional social/auth-provider action row.
class AppAuthSocialActions extends StatelessWidget {
  const AppAuthSocialActions({
    required this.children,
    this.spacing,
    super.key,
  });

  final List<Widget> children;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final resolvedSpacing = spacing ?? context.appSpacing.sm;

    return Wrap(
      spacing: resolvedSpacing,
      runSpacing: resolvedSpacing,
      alignment: WrapAlignment.center,
      children: children,
    );
  }
}
