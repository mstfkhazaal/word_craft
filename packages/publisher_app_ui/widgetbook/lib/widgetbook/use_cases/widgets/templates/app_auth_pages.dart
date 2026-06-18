import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_catalog/core/i18n/translations.g.dart';

@widgetbook.UseCase(name: 'login', type: AppAuthPageTemplate)
Widget login(BuildContext context) {
  final translations = Translations.of(context);
  final auth = translations.auth;
  final loading = context.knobs.boolean(label: 'Loading');

  return AppAuthPageTemplate(
    topTrailing: _settingsSwitcher(context),
    brand: AppLogo.horizontal(
      translations.app.name,
      center: true,
      logoSize: 72,
      appTagline: translations.app.tagline,
    ),
    title: auth.login.title,
    subtitle: auth.login.subtitle,
    form: AppLoginForm(
      emailLabel: auth.fields.email,
      passwordLabel: auth.fields.password,
      rememberMeLabel: auth.login.rememberMe,
      forgotPasswordLabel: auth.login.forgotPassword,
      submitLabel: auth.login.submit,
      isLoading: loading,
      onSubmit: () {},
      onForgotPassword: () {},
    ),
    footer: AppAuthFooterAction(
      label: auth.login.noAccount,
      actionLabel: auth.login.createAccount,
      onPressed: () {},
    ),
    sideContent: _AuthSideContent(
      title: auth.side.title,
      description: auth.side.description,
    ),
  );
}

@widgetbook.UseCase(name: 'register', type: AppAuthPageTemplate)
Widget register(BuildContext context) {
  final translations = Translations.of(context);
  final auth = translations.auth;
  final loading = context.knobs.boolean(label: 'Loading');
  final acceptedTerms = context.knobs.boolean(
    label: 'Accepted terms',
    initialValue: true,
  );

  return AppAuthPageTemplate(
    topTrailing: _settingsSwitcher(context),
    brand: AppLogo.horizontal(
      translations.app.name,
      center: true,
      logoSize: 72,
      appTagline: translations.app.tagline,
    ),
    title: auth.register.title,
    subtitle: auth.register.subtitle,
    form: AppRegisterForm(
      nameLabel: auth.fields.name,
      emailLabel: auth.fields.email,
      passwordLabel: auth.fields.password,
      confirmPasswordLabel: auth.fields.confirmPassword,
      termsLabel: auth.register.terms,
      acceptTerms: acceptedTerms,
      submitLabel: auth.register.submit,
      isLoading: loading,
      onSubmit: () {},
      onAcceptTermsChanged: (_) {},
    ),
    footer: AppAuthFooterAction(
      label: auth.register.hasAccount,
      actionLabel: auth.register.signIn,
      onPressed: () {},
    ),
    sideContent: _AuthSideContent(
      title: auth.side.title,
      description: auth.side.description,
    ),
  );
}

@widgetbook.UseCase(name: 'forgot password', type: AppAuthPageTemplate)
Widget forgotPassword(BuildContext context) {
  final translations = Translations.of(context);
  final auth = translations.auth;
  final loading = context.knobs.boolean(label: 'Loading');

  return AppAuthPageTemplate(
    topTrailing: _settingsSwitcher(context),
    brand: AppLogo.horizontal(
      translations.app.name,
      center: true,
      logoSize: 72,
      appTagline: translations.app.tagline,
    ),
    title: auth.forgotPassword.title,
    subtitle: auth.forgotPassword.subtitle,
    form: AppForgotPasswordForm(
      emailLabel: auth.fields.email,
      submitLabel: auth.forgotPassword.submit,
      isLoading: loading,
      onSubmit: () {},
    ),
    footer: AppAuthFooterAction(
      label: auth.forgotPassword.rememberPassword,
      actionLabel: auth.forgotPassword.backToLogin,
      onPressed: () {},
    ),
    sideContent: _AuthSideContent(
      title: auth.side.title,
      description: auth.side.description,
    ),
  );
}

