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
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
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

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations
  late final Translations$app$en app = Translations$app$en.internal(_root);
  late final Translations$common$en common = Translations$common$en.internal(_root);
  late final Translations$language$en language = Translations$language$en.internal(_root);
  late final Translations$menu$en menu = Translations$menu$en.internal(_root);
  late final Translations$pages$en pages = Translations$pages$en.internal(_root);
  late final Translations$startup$en startup = Translations$startup$en.internal(_root);
}

// Path: app
class Translations$app$en {
  Translations$app$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Word Craft'
  ///
  /// ar: 'وورد كرافت'
  String get name => 'Word Craft';

  /// en: 'Version {version}'
  ///
  /// ar: 'الإصدار {version}'
  String get version => 'Version {version}';

  /// en: '© 2026 Mostafa Khazaal'
  ///
  /// ar: '© 2026 مصطفى خزعل'
  String get copyright => '© 2026 Mostafa Khazaal';
}

// Path: common
class Translations$common$en {
  Translations$common$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Cancel'
  ///
  /// ar: 'إلغاء'
  String get cancel => 'Cancel';

  /// en: 'Create'
  ///
  /// ar: 'إنشاء'
  String get create => 'Create';

  /// en: 'Open'
  ///
  /// ar: 'فتح'
  String get open => 'Open';

  /// en: 'Save'
  ///
  /// ar: 'حفظ'
  String get save => 'Save';

  /// en: 'Close'
  ///
  /// ar: 'إغلاق'
  String get close => 'Close';

  /// en: 'Delete'
  ///
  /// ar: 'حذف'
  String get delete => 'Delete';

  /// en: 'Rename'
  ///
  /// ar: 'إعادة تسمية'
  String get rename => 'Rename';

  /// en: 'Duplicate'
  ///
  /// ar: 'نسخ'
  String get duplicate => 'Duplicate';

  /// en: 'Settings'
  ///
  /// ar: 'الإعدادات'
  String get settings => 'Settings';

  /// en: 'Settings…'
  ///
  /// ar: 'الإعدادات…'
  String get settingsWithEllipsis => 'Settings…';

  /// en: 'No Document'
  ///
  /// ar: 'لا يوجد مستند'
  String get noDocument => 'No Document';

  /// en: 'Not Available'
  ///
  /// ar: 'غير متاح'
  String get notAvailable => 'Not Available';
}

// Path: language
class Translations$language$en {
  Translations$language$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Languages'
  ///
  /// ar: 'اللغات'
  String get title => 'Languages';

  /// en: 'Preparing your language...'
  ///
  /// ar: 'جاري تجهيز اللغة...'
  String get wait => 'Preparing your language...';
}

// Path: menu
class Translations$menu$en {
  Translations$menu$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$menu$app$en app = Translations$menu$app$en.internal(_root);
  late final Translations$menu$file$en file = Translations$menu$file$en.internal(_root);
  late final Translations$menu$edit$en edit = Translations$menu$edit$en.internal(_root);
  late final Translations$menu$view$en view = Translations$menu$view$en.internal(_root);
  late final Translations$menu$text$en text = Translations$menu$text$en.internal(_root);
  late final Translations$menu$format$en format = Translations$menu$format$en.internal(_root);
  late final Translations$menu$preview$en preview = Translations$menu$preview$en.internal(_root);
  late final Translations$menu$window$en window = Translations$menu$window$en.internal(_root);
  late final Translations$menu$help$en help = Translations$menu$help$en.internal(_root);
}

// Path: pages
class Translations$pages$en {
  Translations$pages$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$pages$editor$en editor = Translations$pages$editor$en.internal(_root);
  late final Translations$pages$welcome$en welcome = Translations$pages$welcome$en.internal(_root);
}

// Path: startup
class Translations$startup$en {
  Translations$startup$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Startup failed'
  ///
  /// ar: 'تعذر بدء التطبيق'
  String get failureTitle => 'Startup failed';

