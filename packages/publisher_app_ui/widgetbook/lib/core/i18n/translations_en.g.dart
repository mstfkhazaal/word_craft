///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           );

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => Translations(meta: meta ?? this.$meta);

  // Translations
  late final Translations$app$en app = Translations$app$en.internal(_root);
  late final Translations$auth$en auth = Translations$auth$en.internal(_root);
  late final Translations$settings$en settings =
      Translations$settings$en.internal(_root);
  late final Translations$welcome$en welcome = Translations$welcome$en.internal(
    _root,
  );
}

// Path: app
class Translations$app$en {
  Translations$app$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Publisher'
  ///
  /// ar: 'وريد'
  String get name => 'Publisher';

  /// en: 'Inventory and POS management'
  ///
  /// ar: 'إدارة المخزون ونقاط البيع'
  String get tagline => 'Inventory and POS management';

  /// en: 'Manage sales, inventory, customers, and reports — all in one place.'
  ///
  /// ar: 'إدارة المبيعات والمخزون والعملاء والتقارير من مكان واحد.'
  String get description =>
      'Manage sales, inventory, customers, and reports — all in one place.';
}

// Path: auth
class Translations$auth$en {
  Translations$auth$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$auth$fields$en fields =
      Translations$auth$fields$en.internal(_root);
  late final Translations$auth$side$en side =
      Translations$auth$side$en.internal(_root);
  late final Translations$auth$login$en login =
      Translations$auth$login$en.internal(_root);
  late final Translations$auth$register$en register =
      Translations$auth$register$en.internal(_root);
  late final Translations$auth$forgotPassword$en forgotPassword =
      Translations$auth$forgotPassword$en.internal(_root);
  late final Translations$auth$resetPassword$en resetPassword =
      Translations$auth$resetPassword$en.internal(_root);
  late final Translations$auth$verifyCode$en verifyCode =
      Translations$auth$verifyCode$en.internal(_root);
}

// Path: settings
class Translations$settings$en {
  Translations$settings$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Theme'
  ///
  /// ar: 'المظهر'
  String get theme => 'Theme';

  /// en: 'Language'
  ///
  /// ar: 'اللغة'
  String get language => 'Language';
}

// Path: welcome
class Translations$welcome$en {
  Translations$welcome$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Welcome to Publisher POS'
  ///
  /// ar: 'أهلاً بك في وريد POS'
  String get title => 'Welcome to Publisher POS';

  /// en: 'Run sales, inventory, and reports from one fast offline-first workspace.'
  ///
  /// ar: 'أدِر المبيعات والمخزون والتقارير من مساحة عمل سريعة تعمل دون اتصال.'
  String get description =>
      'Run sales, inventory, and reports from one fast offline-first workspace.';

  /// en: 'Optimized for mobile, tablet, desktop, LTR, and RTL.'
  ///
  /// ar: 'محسّن للهاتف والتابلت وسطح المكتب ويدعم العربية والإنجليزية.'
  String get footer => 'Optimized for mobile, tablet, desktop, LTR, and RTL.';

  late final Translations$welcome$actions$en actions =
      Translations$welcome$actions$en.internal(_root);
  late final Translations$welcome$slider$en slider =
      Translations$welcome$slider$en.internal(_root);
  late final Translations$welcome$slides$en slides =
      Translations$welcome$slides$en.internal(_root);
}

// Path: auth.fields
class Translations$auth$fields$en {
  Translations$auth$fields$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Full name'
  ///
  /// ar: 'الاسم الكامل'
  String get name => 'Full name';

  /// en: 'Email address'
  ///
  /// ar: 'البريد الإلكتروني'
  String get email => 'Email address';

  /// en: 'Password'
  ///
  /// ar: 'كلمة المرور'
  String get password => 'Password';

  /// en: 'Confirm password'
  ///
  /// ar: 'تأكيد كلمة المرور'
  String get confirmPassword => 'Confirm password';

  /// en: 'Verification code'
  ///
  /// ar: 'رمز التحقق'
  String get code => 'Verification code';
}

