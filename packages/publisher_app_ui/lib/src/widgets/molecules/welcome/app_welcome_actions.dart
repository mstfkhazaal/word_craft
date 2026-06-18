import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Responsive action group for welcome/onboarding surfaces.
class AppWelcomeActions extends StatelessWidget {
  /// Creates a welcome action group.
  const AppWelcomeActions({
    required this.primaryAction,
    this.secondaryAction,
    this.axis = Axis.vertical,
    this.spacing,
    this.stretch = true,
    super.key,
  });

  /// Main call to action.
  final Widget primaryAction;

  /// Optional secondary action.
  final Widget? secondaryAction;

  /// Layout axis.
  final Axis axis;

  /// Gap between actions.
  final double? spacing;

  /// Whether actions should expand across the available width.
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    final gap = spacing ?? context.appSpacing.sm;

    if (secondaryAction == null) {
      return stretch
          ? SizedBox(width: double.infinity, child: primaryAction)
          : primaryAction;
    }

    if (axis == Axis.horizontal) {
      return Row(
        mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (stretch)
            Expanded(child: primaryAction)
          else
            Flexible(child: primaryAction),
          SizedBox(width: gap),
          if (stretch)
            Expanded(child: secondaryAction!)
          else
            Flexible(child: secondaryAction!),
        ],
      );
    }

    return Column(
      crossAxisAlignment: stretch
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        primaryAction,
        SizedBox(height: gap),
        secondaryAction!,
      ],
    );
  }
}