  /// en: 'Retry'
  ///
  /// ar: 'إعادة المحاولة'
  String get retry => 'Retry';

  /// en: 'Preparing Wareed...'
  ///
  /// ar: 'جاري تجهيز وريد...'
  String get loading => 'Preparing Wareed...';
}

// Path: menu.app
class Translations$menu$app$en {
  Translations$menu$app$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Word Craft'
  ///
  /// ar: 'وورد كرافت'
  String get label => 'Word Craft';

  /// en: 'About Word Craft'
  ///
  /// ar: 'حول وورد كرافت'
  String get about => 'About Word Craft';

  /// en: 'Check For Updates…'
  ///
  /// ar: 'التحقق من التحديثات…'
  String get checkForUpdates => 'Check For Updates…';

  /// en: 'Settings…'
  ///
  /// ar: 'الإعدادات…'
  String get settings => 'Settings…';
}

// Path: menu.file
class Translations$menu$file$en {
  Translations$menu$file$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'File'
  ///
  /// ar: 'ملف'
  String get label => 'File';

  /// en: 'New Book'
  ///
  /// ar: 'كتاب جديد'
  String get newBook => 'New Book';

  /// en: 'New Book Set…'
  ///
  /// ar: 'مجموعة كتب جديدة…'
  String get newBookSet => 'New Book Set…';

  /// en: 'Open…'
  ///
  /// ar: 'فتح…'
  String get open => 'Open…';

  /// en: 'Open Recent'
  ///
  /// ar: 'فتح ملف حديث'
  String get openRecent => 'Open Recent';

  /// en: 'No Recent Books'
  ///
  /// ar: 'لا توجد كتب حديثة'
  String get noRecentBooks => 'No Recent Books';

  /// en: 'Clear Recents'
  ///
  /// ar: 'مسح الملفات الحديثة'
  String get clearRecents => 'Clear Recents';

  /// en: 'Import Word File…'
  ///
  /// ar: 'استيراد ملف وورد…'
  String get importWordFile => 'Import Word File…';

  /// en: 'Close'
  ///
  /// ar: 'إغلاق'
  String get close => 'Close';

  /// en: 'Save'
  ///
  /// ar: 'حفظ'
  String get save => 'Save';

  /// en: 'Duplicate'
  ///
  /// ar: 'نسخ'
  String get duplicate => 'Duplicate';

  /// en: 'Rename…'
  ///
  /// ar: 'إعادة تسمية…'
  String get rename => 'Rename…';

  /// en: 'Move To…'
  ///
  /// ar: 'نقل إلى…'
  String get moveTo => 'Move To…';

  /// en: 'Revert To'
  ///
  /// ar: 'الرجوع إلى'
  String get revertTo => 'Revert To';

  /// en: 'Last Saved Version'
  ///
  /// ar: 'آخر نسخة محفوظة'
  String get lastSavedVersion => 'Last Saved Version';

  /// en: 'Share'
  ///
  /// ar: 'مشاركة'
  String get share => 'Share';

  /// en: 'Share MarkBook…'
  ///
  /// ar: 'مشاركة ملف MarkBook…'
  String get shareMarkBook => 'Share MarkBook…';

  /// en: 'Reimport Word File…'
  ///
  /// ar: 'إعادة استيراد ملف وورد…'
  String get reimportWordFile => 'Reimport Word File…';

  /// en: 'Reuse Elements From'
  ///
  /// ar: 'إعادة استخدام عناصر من'
  String get reuseElementsFrom => 'Reuse Elements From';

  /// en: 'Other MarkBook…'
  ///
  /// ar: 'ملف MarkBook آخر…'
  String get otherMarkBook => 'Other MarkBook…';

  /// en: 'Reuse Summary…'
  ///
  /// ar: 'إعادة استخدام الملخص…'
  String get reuseSummary => 'Reuse Summary…';

  /// en: 'Generate Books…'
  ///
  /// ar: 'توليد الكتب…'
  String get generateBooks => 'Generate Books…';

