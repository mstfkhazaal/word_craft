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
  String version({required Object version}) => 'الإصدار ${version}';
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
  late final _Translations$menu$chapter$ar chapter = _Translations$menu$chapter$ar._(_root);
  @override
  late final _Translations$menu$text$ar text = _Translations$menu$text$ar._(_root);
  @override
  late final _Translations$menu$preview$ar preview = _Translations$menu$preview$ar._(_root);
  @override
  late final _Translations$menu$view$ar view = _Translations$menu$view$ar._(_root);
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
  String get label => 'Word Craft';
  @override
  String get about => 'About Word Craft';
  @override
  String get checkForUpdates => 'Check For Updates…';
  @override
  String get settings => 'Settings…';
}

// Path: menu.file
class _Translations$menu$file$ar extends Translations$menu$file$en {
  _Translations$menu$file$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'File';
  @override
  String get newBook => 'New Book';
  @override
  String get newBookSet => 'New Book Set…';
  @override
  String get open => 'Open…';
  @override
  String get openRecent => 'Open Recent';
  @override
  String get noRecentBooks => 'No Recent Books';
  @override
  String get clearRecents => 'Clear Recents';
  @override
  String get importWordFile => 'Import Word File…';
  @override
  String get close => 'Close';
  @override
  String get save => 'Save';
  @override
  String get duplicate => 'Duplicate';
  @override
  String get rename => 'Rename';
  @override
  String get moveTo => 'Move To';
  @override
  String get revertTo => 'Revert To';
  @override
  String get noDocument => 'No Document';
  @override
  String get share => 'Share';
  @override
  String get reimportWordFile => 'Reimport Word File…';
  @override
  String get reuseElementsFrom => 'Reuse Elements From';
  @override
  String get others => 'Others…';
  @override
  String get reuseSummary => 'Reuse Summary…';
  @override
  String get generateBooks => 'Generate Books…';
  @override
  String get exportContentAs => 'Export Content As';
  @override
  String get exportWordFile => 'Word File…';
  @override
  String get exportRichTextFormat => 'Rich Text Format…';
  @override
  String get selectPlatforms => 'Select Platforms…';
  @override
  String get printSettings => 'Print Settings…';
}

// Path: menu.edit
class _Translations$menu$edit$ar extends Translations$menu$edit$en {
  _Translations$menu$edit$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Edit';
  @override
  String get undo => 'Undo';
  @override
  String get redo => 'Redo';
  @override
  String get cut => 'Cut';
  @override
  String get copy => 'Copy';
  @override
  String get paste => 'Paste';
  @override
  String get pasteAndMatchStyle => 'Paste and Match Style';
  @override
  String get delete => 'Delete';
  @override
  String get selectAll => 'Select All';
  @override
  late final _Translations$menu$edit$find$ar find = _Translations$menu$edit$find$ar._(_root);
  @override
  late final _Translations$menu$edit$spellingAndGrammar$ar spellingAndGrammar =
      _Translations$menu$edit$spellingAndGrammar$ar._(_root);
  @override
  String get substitutions => 'Substitutions';
  @override
  String get transformations => 'Transformations';
  @override
  String get speech => 'Speech';
  @override
  String get specialCharacters => 'Special Characters';
}

// Path: menu.chapter
class _Translations$menu$chapter$ar extends Translations$menu$chapter$en {
  _Translations$menu$chapter$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Chapter';
  @override
  String get addChapter => 'Add Chapter';
  @override
  String get addElement => 'Add Element';
  @override
  String get addMultipleElements => 'Add Multiple Elements…';
  @override
  String get createPartFromSelection => 'Create Part from Selection';
  @override
  String get createVolumeFromSelection => 'Create Volume from Selection';
  @override
  String get convertTo => 'Convert To';
  @override
  String get numbered => 'Numbered';
  @override
  String get heading => 'Heading';
  @override
  String get includeIn => 'Include In';
  @override
  String get beginOn => 'Begin On';
  @override
  String get insertPageBreak => 'Insert Page Break';
  @override
  String get splitChapterAtCursor => 'Split Chapter at Cursor';
  @override
  String get mergeSelectedChapters => 'Merge Selected Chapters';
  @override
  String get goToPreviousChapter => 'Go to Previous Chapter';
  @override
  String get goToNextChapter => 'Go to Next Chapter';
  @override
  String get numbering => 'Numbering…';
  @override
  String get terminology => 'Terminology…';
  @override
  late final _Translations$menu$chapter$element$ar element = _Translations$menu$chapter$element$ar._(_root);
  @override
  late final _Translations$menu$chapter$convert$ar convert = _Translations$menu$chapter$convert$ar._(_root);
  @override
  late final _Translations$menu$chapter$include$ar include = _Translations$menu$chapter$include$ar._(_root);
  @override
  late final _Translations$menu$chapter$begin$ar begin = _Translations$menu$chapter$begin$ar._(_root);
}

