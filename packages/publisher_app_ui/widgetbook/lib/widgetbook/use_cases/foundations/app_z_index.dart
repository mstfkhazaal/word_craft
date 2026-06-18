import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Marker component for z-index foundation use cases.
class AppZIndexPreview extends StatelessWidget {
  /// Creates an [AppZIndexPreview].
  const AppZIndexPreview({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

/// Z-index tokens.
@widgetbook.UseCase(name: 'z-index tokens', type: AppZIndexPreview)
Widget zIndexTokens(BuildContext context) {
  const tokens = [
    _ZIndexToken('dropdown', AppZIndex.dropdown),
    _ZIndexToken('sticky', AppZIndex.sticky),
    _ZIndexToken('drawer', AppZIndex.drawer),
    _ZIndexToken('modal', AppZIndex.modal),
    _ZIndexToken('toast', AppZIndex.toast),
  ];

  return const _ZIndexPreview(tokens: tokens);
}

class _ZIndexToken {
  const _ZIndexToken(this.name, this.value);

  final String name;
  final int value;
}

class _ZIndexPreview extends StatelessWidget {
  const _ZIndexPreview({required this.tokens});

  final List<_ZIndexToken> tokens;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SingleChildScrollView(
      padding: EdgeInsets.all(spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Z-index Tokens',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: spacing.lg),
          for (final token in tokens)
            ListTile(
              title: Text(token.name),
              trailing: Text(token.value.toString()),
            ),
        ],
      ),
    );
  }
}