  /// en: 'Export Content As'
  ///
  /// ar: 'تصدير المحتوى كـ'
  String get exportContentAs => 'Export Content As';

  /// en: 'Markdown Files…'
  ///
  /// ar: 'ملفات Markdown…'
  String get exportMarkdownFiles => 'Markdown Files…';

  /// en: 'HTML…'
  ///
  /// ar: 'HTML…'
  String get exportHtml => 'HTML…';

  /// en: 'Word File…'
  ///
  /// ar: 'ملف وورد…'
  String get exportWordFile => 'Word File…';

  /// en: 'Rich Text Format…'
  ///
  /// ar: 'تنسيق نص منسق…'
  String get exportRichTextFormat => 'Rich Text Format…';

  /// en: 'Select Platforms…'
  ///
  /// ar: 'اختيار المنصات…'
  String get selectPlatforms => 'Select Platforms…';

  /// en: 'Print Settings…'
  ///
  /// ar: 'إعدادات الطباعة…'
  String get printSettings => 'Print Settings…';
}

// Path: menu.edit
class Translations$menu$edit$en {
  Translations$menu$edit$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Edit'
  ///
  /// ar: 'تحرير'
  String get label => 'Edit';

  /// en: 'Undo'
  ///
  /// ar: 'تراجع'
  String get undo => 'Undo';

  /// en: 'Redo'
  ///
  /// ar: 'إعادة'
  String get redo => 'Redo';

  /// en: 'Cut'
  ///
  /// ar: 'قص'
  String get cut => 'Cut';

  /// en: 'Copy'
  ///
  /// ar: 'نسخ'
  String get copy => 'Copy';

  /// en: 'Paste'
  ///
  /// ar: 'لصق'
  String get paste => 'Paste';

  /// en: 'Paste and Match Style'
  ///
  /// ar: 'لصق ومطابقة النمط'
  String get pasteAndMatchStyle => 'Paste and Match Style';

  /// en: 'Delete'
  ///
  /// ar: 'حذف'
  String get delete => 'Delete';

  /// en: 'Select All'
  ///
  /// ar: 'تحديد الكل'
  String get selectAll => 'Select All';

  late final Translations$menu$edit$find$en find = Translations$menu$edit$find$en.internal(_root);
  late final Translations$menu$edit$spellingAndGrammar$en spellingAndGrammar =
      Translations$menu$edit$spellingAndGrammar$en.internal(_root);

  /// en: 'Substitutions'
  ///
  /// ar: 'الاستبدالات'
  String get substitutions => 'Substitutions';

  /// en: 'Transformations'
  ///
  /// ar: 'التحويلات'
  String get transformations => 'Transformations';

  /// en: 'Speech'
  ///
  /// ar: 'النطق'
  String get speech => 'Speech';

  /// en: 'Special Characters…'
  ///
  /// ar: 'الأحرف الخاصة…'
  String get specialCharacters => 'Special Characters…';
}

// Path: menu.view
class Translations$menu$view$en {
  Translations$menu$view$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'View'
  ///
  /// ar: 'عرض'
  String get label => 'View';

  /// en: 'Show Sidebar'
  ///
  /// ar: 'إظهار الشريط الجانبي'
  String get showSidebar => 'Show Sidebar';

  /// en: 'Show Inspector'
  ///
  /// ar: 'إظهار لوحة الخصائص'
  String get showInspector => 'Show Inspector';

  /// en: 'Show Preview'
  ///
  /// ar: 'إظهار المعاينة'
  String get showPreview => 'Show Preview';

  /// en: 'Enter Full Screen'
  ///
  /// ar: 'دخول ملء الشاشة'
  String get enterFullScreen => 'Enter Full Screen';
}

// Path: menu.text
class Translations$menu$text$en {
  Translations$menu$text$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Text'
  ///
  /// ar: 'النص'
  String get label => 'Text';

  /// en: 'Chapter Title'
  ///
  /// ar: 'عنوان الفصل'
  String get chapterTitle => 'Chapter Title';

