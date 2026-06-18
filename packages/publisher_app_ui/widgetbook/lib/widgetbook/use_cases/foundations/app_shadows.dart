import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Marker component for shadow foundation use cases.
class AppShadowsPreview extends StatelessWidget {
  /// Creates an [AppShadowsPreview].
  const AppShadowsPreview({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

/// Shadow tokens.
@widgetbook.UseCase(name: 'shadow tokens', type: AppShadowsPreview)
Widget shadowTokens(BuildContext context) {
  const tokens = [
    _ShadowToken('none', AppShadows.none),
    _ShadowToken('xs', AppShadows.xs),
    _ShadowToken('sm', AppShadows.sm),
    _ShadowToken('md', AppShadows.md),
    _ShadowToken('lg', AppShadows.lg),
    _ShadowToken('xl', AppShadows.xl),
  ];

  return const _ShadowPreview(tokens: tokens);
}

class _ShadowToken {
  const _ShadowToken(this.name, this.value);

  final String name;
  final List<BoxShadow> value;
}

class _ShadowPreview extends StatelessWidget {
  const _ShadowPreview({required this.tokens});

  final List<_ShadowToken> tokens;

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
            'Shadow Tokens',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: spacing.lg),
          Wrap(
            spacing: spacing.lg,
            runSpacing: spacing.lg,
            children: [
              for (final token in tokens)
                Container(
                  width: 140,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: context.appRadius.lgBorder,
                    boxShadow: token.value,
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Text(token.name),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
