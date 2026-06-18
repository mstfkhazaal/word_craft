import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Marker component for duration foundation use cases.
class AppDurationsPreview extends StatelessWidget {
  /// Creates an [AppDurationsPreview].
  const AppDurationsPreview({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

/// Duration tokens.
@widgetbook.UseCase(name: 'duration tokens', type: AppDurationsPreview)
Widget durationTokens(BuildContext context) {
  const tokens = [
    _DurationToken('instant', AppDurations.instant),
    _DurationToken('fast', AppDurations.fast),
    _DurationToken('normal', AppDurations.normal),
    _DurationToken('slow', AppDurations.slow),
    _DurationToken('slower', AppDurations.slower),
  ];

  return const _DurationPreview(tokens: tokens);
}

class _DurationToken {
  const _DurationToken(this.name, this.value);

  final String name;
  final Duration value;
}

class _DurationPreview extends StatelessWidget {
  const _DurationPreview({required this.tokens});

  final List<_DurationToken> tokens;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SingleChildScrollView(
      padding: EdgeInsets.all(spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Duration Tokens',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: spacing.lg),
          for (final token in tokens) ...[
            ListTile(
              title: Text(token.name),
              subtitle: Text('${token.value.inMilliseconds} ms'),
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}