  /// en: 'Heading'
  ///
  /// ar: 'عنوان'
  String get heading => 'Heading';

  /// en: 'Subheading'
  ///
  /// ar: 'عنوان فرعي'
  String get subheading => 'Subheading';

  /// en: 'Body Text'
  ///
  /// ar: 'نص عادي'
  String get bodyText => 'Body Text';

  /// en: 'Block Quote'
  ///
  /// ar: 'اقتباس'
  String get blockQuote => 'Block Quote';

  /// en: 'Code Block'
  ///
  /// ar: 'كتلة كود'
  String get codeBlock => 'Code Block';

  /// en: 'Page Break'
  ///
  /// ar: 'فاصل صفحة'
  String get pageBreak => 'Page Break';
}

// Path: menu.format
class Translations$menu$format$en {
  Translations$menu$format$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Format'
  ///
  /// ar: 'تنسيق'
  String get label => 'Format';

  /// en: 'Bold'
  ///
  /// ar: 'غامق'
  String get bold => 'Bold';

  /// en: 'Italic'
  ///
  /// ar: 'مائل'
  String get italic => 'Italic';

  /// en: 'Underline'
  ///
  /// ar: 'تحته خط'
  String get underline => 'Underline';

  /// en: 'Small Caps'
  ///
  /// ar: 'حروف صغيرة كبيرة'
  String get smallCaps => 'Small Caps';

  /// en: 'Sans Serif'
  ///
  /// ar: 'Sans Serif'
  String get sansSerif => 'Sans Serif';

  /// en: 'Monospace'
  ///
  /// ar: 'Monospace'
  String get monospace => 'Monospace';

  /// en: 'Superscript'
  ///
  /// ar: 'نص علوي'
  String get superscript => 'Superscript';

  /// en: 'Subscript'
  ///
  /// ar: 'نص سفلي'
  String get subscript => 'Subscript';

  /// en: 'Strikethrough'
  ///
  /// ar: 'يتوسطه خط'
  String get strikethrough => 'Strikethrough';
}

// Path: menu.preview
class Translations$menu$preview$en {
  Translations$menu$preview$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Preview'
  ///
  /// ar: 'معاينة'
  String get label => 'Preview';

  /// en: 'Preview PDF'
  ///
  /// ar: 'معاينة PDF'
  String get previewPdf => 'Preview PDF';

  /// en: 'Preview EPUB'
  ///
  /// ar: 'معاينة EPUB'
  String get previewEpub => 'Preview EPUB';

  /// en: 'Preview HTML'
  ///
  /// ar: 'معاينة HTML'
  String get previewHtml => 'Preview HTML';
}

// Path: menu.window
class Translations$menu$window$en {
  Translations$menu$window$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Window'
  ///
  /// ar: 'نافذة'
  String get label => 'Window';
}

// Path: menu.help
class Translations$menu$help$en {
  Translations$menu$help$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Help'
  ///
  /// ar: 'مساعدة'
  String get label => 'Help';

  /// en: 'Tutorial'
  ///
  /// ar: 'شرح'
  String get tutorial => 'Tutorial';

  /// en: 'Word Craft Tutorial'
  ///
  /// ar: 'شرح وورد كرافت'
  String get wordCraftTutorial => 'Word Craft Tutorial';

  /// en: 'Help Overview'
  ///
  /// ar: 'نظرة عامة على المساعدة'
  String get helpOverview => 'Help Overview';

  /// en: 'Contact Support'
  ///
  /// ar: 'التواصل مع الدعم'
  String get contactSupport => 'Contact Support';
}

// Path: pages.editor
class Translations$pages$editor$en {
  Translations$pages$editor$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Word Craft'
  ///
  /// ar: 'وورد كرافت'
  String get titleFallback => 'Word Craft';

  /// en: 'Chapters'
  ///
  /// ar: 'الفصول'
  String get chapters => 'Chapters';

  /// en: 'Write Markdown…'
  ///
  /// ar: 'اكتب Markdown…'
  String get writeMarkdown => 'Write Markdown…';