// Path: auth.side
class Translations$auth$side$en {
  Translations$auth$side$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Secure access for your business'
  ///
  /// ar: 'دخول آمن لإدارة عملك'
  String get title => 'Secure access for your business';

  /// en: 'Manage sales, inventory, reports, and users from one responsive point-of-sale workspace.'
  ///
  /// ar: 'أدر المبيعات والمخزون والتقارير والمستخدمين من مساحة عمل واحدة متجاوبة لنقاط البيع.'
  String get description =>
      'Manage sales, inventory, reports, and users from one responsive point-of-sale workspace.';
}

// Path: auth.login
class Translations$auth$login$en {
  Translations$auth$login$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Welcome back'
  ///
  /// ar: 'مرحباً بعودتك'
  String get title => 'Welcome back';

  /// en: 'Sign in to continue managing your store.'
  ///
  /// ar: 'سجل الدخول لمتابعة إدارة متجرك.'
  String get subtitle => 'Sign in to continue managing your store.';

  /// en: 'Remember me'
  ///
  /// ar: 'تذكرني'
  String get rememberMe => 'Remember me';

  /// en: 'Forgot password?'
  ///
  /// ar: 'نسيت كلمة المرور؟'
  String get forgotPassword => 'Forgot password?';

  /// en: 'Sign in'
  ///
  /// ar: 'تسجيل الدخول'
  String get submit => 'Sign in';

  /// en: 'Do not have an account?'
  ///
  /// ar: 'ليس لديك حساب؟'
  String get noAccount => 'Do not have an account?';

  /// en: 'Create account'
  ///
  /// ar: 'إنشاء حساب'
  String get createAccount => 'Create account';
}

// Path: auth.register
class Translations$auth$register$en {
  Translations$auth$register$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Create your account'
  ///
  /// ar: 'إنشاء حساب جديد'
  String get title => 'Create your account';

  /// en: 'Start setting up your company and point-of-sale workspace.'
  ///
  /// ar: 'ابدأ بإعداد شركتك ومساحة عمل نقاط البيع.'
  String get subtitle =>
      'Start setting up your company and point-of-sale workspace.';

  /// en: 'I agree to the terms and privacy policy.'
  ///
  /// ar: 'أوافق على الشروط وسياسة الخصوصية.'
  String get terms => 'I agree to the terms and privacy policy.';

  /// en: 'Create account'
  ///
  /// ar: 'إنشاء الحساب'
  String get submit => 'Create account';

  /// en: 'Already have an account?'
  ///
  /// ar: 'لديك حساب بالفعل؟'
  String get hasAccount => 'Already have an account?';

  /// en: 'Sign in'
  ///
  /// ar: 'تسجيل الدخول'
  String get signIn => 'Sign in';
}

// Path: auth.forgotPassword
class Translations$auth$forgotPassword$en {
  Translations$auth$forgotPassword$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Reset your password'
  ///
  /// ar: 'إعادة تعيين كلمة المرور'
  String get title => 'Reset your password';

  /// en: 'Enter your email and we will send reset instructions.'
  ///
  /// ar: 'أدخل بريدك الإلكتروني وسنرسل لك تعليمات إعادة التعيين.'
  String get subtitle =>
      'Enter your email and we will send reset instructions.';

  /// en: 'Send reset link'
  ///
  /// ar: 'إرسال رابط إعادة التعيين'
  String get submit => 'Send reset link';

  /// en: 'Remember your password?'
  ///
  /// ar: 'تتذكر كلمة المرور؟'
  String get rememberPassword => 'Remember your password?';

  /// en: 'Back to sign in'
  ///
  /// ar: 'العودة لتسجيل الدخول'
  String get backToLogin => 'Back to sign in';
}

// Path: auth.resetPassword
class Translations$auth$resetPassword$en {
  Translations$auth$resetPassword$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Set a new password'
  ///
  /// ar: 'تعيين كلمة مرور جديدة'
  String get title => 'Set a new password';

