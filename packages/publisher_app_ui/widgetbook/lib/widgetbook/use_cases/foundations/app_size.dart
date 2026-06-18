import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Size token preview.
@widgetbook.UseCase(name: 'size tokens', type: AppSize)
Widget sizeTokens(BuildContext context) {
  final size = context.appSize;

  return _SizePreview(
    tokens: [
      _SizeToken('iconXs', size.iconXs),
      _SizeToken('iconSm', size.iconSm),
      _SizeToken('iconMd', size.iconMd),
      _SizeToken('iconLg', size.iconLg),
      _SizeToken('iconXl', size.iconXl),
      _SizeToken('controlSm', size.controlSm),
      _SizeToken('controlMd', size.controlMd),
      _SizeToken('controlLg', size.controlLg),
      _SizeToken('touchTarget', size.touchTarget),
      _SizeToken('avatarSm', size.avatarSm),
      _SizeToken('avatarMd', size.avatarMd),
      _SizeToken('avatarLg', size.avatarLg),
      _SizeToken('logoSm', size.logoSm),
      _SizeToken('logoMd', size.logoMd),
      _SizeToken('logoLg', size.logoLg),
    ],
  );
}

class _SizeToken {
  const _SizeToken(this.name, this.value);

  final String name;
  final double value;
}

class _SizePreview extends StatelessWidget {
  const _SizePreview({required this.tokens});

  final List<_SizeToken> tokens;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Size Tokens', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: spacing.lg),
          for (final token in tokens) ...[
            Row(
              children: [
                SizedBox(width: 120, child: Text(token.name)),
                SizedBox(width: 72, child: Text('${token.value}px')),
                Container(
                  width: token.value,
                  height: token.value,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
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
