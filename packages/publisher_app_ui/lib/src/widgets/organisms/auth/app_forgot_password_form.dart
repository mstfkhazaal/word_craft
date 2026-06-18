import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Forgot-password form organism.
class AppForgotPasswordForm extends StatelessWidget {
  const AppForgotPasswordForm({
    required this.emailLabel,
    required this.submitLabel,
    required this.onSubmit,
    this.emailController,
    this.emailValidator,
    this.isLoading = false,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? emailController;
  final FormFieldValidator<String>? emailValidator;
  final String emailLabel;
  final String submitLabel;
  final VoidCallback? onSubmit;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField.email(
            controller: emailController,
            labelText: emailLabel,
            required: true,
            enabled: enabled && !isLoading,
            textInputAction: TextInputAction.done,
            validator: emailValidator,
            onFieldSubmitted: (_) => onSubmit?.call(),
          ),
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