// Path: menu.text
class _Translations$menu$text$ar extends Translations$menu$text$en {
  _Translations$menu$text$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Text';
  @override
  String get bold => 'Bold';
  @override
  String get italic => 'Italic';
  @override
  String get underline => 'Underline';
  @override
  String get smallCaps => 'Small Caps';
  @override
  String get sansSerif => 'Sans Serif';
  @override
  String get monospace => 'Monospace';
  @override
  String get superscript => 'Superscript';
  @override
  String get subscript => 'Subscript';
  @override
  String get strikethrough => 'Strikethrough';
  @override
  String get addFeature => 'Add Feature';
  @override
  late final _Translations$menu$text$feature$ar feature = _Translations$menu$text$feature$ar._(_root);
}

// Path: menu.preview
class _Translations$menu$preview$ar extends Translations$menu$preview$en {
  _Translations$menu$preview$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Preview';
  @override
  String get device => 'Device';
  @override
  String get previousPage => 'Previous Page';
  @override
  String get nextPage => 'Next Page';
  @override
  String get previousChapter => 'Previous Chapter';
  @override
  String get nextChapter => 'Next Chapter';
  @override
  String get showEditorContentInPreview => 'Show Editor Content in Preview';
  @override
  String get showPreviewContentInEditor => 'Show Preview Content in Editor';
  @override
  String get limitToPageSize => 'Limit to Page Size';
  @override
  String get showBleedInProofMode => 'Show Bleed in Proof Mode';
  @override
  late final _Translations$menu$preview$devices$ar devices = _Translations$menu$preview$devices$ar._(_root);
}

// Path: menu.view
class _Translations$menu$view$ar extends Translations$menu$view$en {
  _Translations$menu$view$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'View';
  @override
  String get showTabBar => 'Show Tab Bar';
  @override
  String get showAllTabs => 'Show All Tabs';
  @override
  String get navigator => 'Navigator';
  @override
  String get preview => 'Preview';
  @override
  String get contents => 'Contents';
  @override
  String get styles => 'Styles';
  @override
  String get invisibleCharacters => 'Invisible Characters';
  @override
  String get showToolbar => 'Show Toolbar';
  @override
  String get customizeToolbar => 'Customize Toolbar…';
  @override
  String get enterFullScreen => 'Enter Full Screen';
}

// Path: menu.window
class _Translations$menu$window$ar extends Translations$menu$window$en {
  _Translations$menu$window$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Window';
  @override
  String get minimize => 'Minimize';
  @override
  String get zoom => 'Zoom';
  @override
  String get fill => 'Fill';
  @override
  String get center => 'Center';
  @override
  String get moveAndResize => 'Move & Resize';
  @override
  String get fullScreenTile => 'Full Screen Tile';
  @override
  String get removeWindowFromSet => 'Remove Window from Set';
  @override
  String get showPhotoLibrary => 'Show Photo Library';
  @override
  String get showPreviousTab => 'Show Previous Tab';
  @override
  String get showNextTab => 'Show Next Tab';
  @override
  String get moveTabToNewWindow => 'Move Tab to New Window';
  @override
  String get mergeAllWindows => 'Merge All Windows';
  @override
  String get bringAllToFront => 'Bring All to Front';
  @override
  String get wordCraft => 'Word Craft';
  @override
  String get halves => 'Halves';
  @override
  String get left => 'Left';
  @override
  String get right => 'Right';
  @override
  String get top => 'Top';
  @override
  String get bottom => 'Bottom';
  @override
  String get quarters => 'Quarters';
  @override
  String get topLeft => 'Top Left';
  @override
  String get topRight => 'Top Right';
  @override
  String get bottomLeft => 'Bottom Left';
  @override
  String get bottomRight => 'Bottom Right';
  @override
  String get arrange => 'Arrange';
  @override
  String get leftAndRight => 'Left & Right';
  @override
  String get rightAndLeft => 'Right & Left';
  @override
  String get topAndBottom => 'Top & Bottom';
  @override
  String get bottomAndTop => 'Bottom & Top';
  @override
  String get returnToPreviousSize => 'Return to Previous Size';
}

// Path: menu.help
class _Translations$menu$help$ar extends Translations$menu$help$en {
  _Translations$menu$help$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Help';
  @override
  String get search => 'Search';
  @override
  String get tutorial => 'Word Craft Tutorial';
  @override
  String get helpOverview => 'Word Craft Help Overview';
  @override
  String get contactSupport => 'Contact Word Craft Support…';
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
  String get label => 'Find';
  @override
  String get find => 'Find…';
  @override
  String get findAndReplace => 'Find and Replace';
  @override
  String get findSpecial => 'Find Special…';
  @override
  String get findNext => 'Find Next';
  @override
  String get findPrevious => 'Find Previous';
  @override
  String get useSelectionForFind => 'Use Selection For Find';
  @override
  String get jumpToSelection => 'Jump to Selection';
}

