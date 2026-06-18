import 'package:publisher_app/core/i18n/translations.g.dart';
import 'package:publisher_app/features/startup/presentation/wigets/startup_error_details.dart';
import 'package:publisher_app_ui/publisher_app_ui.dart';

class StartupFailureView extends StatelessWidget {
  const StartupFailureView({
    required this.error,
    required this.onRetry,
    super.key,
  });

  final String? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final t = context.t.startup;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 640;

        return Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(isCompact ? spacing.md : spacing.xl),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isCompact ? double.infinity : 560,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(radius.xl),
                  border: Border.all(color: colorScheme.outlineVariant),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.08),
                      blurRadius: 28,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isCompact ? spacing.lg : spacing.xl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: colorScheme.errorContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(spacing.md),
                          child: Icon(
                            Icons.error_outline_rounded,
                            size: isCompact ? 42 : 52,
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                      SizedBox(height: spacing.lg),
                      Text(
                        t.failureTitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (error != null && error!.trim().isNotEmpty) ...[
                        SizedBox(height: spacing.md),
                        StartupErrorDetails(error: error!),
                      ],
                      SizedBox(height: spacing.xl),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: onRetry,
                          icon: const Icon(Icons.refresh_rounded),
                          label: Text(t.retry),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