@widgetbook.UseCase(name: 'reset password', type: AppAuthPageTemplate)
Widget resetPassword(BuildContext context) {
  final translations = Translations.of(context);
  final auth = translations.auth;
  final loading = context.knobs.boolean(label: 'Loading');

  return AppAuthPageTemplate(
    topTrailing: _settingsSwitcher(context),
    brand: AppLogo.horizontal(
      translations.app.name,
      center: true,
      logoSize: 72,
      appTagline: translations.app.tagline,
    ),
    title: auth.resetPassword.title,
    subtitle: auth.resetPassword.subtitle,
    form: AppResetPasswordForm(
      passwordLabel: auth.fields.password,
      confirmPasswordLabel: auth.fields.confirmPassword,
      submitLabel: auth.resetPassword.submit,
      isLoading: loading,
      onSubmit: () {},
    ),
    sideContent: _AuthSideContent(
      title: auth.side.title,
      description: auth.side.description,
    ),
  );
}

@widgetbook.UseCase(name: 'verify code', type: AppAuthPageTemplate)
Widget verifyCode(BuildContext context) {
  final translations = Translations.of(context);
  final auth = translations.auth;
  final loading = context.knobs.boolean(label: 'Loading');

  return AppAuthPageTemplate(
    topTrailing: _settingsSwitcher(context),
    brand: AppLogo.horizontal(
      translations.app.name,
      center: true,
      logoSize: 72,
      appTagline: translations.app.tagline,
    ),
    title: auth.verifyCode.title,
    subtitle: auth.verifyCode.subtitle,
    form: AppVerifyCodeForm(
      codeLabel: auth.fields.code,
      submitLabel: auth.verifyCode.submit,
      resendLabel: auth.verifyCode.resend,
      isLoading: loading,
      onSubmit: () {},
      onResend: () {},
    ),
    sideContent: _AuthSideContent(
      title: auth.side.title,
      description: auth.side.description,
    ),
  );
}

@widgetbook.UseCase(name: 'matrix', type: AppAuthPageTemplate)
Widget authMatrix(BuildContext context) {
  final spacing = context.appSpacing;

  return SingleChildScrollView(
    padding: EdgeInsetsDirectional.all(spacing.lg),
    child: Wrap(
      spacing: spacing.lg,
      runSpacing: spacing.lg,
      children: [
        SizedBox(width: 420, child: login(context)),
        SizedBox(width: 420, child: register(context)),
        SizedBox(width: 420, child: forgotPassword(context)),
        SizedBox(width: 420, child: resetPassword(context)),
        SizedBox(width: 420, child: verifyCode(context)),
      ],
    ),
  );
}

Widget _settingsSwitcher(BuildContext context) {
  final translations = Translations.of(context);
  final currentLocale = Localizations.localeOf(context);
  final isArabic = currentLocale.languageCode.toLowerCase() == 'ar';
  final brightness = Theme.of(context).brightness;

  return AppSettingsSwitcher(
    themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
    localeLabel: isArabic ? 'EN' : 'AR',
    themeTooltip: translations.settings.theme,
    localeTooltip: translations.settings.language,
    onToggleThemeMode: () {
      // Widgetbook theme is controlled by MaterialThemeAddon.
      // In the real app, pass your actual theme callback here.
    },
    onToggleLocale: () {
      // Widgetbook locale is controlled by LocalizationAddon.
      // In the real app, pass your actual locale callback here.
    },
  );
}

class _AuthSideContent extends StatelessWidget {
  const _AuthSideContent({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsetsDirectional.all(spacing.xl),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: context.appRadius.xxlBorder,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lock_person_outlined,
            size: context.appSize.logoLg,
            color: colorScheme.onPrimaryContainer,
          ),
          SizedBox(height: spacing.xl),
          AppText.heading(
            title,
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
          SizedBox(height: spacing.md),
          AppText.body(
            description,
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}