// Path: menu.edit.spellingAndGrammar
class _Translations$menu$edit$spellingAndGrammar$ar extends Translations$menu$edit$spellingAndGrammar$en {
  _Translations$menu$edit$spellingAndGrammar$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Spelling and Grammar';
  @override
  String get show => 'Show Spelling and Grammar';
  @override
  String get checkDocumentNow => 'Check Document Now';
  @override
  String get checkSpellingWhileTyping => 'Check Spelling While Typing';
  @override
  String get checkGrammarWithSpelling => 'Check Grammar With Spelling';
  @override
  String get correctSpellingAutomatically => 'Correct Spelling Automatically';
}

// Path: menu.chapter.element
class _Translations$menu$chapter$element$ar extends Translations$menu$chapter$element$en {
  _Translations$menu$chapter$element$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get blurbs => 'Blurbs';
  @override
  String get halfTitle => 'Half Title';
  @override
  String get titlePage => 'Title Page';
  @override
  String get copyright => 'Copyright';
  @override
  String get dedication => 'Dedication';
  @override
  String get epigraph => 'Epigraph';
  @override
  String get tableOfContents => 'Table of Contents';
  @override
  String get foreword => 'Foreword';
  @override
  String get introduction => 'Introduction';
  @override
  String get preface => 'Preface';
  @override
  String get prologue => 'Prologue';
  @override
  String get epilogue => 'Epilogue';
  @override
  String get afterword => 'Afterword';
  @override
  String get endnotes => 'Endnotes';
  @override
  String get bibliography => 'Bibliography';
  @override
  String get acknowledgments => 'Acknowledgments';
  @override
  String get aboutTheAuthor => 'About the Author';
  @override
  String get alsoBy => 'Also By';
  @override
  String get fullPageImage => 'Full Page Image';
  @override
  String get uncategorized => 'Uncategorized';
}

// Path: menu.chapter.convert
class _Translations$menu$chapter$convert$ar extends Translations$menu$chapter$convert$en {
  _Translations$menu$chapter$convert$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get chapter => 'Chapter';
  @override
  String get blurbs => 'Blurbs';
  @override
  String get copyright => 'Copyright';
  @override
  String get dedication => 'Dedication';
  @override
  String get epigraph => 'Epigraph';
  @override
  String get foreword => 'Foreword';
  @override
  String get introduction => 'Introduction';
  @override
  String get preface => 'Preface';
  @override
  String get prologue => 'Prologue';
  @override
  String get epilogue => 'Epilogue';
  @override
  String get afterword => 'Afterword';
  @override
  String get bibliography => 'Bibliography';
  @override
  String get acknowledgments => 'Acknowledgments';
  @override
  String get aboutTheAuthor => 'About the Author';
  @override
  String get alsoBy => 'Also By';
  @override
  String get uncategorized => 'Uncategorized';
}

// Path: menu.chapter.include
class _Translations$menu$chapter$include$ar extends Translations$menu$chapter$include$en {
  _Translations$menu$chapter$include$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get allEditions => 'All Editions';
  @override
  String get ebooksOnly => 'Ebooks only';
  @override
  String get printOnly => 'Print only';
}

// Path: menu.chapter.begin
class _Translations$menu$chapter$begin$ar extends Translations$menu$chapter$begin$en {
  _Translations$menu$chapter$begin$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get rightSideOfSpread => 'Right Side of Spread';
  @override
  String get eitherSideOfSpread => 'Either Side of Spread';
}

// Path: menu.text.feature
class _Translations$menu$text$feature$ar extends Translations$menu$text$feature$en {
  _Translations$menu$text$feature$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get subhead => 'Subhead';
  @override
  String get ornamentalBreak => 'Ornamental Break';
  @override
  String get image => 'Image…';
  @override
  String get alignmentBlock => 'Alignment Block';
  @override
  String get list => 'List';
  @override
  String get blockQuotation => 'Block Quotation';
  @override
  String get verse => 'Verse';
  @override
  String get textConversation => 'Text Conversation';
  @override
  String get writtenNote => 'Written Note';
  @override
  String get webLink => 'Web Link';
  @override
  String get storeLink => 'Store Link';
  @override
  String get internalLink => 'Internal Link';
  @override
  String get endnote => 'Endnote';
  @override
  String get footnote => 'Footnote';
}

// Path: menu.preview.devices
class _Translations$menu$preview$devices$ar extends Translations$menu$preview$devices$en {
  _Translations$menu$preview$devices$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get kindle => 'Kindle';
  @override
  String get fire => 'Fire';
  @override
  String get paperwhite => 'Paperwhite';
  @override
  String get appleBooks => 'Apple Books';
  @override
  String get ipad => 'iPad';
  @override
  String get iphone => 'iPhone';
  @override
  String get nook => 'Nook';
  @override
  String get simpleTouch => 'Simple Touch';
  @override
  String get kobo => 'Kobo';
  @override
  String get clara => 'Clara';
  @override
  String get googlePlay => 'Google Play';
  @override
  String get androidTablet => 'Android Tablet';
  @override
  String get print => 'Print';
}
