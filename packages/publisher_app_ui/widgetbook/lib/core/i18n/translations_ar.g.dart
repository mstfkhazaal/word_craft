///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsAr extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsAr({
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
             locale: AppLocale.ar,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(
         cardinalResolver: cardinalResolver,
         ordinalResolver: ordinalResolver,
       );

  /// Metadata for the translations of <ar>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsAr _root = this; // ignore: unused_field

  @override
  TranslationsAr $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => TranslationsAr(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _Translations$app$ar app = _Translations$app$ar._(_root);
  @override
  late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
  @override
  late final _Translations$settings$ar settings = _Translations$settings$ar._(
    _root,
  );
  @override
  late final _Translations$welcome$ar welcome = _Translations$welcome$ar._(
    _root,
  );
}

// Path: app
class _Translations$app$ar extends Translations$app$en {
  _Translations$app$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'وريد';
  @override
  String get tagline => 'إدارة المخزون ونقاط البيع';
  @override
  String get description =>
      'إدارة المبيعات والمخزون والعملاء والتقارير من مكان واحد.';
}

// Path: auth
class _Translations$auth$ar extends Translations$auth$en {
  _Translations$auth$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$auth$fields$ar fields =
      _Translations$auth$fields$ar._(_root);
  @override
  late final _Translations$auth$side$ar side = _Translations$auth$side$ar._(
    _root,
  );
  @override
  late final _Translations$auth$login$ar login = _Translations$auth$login$ar._(
    _root,
  );
  @override
  late final _Translations$auth$register$ar register =
      _Translations$auth$register$ar._(_root);
  @override
  late final _Translations$auth$forgotPassword$ar forgotPassword =
      _Translations$auth$forgotPassword$ar._(_root);
  @override
  late final _Translations$auth$resetPassword$ar resetPassword =
      _Translations$auth$resetPassword$ar._(_root);
  @override
  late final _Translations$auth$verifyCode$ar verifyCode =
      _Translations$auth$verifyCode$ar._(_root);
}

// Path: settings
class _Translations$settings$ar extends Translations$settings$en {
  _Translations$settings$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get theme => 'المظهر';
  @override
  String get language => 'اللغة';
}

// Path: welcome
class _Translations$welcome$ar extends Translations$welcome$en {
  _Translations$welcome$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أهلاً بك في وريد POS';
  @override
  String get description =>
      'أدِر المبيعات والمخزون والتقارير من مساحة عمل سريعة تعمل دون اتصال.';
  @override
  String get footer =>
      'محسّن للهاتف والتابلت وسطح المكتب ويدعم العربية والإنجليزية.';
  @override
  late final _Translations$welcome$actions$ar actions =
      _Translations$welcome$actions$ar._(_root);
  @override
  late final _Translations$welcome$slider$ar slider =
      _Translations$welcome$slider$ar._(_root);
  @override
  late final _Translations$welcome$slides$ar slides =
      _Translations$welcome$slides$ar._(_root);
}

// Path: auth.fields
class _Translations$auth$fields$ar extends Translations$auth$fields$en {
  _Translations$auth$fields$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'الاسم الكامل';
  @override
  String get email => 'البريد الإلكتروني';
  @override
  String get password => 'كلمة المرور';
  @override
  String get confirmPassword => 'تأكيد كلمة المرور';
  @override
  String get code => 'رمز التحقق';
}

// Path: auth.side
class _Translations$auth$side$ar extends Translations$auth$side$en {
  _Translations$auth$side$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'دخول آمن لإدارة عملك';
  @override
  String get description =>
      'أدر المبيعات والمخزون والتقارير والمستخدمين من مساحة عمل واحدة متجاوبة لنقاط البيع.';
}

// Path: auth.login
class _Translations$auth$login$ar extends Translations$auth$login$en {
  _Translations$auth$login$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'مرحباً بعودتك';
  @override
  String get subtitle => 'سجل الدخول لمتابعة إدارة متجرك.';
  @override
  String get rememberMe => 'تذكرني';
  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';
  @override
  String get submit => 'تسجيل الدخول';
  @override
  String get noAccount => 'ليس لديك حساب؟';
  @override
  String get createAccount => 'إنشاء حساب';
}

