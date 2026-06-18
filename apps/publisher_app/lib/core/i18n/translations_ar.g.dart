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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsAr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ar,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ar>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsAr _root = this; // ignore: unused_field

  @override
  TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsAr(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _Translations$app$ar app = _Translations$app$ar._(_root);
  @override
  late final _Translations$common$ar common = _Translations$common$ar._(_root);
  @override
  late final _Translations$language$ar language = _Translations$language$ar._(_root);
  @override
  late final _Translations$menu$ar menu = _Translations$menu$ar._(_root);
  @override
  late final _Translations$pages$ar pages = _Translations$pages$ar._(_root);
  @override
  late final _Translations$startup$ar startup = _Translations$startup$ar._(_root);
}

// Path: app
class _Translations$app$ar extends Translations$app$en {
  _Translations$app$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'وورد كرافت';
  @override
  String get version => 'الإصدار {version}';
  @override
  String get copyright => '© 2026 مصطفى خزعل';
}

// Path: common
class _Translations$common$ar extends Translations$common$en {
  _Translations$common$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get cancel => 'إلغاء';
  @override
  String get create => 'إنشاء';
  @override
  String get open => 'فتح';
  @override
  String get save => 'حفظ';
  @override
  String get close => 'إغلاق';
  @override
  String get delete => 'حذف';
  @override
  String get rename => 'إعادة تسمية';
  @override
  String get duplicate => 'نسخ';
  @override
  String get settings => 'الإعدادات';
  @override
  String get settingsWithEllipsis => 'الإعدادات…';
  @override
  String get noDocument => 'لا يوجد مستند';
  @override
  String get notAvailable => 'غير متاح';
}

// Path: language
class _Translations$language$ar extends Translations$language$en {
  _Translations$language$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اللغات';
  @override
  String get wait => 'جاري تجهيز اللغة...';
}

// Path: menu
class _Translations$menu$ar extends Translations$menu$en {
  _Translations$menu$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$menu$app$ar app = _Translations$menu$app$ar._(_root);
  @override
  late final _Translations$menu$file$ar file = _Translations$menu$file$ar._(_root);
  @override
  late final _Translations$menu$edit$ar edit = _Translations$menu$edit$ar._(_root);
  @override
  late final _Translations$menu$view$ar view = _Translations$menu$view$ar._(_root);
  @override
  late final _Translations$menu$text$ar text = _Translations$menu$text$ar._(_root);
  @override
  late final _Translations$menu$format$ar format = _Translations$menu$format$ar._(_root);
  @override
  late final _Translations$menu$preview$ar preview = _Translations$menu$preview$ar._(_root);
  @override
  late final _Translations$menu$window$ar window = _Translations$menu$window$ar._(_root);
  @override
  late final _Translations$menu$help$ar help = _Translations$menu$help$ar._(_root);
}

// Path: pages
class _Translations$pages$ar extends Translations$pages$en {
  _Translations$pages$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$pages$editor$ar editor = _Translations$pages$editor$ar._(_root);
  @override
  late final _Translations$pages$welcome$ar welcome = _Translations$pages$welcome$ar._(_root);
}

// Path: startup
class _Translations$startup$ar extends Translations$startup$en {
  _Translations$startup$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get failureTitle => 'تعذر بدء التطبيق';
  @override
  String get retry => 'إعادة المحاولة';
  @override
  String get loading => 'جاري تجهيز وريد...';
}

// Path: menu.app
class _Translations$menu$app$ar extends Translations$menu$app$en {
  _Translations$menu$app$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'وورد كرافت';
  @override
  String get about => 'حول وورد كرافت';
  @override
  String get checkForUpdates => 'التحقق من التحديثات…';
  @override
  String get settings => 'الإعدادات…';
}

