import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Radius tokens.
@widgetbook.UseCase(name: 'radius tokens', type: AppRadius)
Widget radiusTokens(BuildContext context) {
  final radius = context.appRadius;

  return _RadiusPreview(
    tokens: [
      _RadiusToken('none', radius.none),
      _RadiusToken('xs', radius.xs),
      _RadiusToken('sm', radius.sm),
      _RadiusToken('md', radius.md),
      _RadiusToken('lg', radius.lg),
      _RadiusToken('xl', radius.xl),
      _RadiusToken('xxl', radius.xxl),
      _RadiusToken('full', radius.full),
    ],
  );
}

class _RadiusToken {
  const _RadiusToken(this.name, this.value);

  final String name;
  final double value;
}

class _RadiusPreview extends StatelessWidget {
  const _RadiusPreview({required this.tokens});

  final List<_RadiusToken> tokens;

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
            'Radius Tokens',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: spacing.lg),
          Wrap(
            spacing: spacing.lg,
            runSpacing: spacing.lg,
            children: [
              for (final token in tokens)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 96,
                      height: 64,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(token.value),
                      ),
                    ),
                    SizedBox(height: spacing.xs),
                    Text(token.name),
                    Text('${token.value}px'),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