  /// en: 'Preview PDF'
  ///
  /// ar: 'معاينة PDF'
  String get previewPdf => 'Preview PDF';
}

// Path: pages.welcome
class Translations$pages$welcome$en {
  Translations$pages$welcome$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Recent Files'
  ///
  /// ar: 'الملفات الأخيرة'
  String get recentFiles => 'Recent Files';

  /// en: 'New Book'
  ///
  /// ar: 'كتاب جديد'
  String get newBook => 'New Book';

  /// en: 'Import Word File…'
  ///
  /// ar: 'استيراد ملف وورد…'
  String get importWordFile => 'Import Word File…';

  /// en: 'Open Other…'
  ///
  /// ar: 'فتح ملف آخر…'
  String get openOther => 'Open Other…';

  /// en: 'Open Selected'
  ///
  /// ar: 'فتح المحدد'
  String get openSelected => 'Open Selected';

  /// en: 'Show Word Craft Tutorial'
  ///
  /// ar: 'عرض شرح وورد كرافت'
  String get showTutorial => 'Show Word Craft Tutorial';

  /// en: 'Open Help Overview'
  ///
  /// ar: 'فتح نظرة عامة على المساعدة'
  String get openHelpOverview => 'Open Help Overview';

  /// en: 'No recent books yet. Create a new .markbook or open an existing one.'
  ///
  /// ar: 'لا توجد كتب حديثة بعد. أنشئ ملف .markbook جديدًا أو افتح ملفًا موجودًا.'
  String get emptyRecentFiles => 'No recent books yet.\nCreate a new .markbook or open an existing one.';
}

// Path: menu.edit.find
class Translations$menu$edit$find$en {
  Translations$menu$edit$find$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Find'
  ///
  /// ar: 'بحث'
  String get label => 'Find';

  /// en: 'Find…'
  ///
  /// ar: 'بحث…'
  String get find => 'Find…';

  /// en: 'Find and Replace…'
  ///
  /// ar: 'بحث واستبدال…'
  String get findAndReplace => 'Find and Replace…';

  /// en: 'Find Special…'
  ///
  /// ar: 'بحث خاص…'
  String get findSpecial => 'Find Special…';

  /// en: 'Find Next'
  ///
  /// ar: 'بحث عن التالي'
  String get findNext => 'Find Next';

  /// en: 'Find Previous'
  ///
  /// ar: 'بحث عن السابق'
  String get findPrevious => 'Find Previous';

  /// en: 'Use Selection For Find'
  ///
  /// ar: 'استخدام التحديد للبحث'
  String get useSelectionForFind => 'Use Selection For Find';

  /// en: 'Jump to Selection'
  ///
  /// ar: 'الانتقال إلى التحديد'
  String get jumpToSelection => 'Jump to Selection';
}

// Path: menu.edit.spellingAndGrammar
class Translations$menu$edit$spellingAndGrammar$en {
  Translations$menu$edit$spellingAndGrammar$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Spelling and Grammar'
  ///
  /// ar: 'الإملاء والقواعد'
  String get label => 'Spelling and Grammar';

  /// en: 'Show Spelling and Grammar'
  ///
  /// ar: 'عرض الإملاء والقواعد'
  String get show => 'Show Spelling and Grammar';

  /// en: 'Check Document Now'
  ///
  /// ar: 'فحص المستند الآن'
  String get checkDocumentNow => 'Check Document Now';

  /// en: 'Check Spelling While Typing'
  ///
  /// ar: 'فحص الإملاء أثناء الكتابة'
  String get checkSpellingWhileTyping => 'Check Spelling While Typing';

  /// en: 'Check Grammar With Spelling'
  ///
  /// ar: 'فحص القواعد مع الإملاء'
  String get checkGrammarWithSpelling => 'Check Grammar With Spelling';

  /// en: 'Correct Spelling Automatically'
  ///
  /// ar: 'تصحيح الإملاء تلقائيًا'
  String get correctSpellingAutomatically => 'Correct Spelling Automatically';
}