// Path: menu.file
class _Translations$menu$file$ar extends Translations$menu$file$en {
  _Translations$menu$file$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'ملف';
  @override
  String get newBook => 'كتاب جديد';
  @override
  String get newBookSet => 'مجموعة كتب جديدة…';
  @override
  String get open => 'فتح…';
  @override
  String get openRecent => 'فتح ملف حديث';
  @override
  String get noRecentBooks => 'لا توجد كتب حديثة';
  @override
  String get clearRecents => 'مسح الملفات الحديثة';
  @override
  String get importWordFile => 'استيراد ملف وورد…';
  @override
  String get close => 'إغلاق';
  @override
  String get save => 'حفظ';
  @override
  String get duplicate => 'نسخ';
  @override
  String get rename => 'إعادة تسمية…';
  @override
  String get moveTo => 'نقل إلى…';
  @override
  String get revertTo => 'الرجوع إلى';
  @override
  String get lastSavedVersion => 'آخر نسخة محفوظة';
  @override
  String get share => 'مشاركة';
  @override
  String get shareMarkBook => 'مشاركة ملف MarkBook…';
  @override
  String get reimportWordFile => 'إعادة استيراد ملف وورد…';
  @override
  String get reuseElementsFrom => 'إعادة استخدام عناصر من';
  @override
  String get otherMarkBook => 'ملف MarkBook آخر…';
  @override
  String get reuseSummary => 'إعادة استخدام الملخص…';
  @override
  String get generateBooks => 'توليد الكتب…';
  @override
  String get exportContentAs => 'تصدير المحتوى كـ';
  @override
  String get exportMarkdownFiles => 'ملفات Markdown…';
  @override
  String get exportHtml => 'HTML…';
  @override
  String get exportWordFile => 'ملف وورد…';
  @override
  String get exportRichTextFormat => 'تنسيق نص منسق…';
  @override
  String get selectPlatforms => 'اختيار المنصات…';
  @override
  String get printSettings => 'إعدادات الطباعة…';
}

// Path: menu.edit
class _Translations$menu$edit$ar extends Translations$menu$edit$en {
  _Translations$menu$edit$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'تحرير';
  @override
  String get undo => 'تراجع';
  @override
  String get redo => 'إعادة';
  @override
  String get cut => 'قص';
  @override
  String get copy => 'نسخ';
  @override
  String get paste => 'لصق';
  @override
  String get pasteAndMatchStyle => 'لصق ومطابقة النمط';
  @override
  String get delete => 'حذف';
  @override
  String get selectAll => 'تحديد الكل';
  @override
  late final _Translations$menu$edit$find$ar find = _Translations$menu$edit$find$ar._(_root);
  @override
  late final _Translations$menu$edit$spellingAndGrammar$ar spellingAndGrammar =
      _Translations$menu$edit$spellingAndGrammar$ar._(_root);
  @override
  String get substitutions => 'الاستبدالات';
  @override
  String get transformations => 'التحويلات';
  @override
  String get speech => 'النطق';
  @override
  String get specialCharacters => 'الأحرف الخاصة…';
}

// Path: menu.view
class _Translations$menu$view$ar extends Translations$menu$view$en {
  _Translations$menu$view$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'عرض';
  @override
  String get showSidebar => 'إظهار الشريط الجانبي';
  @override
  String get showInspector => 'إظهار لوحة الخصائص';
  @override
  String get showPreview => 'إظهار المعاينة';
  @override
  String get enterFullScreen => 'دخول ملء الشاشة';
}

// Path: menu.text
class _Translations$menu$text$ar extends Translations$menu$text$en {
  _Translations$menu$text$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'النص';
  @override
  String get chapterTitle => 'عنوان الفصل';
  @override
  String get heading => 'عنوان';
  @override
  String get subheading => 'عنوان فرعي';
  @override
  String get bodyText => 'نص عادي';
  @override
  String get blockQuote => 'اقتباس';
  @override
  String get codeBlock => 'كتلة كود';
  @override
  String get pageBreak => 'فاصل صفحة';
}

