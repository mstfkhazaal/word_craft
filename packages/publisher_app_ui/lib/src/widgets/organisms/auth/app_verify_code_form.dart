import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Verification-code form organism.
class AppVerifyCodeForm extends StatelessWidget {
  const AppVerifyCodeForm({
    required this.codeLabel,
    required this.submitLabel,
    required this.onSubmit,
    this.codeController,
    this.codeValidator,
    this.resendLabel,
    this.onResend,
    this.isLoading = false,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? codeController;
  final FormFieldValidator<String>? codeValidator;
  final String codeLabel;
  final String submitLabel;
  final String? resendLabel;
  final VoidCallback? onSubmit;
  final VoidCallback? onResend;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: codeController,
            labelText: codeLabel,
            required: true,
            enabled: enabled && !isLoading,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            autofillHints: const [AutofillHints.oneTimeCode],
            prefixIcon: const Icon(Icons.pin_outlined),
            validator: codeValidator,
            onFieldSubmitted: (_) => onSubmit?.call(),
          ),
          if (resendLabel != null) ...[
            SizedBox(height: spacing.xs),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: enabled && !isLoading ? onResend : null,
                child: AppText.label(resendLabel!),
              ),
            ),
          ],
          SizedBox(height: spacing.lg),
          AppButton(
            onPressed: enabled && !isLoading ? onSubmit : null,
            size: AppButtonSize.large,
            child: isLoading
                ? const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(submitLabel),
          ),
        ],
      ),
    );
  }
}