// Path: auth.register
class _Translations$auth$register$ar extends Translations$auth$register$en {
  _Translations$auth$register$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'إنشاء حساب جديد';
  @override
  String get subtitle => 'ابدأ بإعداد شركتك ومساحة عمل نقاط البيع.';
  @override
  String get terms => 'أوافق على الشروط وسياسة الخصوصية.';
  @override
  String get submit => 'إنشاء الحساب';
  @override
  String get hasAccount => 'لديك حساب بالفعل؟';
  @override
  String get signIn => 'تسجيل الدخول';
}

// Path: auth.forgotPassword
class _Translations$auth$forgotPassword$ar
    extends Translations$auth$forgotPassword$en {
  _Translations$auth$forgotPassword$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'إعادة تعيين كلمة المرور';
  @override
  String get subtitle =>
      'أدخل بريدك الإلكتروني وسنرسل لك تعليمات إعادة التعيين.';
  @override
  String get submit => 'إرسال رابط إعادة التعيين';
  @override
  String get rememberPassword => 'تتذكر كلمة المرور؟';
  @override
  String get backToLogin => 'العودة لتسجيل الدخول';
}

// Path: auth.resetPassword
class _Translations$auth$resetPassword$ar
    extends Translations$auth$resetPassword$en {
  _Translations$auth$resetPassword$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تعيين كلمة مرور جديدة';
  @override
  String get subtitle => 'اختر كلمة مرور آمنة لحسابك.';
  @override
  String get submit => 'تحديث كلمة المرور';
}

// Path: auth.verifyCode
class _Translations$auth$verifyCode$ar extends Translations$auth$verifyCode$en {
  _Translations$auth$verifyCode$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تحقق من حسابك';
  @override
  String get subtitle =>
      'أدخل رمز التحقق المرسل إلى بريدك الإلكتروني أو هاتفك.';
  @override
  String get submit => 'تحقق من الرمز';
  @override
  String get resend => 'إعادة إرسال الرمز';
}

// Path: welcome.actions
class _Translations$welcome$actions$ar extends Translations$welcome$actions$en {
  _Translations$welcome$actions$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get getStarted => 'ابدأ الآن';
  @override
  String get signIn => 'تسجيل الدخول';
}

// Path: welcome.slider
class _Translations$welcome$slider$ar extends Translations$welcome$slider$en {
  _Translations$welcome$slider$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get indicatorSemanticLabel => 'مؤشر صفحات شريط الترحيب';
}

// Path: welcome.slides
class _Translations$welcome$slides$ar extends Translations$welcome$slides$en {
  _Translations$welcome$slides$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$welcome$slides$sales$ar sales =
      _Translations$welcome$slides$sales$ar._(_root);
  @override
  late final _Translations$welcome$slides$inventory$ar inventory =
      _Translations$welcome$slides$inventory$ar._(_root);
  @override
  late final _Translations$welcome$slides$reports$ar reports =
      _Translations$welcome$slides$reports$ar._(_root);
}

// Path: welcome.slides.sales
class _Translations$welcome$slides$sales$ar
    extends Translations$welcome$slides$sales$en {
  _Translations$welcome$slides$sales$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'بيع أسرع';
  @override
  String get description => 'أنشئ الطلبات بسرعة من خلال واجهة نقاط بيع واضحة.';
  @override
  String get semanticLabel => 'رسم توضيحي لعملية البيع';
}

// Path: welcome.slides.inventory
class _Translations$welcome$slides$inventory$ar
    extends Translations$welcome$slides$inventory$en {
  _Translations$welcome$slides$inventory$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تحكم بالمخزون';
  @override
  String get description => 'تابع المنتجات والكميات وحركة المخزون اليومية.';
  @override
  String get semanticLabel => 'رسم توضيحي لإدارة المخزون';
}

// Path: welcome.slides.reports
class _Translations$welcome$slides$reports$ar
    extends Translations$welcome$slides$reports$en {
  _Translations$welcome$slides$reports$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تقارير الأعمال';
  @override
  String get description => 'افهم المبيعات والأداء بسرعة من شاشة واحدة.';
  @override
  String get semanticLabel => 'رسم توضيحي لتحليلات الأعمال';
}
