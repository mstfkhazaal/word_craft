import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Welcome content organism.
///
/// Composes brand, title, description, actions, and optional footer. It is
/// intentionally stateless and receives translated strings/callback-built
/// widgets from the app layer.
class AppWelcomeHero extends StatelessWidget {
  /// Creates a welcome hero organism.
  const AppWelcomeHero({
    required this.title,
    required this.description,
    required this.primaryAction,
    this.brand,
    this.secondaryAction,
    this.footer,
    this.textAlign = TextAlign.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.actionsAxis = Axis.vertical,
    this.actionsStretch = true,
    this.maxWidth = 560,
    super.key,
  });

  /// Optional brand/logo header.
  final Widget? brand;

  /// Main welcome title.
  final String title;

  /// Supporting copy.
  final String description;

  /// Main action.
  final Widget primaryAction;

  /// Optional secondary action.
  final Widget? secondaryAction;

  /// Optional footer.
  final Widget? footer;

  /// Copy text alignment.
  final TextAlign textAlign;

  /// Column alignment.
  final CrossAxisAlignment crossAxisAlignment;

  /// Action layout axis.
  final Axis actionsAxis;

  /// Whether actions stretch to available width.
  final bool actionsStretch;

  /// Maximum hero width.
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (brand != null) ...[
            brand!,
            SizedBox(height: spacing.xxl),
          ],
          AppText.heading(
            title,
            textAlign: textAlign,
          ),
          SizedBox(height: spacing.md),
          AppText.body(
            description,
            textAlign: textAlign,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: spacing.xl),
          AppWelcomeActions(
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            axis: actionsAxis,
            stretch: actionsStretch,
          ),
          if (footer != null) ...[
            SizedBox(height: spacing.xl),
            footer!,
          ],
        ],
      ),
    );
  }
}