// Path: menu.format
class _Translations$menu$format$ar extends Translations$menu$format$en {
  _Translations$menu$format$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'تنسيق';
  @override
  String get bold => 'غامق';
  @override
  String get italic => 'مائل';
  @override
  String get underline => 'تحته خط';
  @override
  String get smallCaps => 'حروف صغيرة كبيرة';
  @override
  String get sansSerif => 'Sans Serif';
  @override
  String get monospace => 'Monospace';
  @override
  String get superscript => 'نص علوي';
  @override
  String get subscript => 'نص سفلي';
  @override
  String get strikethrough => 'يتوسطه خط';
}

// Path: menu.preview
class _Translations$menu$preview$ar extends Translations$menu$preview$en {
  _Translations$menu$preview$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'معاينة';
  @override
  String get previewPdf => 'معاينة PDF';
  @override
  String get previewEpub => 'معاينة EPUB';
  @override
  String get previewHtml => 'معاينة HTML';
}

// Path: menu.window
class _Translations$menu$window$ar extends Translations$menu$window$en {
  _Translations$menu$window$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'نافذة';
}

// Path: menu.help
class _Translations$menu$help$ar extends Translations$menu$help$en {
  _Translations$menu$help$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'مساعدة';
  @override
  String get tutorial => 'شرح';
  @override
  String get wordCraftTutorial => 'شرح وورد كرافت';
  @override
  String get helpOverview => 'نظرة عامة على المساعدة';
  @override
  String get contactSupport => 'التواصل مع الدعم';
}

// Path: pages.editor
class _Translations$pages$editor$ar extends Translations$pages$editor$en {
  _Translations$pages$editor$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get titleFallback => 'وورد كرافت';
  @override
  String get chapters => 'الفصول';
  @override
  String get writeMarkdown => 'اكتب Markdown…';
  @override
  String get previewPdf => 'معاينة PDF';
}

// Path: pages.welcome
class _Translations$pages$welcome$ar extends Translations$pages$welcome$en {
  _Translations$pages$welcome$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get recentFiles => 'الملفات الأخيرة';
  @override
  String get newBook => 'كتاب جديد';
  @override
  String get importWordFile => 'استيراد ملف وورد…';
  @override
  String get openOther => 'فتح ملف آخر…';
  @override
  String get openSelected => 'فتح المحدد';
  @override
  String get showTutorial => 'عرض شرح وورد كرافت';
  @override
  String get openHelpOverview => 'فتح نظرة عامة على المساعدة';
  @override
  String get emptyRecentFiles => 'لا توجد كتب حديثة بعد.\nأنشئ ملف .markbook جديدًا أو افتح ملفًا موجودًا.';
}

// Path: menu.edit.find
class _Translations$menu$edit$find$ar extends Translations$menu$edit$find$en {
  _Translations$menu$edit$find$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'بحث';
  @override
  String get find => 'بحث…';
  @override
  String get findAndReplace => 'بحث واستبدال…';
  @override
  String get findSpecial => 'بحث خاص…';
  @override
  String get findNext => 'بحث عن التالي';
  @override
  String get findPrevious => 'بحث عن السابق';
  @override
  String get useSelectionForFind => 'استخدام التحديد للبحث';
  @override
  String get jumpToSelection => 'الانتقال إلى التحديد';
}

// Path: menu.edit.spellingAndGrammar
class _Translations$menu$edit$spellingAndGrammar$ar extends Translations$menu$edit$spellingAndGrammar$en {
  _Translations$menu$edit$spellingAndGrammar$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'الإملاء والقواعد';
  @override
  String get show => 'عرض الإملاء والقواعد';
  @override
  String get checkDocumentNow => 'فحص المستند الآن';
  @override
  String get checkSpellingWhileTyping => 'فحص الإملاء أثناء الكتابة';
  @override
  String get checkGrammarWithSpelling => 'فحص القواعد مع الإملاء';
  @override
  String get correctSpellingAutomatically => 'تصحيح الإملاء تلقائيًا';
}
