import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Reset-password form organism.
class AppResetPasswordForm extends StatelessWidget {
  const AppResetPasswordForm({
    required this.passwordLabel,
    required this.confirmPasswordLabel,
    required this.submitLabel,
    required this.onSubmit,
    this.passwordController,
    this.confirmPasswordController,
    this.passwordValidator,
    this.confirmPasswordValidator,
    this.isLoading = false,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final FormFieldValidator<String>? passwordValidator;
  final FormFieldValidator<String>? confirmPasswordValidator;
  final String passwordLabel;
  final String confirmPasswordLabel;
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
          AppTextField.password(
            controller: passwordController,
            labelText: passwordLabel,
            required: true,
            enabled: enabled && !isLoading,
            textInputAction: TextInputAction.next,
            validator: passwordValidator,
          ),
          SizedBox(height: spacing.md),
          AppTextField.password(
            controller: confirmPasswordController,
            labelText: confirmPasswordLabel,
            required: true,
            enabled: enabled && !isLoading,
            textInputAction: TextInputAction.done,
            validator: confirmPasswordValidator,
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
