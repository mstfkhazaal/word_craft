import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Marker component for opacity foundation use cases.
class AppOpacityPreview extends StatelessWidget {
  /// Creates an [AppOpacityPreview].
  const AppOpacityPreview({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

/// Opacity tokens.
@widgetbook.UseCase(name: 'opacity tokens', type: AppOpacityPreview)
Widget opacityTokens(BuildContext context) {
  const tokens = [
    _OpacityToken('disabled', AppOpacity.disabled),
    _OpacityToken('hover', AppOpacity.hover),
    _OpacityToken('focus', AppOpacity.focus),
    _OpacityToken('pressed', AppOpacity.pressed),
    _OpacityToken('overlay', AppOpacity.overlay),
  ];

  return const _OpacityPreview(tokens: tokens);
}

class _OpacityToken {
  const _OpacityToken(this.name, this.value);

  final String name;
  final double value;
}

class _OpacityPreview extends StatelessWidget {
  const _OpacityPreview({required this.tokens});

  final List<_OpacityToken> tokens;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opacity Tokens',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: spacing.lg),
          for (final token in tokens) ...[
            Row(
              children: [
                SizedBox(width: 120, child: Text(token.name)),
                SizedBox(
                  width: 72,
                  child: Text(token.value.toStringAsFixed(2)),
                ),
                Container(
                  width: 160,
                  height: 40,
                  color: colorScheme.primary.withValues(alpha: token.value),
                ),
              ],
            ),
            SizedBox(height: spacing.md),
          ],
        ],
      ),
    );
  }
}
