import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Login form organism.
class AppLoginForm extends StatelessWidget {
  const AppLoginForm({
    required this.emailLabel,
    required this.passwordLabel,
    required this.submitLabel,
    required this.onSubmit,
    this.emailController,
    this.passwordController,
    this.emailValidator,
    this.passwordValidator,
    this.onForgotPassword,
    this.forgotPasswordLabel,
    this.rememberMeLabel,
    this.rememberMe = false,
    this.onRememberMeChanged,
    this.isLoading = false,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final String emailLabel;
  final String passwordLabel;
  final String submitLabel;
  final String? forgotPasswordLabel;
  final String? rememberMeLabel;
  final bool rememberMe;
  final ValueChanged<bool?>? onRememberMeChanged;
  final VoidCallback? onForgotPassword;
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
            textInputAction: TextInputAction.next,
            validator: emailValidator,
          ),
          SizedBox(height: spacing.md),
          AppTextField.password(
            controller: passwordController,
            labelText: passwordLabel,
            required: true,
            enabled: enabled && !isLoading,
            textInputAction: TextInputAction.done,
            validator: passwordValidator,
            onFieldSubmitted: (_) => onSubmit?.call(),
          ),
          if (rememberMeLabel != null || forgotPasswordLabel != null) ...[
            SizedBox(height: spacing.xs),
            Row(
              children: [
                if (rememberMeLabel != null)
                  Expanded(
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      value: rememberMe,
                      onChanged: enabled && !isLoading
                          ? onRememberMeChanged
                          : null,
                      title: AppText.caption(rememberMeLabel!),
                    ),
                  )
                else
                  const Spacer(),
                if (forgotPasswordLabel != null)
                  TextButton(
                    onPressed: enabled && !isLoading ? onForgotPassword : null,
                    child: AppText.label(forgotPasswordLabel!),
                  ),
              ],
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
