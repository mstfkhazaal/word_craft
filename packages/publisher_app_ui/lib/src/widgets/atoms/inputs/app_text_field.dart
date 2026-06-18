import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Semantic text field variants used by app forms.
enum AppTextFieldVariant {
  text,
  email,
  password,
  phone,
  number,
}

/// Generic design-system text field atom.
///
/// This widget is intentionally controller/callback based and does not own
/// validation rules, auth state, API calls, or navigation.
class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.labelText,
    this.controller,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.required = false,
    this.obscureText = false,
    this.variant = AppTextFieldVariant.text,
    this.maxLines = 1,
    super.key,
  });

  const AppTextField.email({
    required this.labelText,
    this.controller,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon = const Icon(Icons.email_outlined),
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.required = false,
    this.maxLines = 1,
    super.key,
  }) : variant = AppTextFieldVariant.email,
       obscureText = false,
       keyboardType = TextInputType.emailAddress,
       autofillHints = const [AutofillHints.email];

  const AppTextField.password({
    required this.labelText,
    this.controller,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon = const Icon(Icons.lock_outline),
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.required = false,
    this.maxLines = 1,
    super.key,
  }) : variant = AppTextFieldVariant.password,
       obscureText = true,
       keyboardType = TextInputType.visiblePassword,
       autofillHints = const [AutofillHints.password];

  final TextEditingController? controller;
  final String? initialValue;
  final String labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool enabled;
  final bool readOnly;
  final bool required;
  final bool obscureText;
  final AppTextFieldVariant variant;
  final int maxLines;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.obscureText != widget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.variant == AppTextFieldVariant.password;

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.controller == null ? widget.initialValue : null,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: _obscureText,
      maxLines: isPassword ? 1 : widget.maxLines,
      decoration: InputDecoration(
        label: _FieldLabel(
          labelText: widget.labelText,
          required: widget.required,
        ),
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: isPassword
            ? _buildPasswordToggle(context)
            : widget.suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordToggle(BuildContext context) {
    return IconButton(
      tooltip: _obscureText ? 'Show password' : 'Hide password',
      onPressed: widget.enabled
          ? () {
              setState(() {
                _obscureText = !_obscureText;
              });
            }
          : null,
      icon: Icon(
        _obscureText
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({
    required this.labelText,
    required this.required,
  });

  final String labelText;
  final bool required;

  @override
  Widget build(BuildContext context) {
    if (!required) {
      return Text(labelText);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Text(labelText)),
        const SizedBox(width: 2),
        const AppText.requiredMark(),
      ],
    );
  }
}
