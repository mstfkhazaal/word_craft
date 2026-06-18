import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Register form organism.
class AppRegisterForm extends StatelessWidget {
  const AppRegisterForm({
    required this.nameLabel,
    required this.emailLabel,
    required this.passwordLabel,
    required this.confirmPasswordLabel,
    required this.submitLabel,
    required this.onSubmit,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.nameValidator,
    this.emailValidator,
    this.passwordValidator,
    this.confirmPasswordValidator,
    this.termsLabel,
    this.acceptTerms = false,
    this.onAcceptTermsChanged,
    this.isLoading = false,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final FormFieldValidator<String>? nameValidator;
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final FormFieldValidator<String>? confirmPasswordValidator;
  final String nameLabel;
  final String emailLabel;
  final String passwordLabel;
  final String confirmPasswordLabel;
  final String submitLabel;
  final String? termsLabel;
  final bool acceptTerms;
  final ValueChanged<bool?>? onAcceptTermsChanged;
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
          AppTextField(
            controller: nameController,
            labelText: nameLabel,
            required: true,
            enabled: enabled && !isLoading,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.name],
            prefixIcon: const Icon(Icons.person_outline),
            validator: nameValidator,
          ),
          SizedBox(height: spacing.md),
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
          if (termsLabel != null) ...[
            SizedBox(height: spacing.xs),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              value: acceptTerms,
              onChanged: enabled && !isLoading ? onAcceptTermsChanged : null,
              title: AppText.caption(termsLabel!),
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