  /// en: 'Choose a secure password for your account.'
  ///
  /// ar: 'اختر كلمة مرور آمنة لحسابك.'
  String get subtitle => 'Choose a secure password for your account.';

  /// en: 'Update password'
  ///
  /// ar: 'تحديث كلمة المرور'
  String get submit => 'Update password';
}

// Path: auth.verifyCode
class Translations$auth$verifyCode$en {
  Translations$auth$verifyCode$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Verify your account'
  ///
  /// ar: 'تحقق من حسابك'
  String get title => 'Verify your account';

  /// en: 'Enter the verification code sent to your email or phone.'
  ///
  /// ar: 'أدخل رمز التحقق المرسل إلى بريدك الإلكتروني أو هاتفك.'
  String get subtitle =>
      'Enter the verification code sent to your email or phone.';

  /// en: 'Verify code'
  ///
  /// ar: 'تحقق من الرمز'
  String get submit => 'Verify code';

  /// en: 'Resend code'
  ///
  /// ar: 'إعادة إرسال الرمز'
  String get resend => 'Resend code';
}

// Path: welcome.actions
class Translations$welcome$actions$en {
  Translations$welcome$actions$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Get started'
  ///
  /// ar: 'ابدأ الآن'
  String get getStarted => 'Get started';

  /// en: 'Sign in'
  ///
  /// ar: 'تسجيل الدخول'
  String get signIn => 'Sign in';
}

// Path: welcome.slider
class Translations$welcome$slider$en {
  Translations$welcome$slider$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Welcome slider page indicator'
  ///
  /// ar: 'مؤشر صفحات شريط الترحيب'
  String get indicatorSemanticLabel => 'Welcome slider page indicator';
}

// Path: welcome.slides
class Translations$welcome$slides$en {
  Translations$welcome$slides$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$welcome$slides$sales$en sales =
      Translations$welcome$slides$sales$en.internal(_root);
  late final Translations$welcome$slides$inventory$en inventory =
      Translations$welcome$slides$inventory$en.internal(
        _root,
      );
  late final Translations$welcome$slides$reports$en reports =
      Translations$welcome$slides$reports$en.internal(_root);
}

// Path: welcome.slides.sales
class Translations$welcome$slides$sales$en {
  Translations$welcome$slides$sales$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Fast checkout'
  ///
  /// ar: 'بيع أسرع'
  String get title => 'Fast checkout';

  /// en: 'Create orders quickly with a clean POS flow.'
  ///
  /// ar: 'أنشئ الطلبات بسرعة من خلال واجهة نقاط بيع واضحة.'
  String get description => 'Create orders quickly with a clean POS flow.';

  /// en: 'Point of sale checkout illustration'
  ///
  /// ar: 'رسم توضيحي لعملية البيع'
  String get semanticLabel => 'Point of sale checkout illustration';
}

// Path: welcome.slides.inventory
class Translations$welcome$slides$inventory$en {
  Translations$welcome$slides$inventory$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Inventory control'
  ///
  /// ar: 'تحكم بالمخزون'
  String get title => 'Inventory control';

  /// en: 'Track products, stock, and daily movement.'
  ///
  /// ar: 'تابع المنتجات والكميات وحركة المخزون اليومية.'
  String get description => 'Track products, stock, and daily movement.';

  /// en: 'Inventory management illustration'
  ///
  /// ar: 'رسم توضيحي لإدارة المخزون'
  String get semanticLabel => 'Inventory management illustration';
}

// Path: welcome.slides.reports
class Translations$welcome$slides$reports$en {
  Translations$welcome$slides$reports$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Business reports'
  ///
  /// ar: 'تقارير الأعمال'
  String get title => 'Business reports';

  /// en: 'Understand sales and performance at a glance.'
  ///
  /// ar: 'افهم المبيعات والأداء بسرعة من شاشة واحدة.'
  String get description => 'Understand sales and performance at a glance.';

  /// en: 'Business analytics illustration'
  ///
  /// ar: 'رسم توضيحي لتحليلات الأعمال'
  String get semanticLabel => 'Business analytics illustration';
}
