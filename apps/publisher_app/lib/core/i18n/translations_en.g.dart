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

  /// en: 'Version $version'
  ///
  /// ar: 'الإصدار $version'
  String version({required Object version}) => 'Version ${version}';

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
  late final Translations$menu$chapter$en chapter = Translations$menu$chapter$en.internal(_root);
  late final Translations$menu$text$en text = Translations$menu$text$en.internal(_root);
  late final Translations$menu$preview$en preview = Translations$menu$preview$en.internal(_root);
  late final Translations$menu$view$en view = Translations$menu$view$en.internal(_root);
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
  /// ar: 'Word Craft'
  String get label => 'Word Craft';

  /// en: 'About Word Craft'
  ///
  /// ar: 'About Word Craft'
  String get about => 'About Word Craft';

  /// en: 'Check For Updates…'
  ///
  /// ar: 'Check For Updates…'
  String get checkForUpdates => 'Check For Updates…';

  /// en: 'Settings…'
  ///
  /// ar: 'Settings…'
  String get settings => 'Settings…';
}

// Path: menu.file
class Translations$menu$file$en {
  Translations$menu$file$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'File'
  ///
  /// ar: 'File'
  String get label => 'File';

  /// en: 'New Book'
  ///
  /// ar: 'New Book'
  String get newBook => 'New Book';

  /// en: 'New Book Set…'
  ///
  /// ar: 'New Book Set…'
  String get newBookSet => 'New Book Set…';

  /// en: 'Open…'
  ///
  /// ar: 'Open…'
  String get open => 'Open…';

  /// en: 'Open Recent'
  ///
  /// ar: 'Open Recent'
  String get openRecent => 'Open Recent';

  /// en: 'No Recent Books'
  ///
  /// ar: 'No Recent Books'
  String get noRecentBooks => 'No Recent Books';

  /// en: 'Clear Recents'
  ///
  /// ar: 'Clear Recents'
  String get clearRecents => 'Clear Recents';

  /// en: 'Import Word File…'
  ///
  /// ar: 'Import Word File…'
  String get importWordFile => 'Import Word File…';

  /// en: 'Close'
  ///
  /// ar: 'Close'
  String get close => 'Close';

  /// en: 'Save'
  ///
  /// ar: 'Save'
  String get save => 'Save';

  /// en: 'Duplicate'
  ///
  /// ar: 'Duplicate'
  String get duplicate => 'Duplicate';

  /// en: 'Rename'
  ///
  /// ar: 'Rename'
  String get rename => 'Rename';

  /// en: 'Move To'
  ///
  /// ar: 'Move To'
  String get moveTo => 'Move To';

  /// en: 'Revert To'
  ///
  /// ar: 'Revert To'
  String get revertTo => 'Revert To';

  /// en: 'No Document'
  ///
  /// ar: 'No Document'
  String get noDocument => 'No Document';

  /// en: 'Share'
  ///
  /// ar: 'Share'
  String get share => 'Share';

  /// en: 'Reimport Word File…'
  ///
  /// ar: 'Reimport Word File…'
  String get reimportWordFile => 'Reimport Word File…';

  /// en: 'Reuse Elements From'
  ///
  /// ar: 'Reuse Elements From'
  String get reuseElementsFrom => 'Reuse Elements From';

  /// en: 'Others…'
  ///
  /// ar: 'Others…'
  String get others => 'Others…';

  /// en: 'Reuse Summary…'
  ///
  /// ar: 'Reuse Summary…'
  String get reuseSummary => 'Reuse Summary…';

  /// en: 'Generate Books…'
  ///
  /// ar: 'Generate Books…'
  String get generateBooks => 'Generate Books…';

  /// en: 'Export Content As'
  ///
  /// ar: 'Export Content As'
  String get exportContentAs => 'Export Content As';

  /// en: 'Word File…'
  ///
  /// ar: 'Word File…'
  String get exportWordFile => 'Word File…';

  /// en: 'Rich Text Format…'
  ///
  /// ar: 'Rich Text Format…'
  String get exportRichTextFormat => 'Rich Text Format…';

  /// en: 'Select Platforms…'
  ///
  /// ar: 'Select Platforms…'
  String get selectPlatforms => 'Select Platforms…';

  /// en: 'Print Settings…'
  ///
  /// ar: 'Print Settings…'
  String get printSettings => 'Print Settings…';
}

// Path: menu.edit
class Translations$menu$edit$en {
  Translations$menu$edit$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Edit'
  ///
  /// ar: 'Edit'
  String get label => 'Edit';

  /// en: 'Undo'
  ///
  /// ar: 'Undo'
  String get undo => 'Undo';

  /// en: 'Redo'
  ///
  /// ar: 'Redo'
  String get redo => 'Redo';

  /// en: 'Cut'
  ///
  /// ar: 'Cut'
  String get cut => 'Cut';

  /// en: 'Copy'
  ///
  /// ar: 'Copy'
  String get copy => 'Copy';

  /// en: 'Paste'
  ///
  /// ar: 'Paste'
  String get paste => 'Paste';

  /// en: 'Paste and Match Style'
  ///
  /// ar: 'Paste and Match Style'
  String get pasteAndMatchStyle => 'Paste and Match Style';

  /// en: 'Delete'
  ///
  /// ar: 'Delete'
  String get delete => 'Delete';

  /// en: 'Select All'
  ///
  /// ar: 'Select All'
  String get selectAll => 'Select All';

  late final Translations$menu$edit$find$en find = Translations$menu$edit$find$en.internal(_root);
  late final Translations$menu$edit$spellingAndGrammar$en spellingAndGrammar =
      Translations$menu$edit$spellingAndGrammar$en.internal(_root);

  /// en: 'Substitutions'
  ///
  /// ar: 'Substitutions'
  String get substitutions => 'Substitutions';

  /// en: 'Transformations'
  ///
  /// ar: 'Transformations'
  String get transformations => 'Transformations';

  /// en: 'Speech'
  ///
  /// ar: 'Speech'
  String get speech => 'Speech';

  /// en: 'Special Characters'
  ///
  /// ar: 'Special Characters'
  String get specialCharacters => 'Special Characters';
}

// Path: menu.chapter
class Translations$menu$chapter$en {
  Translations$menu$chapter$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Chapter'
  ///
  /// ar: 'Chapter'
  String get label => 'Chapter';

  /// en: 'Add Chapter'
  ///
  /// ar: 'Add Chapter'
  String get addChapter => 'Add Chapter';

  /// en: 'Add Element'
  ///
  /// ar: 'Add Element'
  String get addElement => 'Add Element';

  /// en: 'Add Multiple Elements…'
  ///
  /// ar: 'Add Multiple Elements…'
  String get addMultipleElements => 'Add Multiple Elements…';

  /// en: 'Create Part from Selection'
  ///
  /// ar: 'Create Part from Selection'
  String get createPartFromSelection => 'Create Part from Selection';

  /// en: 'Create Volume from Selection'
  ///
  /// ar: 'Create Volume from Selection'
  String get createVolumeFromSelection => 'Create Volume from Selection';

  /// en: 'Convert To'
  ///
  /// ar: 'Convert To'
  String get convertTo => 'Convert To';

  /// en: 'Numbered'
  ///
  /// ar: 'Numbered'
  String get numbered => 'Numbered';

  /// en: 'Heading'
  ///
  /// ar: 'Heading'
  String get heading => 'Heading';

  /// en: 'Include In'
  ///
  /// ar: 'Include In'
  String get includeIn => 'Include In';

  /// en: 'Begin On'
  ///
  /// ar: 'Begin On'
  String get beginOn => 'Begin On';

  /// en: 'Insert Page Break'
  ///
  /// ar: 'Insert Page Break'
  String get insertPageBreak => 'Insert Page Break';

  /// en: 'Split Chapter at Cursor'
  ///
  /// ar: 'Split Chapter at Cursor'
  String get splitChapterAtCursor => 'Split Chapter at Cursor';

  /// en: 'Merge Selected Chapters'
  ///
  /// ar: 'Merge Selected Chapters'
  String get mergeSelectedChapters => 'Merge Selected Chapters';

  /// en: 'Go to Previous Chapter'
  ///
  /// ar: 'Go to Previous Chapter'
  String get goToPreviousChapter => 'Go to Previous Chapter';

  /// en: 'Go to Next Chapter'
  ///
  /// ar: 'Go to Next Chapter'
  String get goToNextChapter => 'Go to Next Chapter';

  /// en: 'Numbering…'
  ///
  /// ar: 'Numbering…'
  String get numbering => 'Numbering…';

  /// en: 'Terminology…'
  ///
  /// ar: 'Terminology…'
  String get terminology => 'Terminology…';

  late final Translations$menu$chapter$element$en element = Translations$menu$chapter$element$en.internal(_root);
  late final Translations$menu$chapter$convert$en convert = Translations$menu$chapter$convert$en.internal(_root);
  late final Translations$menu$chapter$include$en include = Translations$menu$chapter$include$en.internal(_root);
  late final Translations$menu$chapter$begin$en begin = Translations$menu$chapter$begin$en.internal(_root);
}

// Path: menu.text
class Translations$menu$text$en {
  Translations$menu$text$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Text'
  ///
  /// ar: 'Text'
  String get label => 'Text';

  /// en: 'Bold'
  ///
  /// ar: 'Bold'
  String get bold => 'Bold';

  /// en: 'Italic'
  ///
  /// ar: 'Italic'
  String get italic => 'Italic';

  /// en: 'Underline'
  ///
  /// ar: 'Underline'
  String get underline => 'Underline';

  /// en: 'Small Caps'
  ///
  /// ar: 'Small Caps'
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
  /// ar: 'Superscript'
  String get superscript => 'Superscript';

  /// en: 'Subscript'
  ///
  /// ar: 'Subscript'
  String get subscript => 'Subscript';

  /// en: 'Strikethrough'
  ///
  /// ar: 'Strikethrough'
  String get strikethrough => 'Strikethrough';

  /// en: 'Add Feature'
  ///
  /// ar: 'Add Feature'
  String get addFeature => 'Add Feature';

  late final Translations$menu$text$feature$en feature = Translations$menu$text$feature$en.internal(_root);
}

// Path: menu.preview
class Translations$menu$preview$en {
  Translations$menu$preview$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Preview'
  ///
  /// ar: 'Preview'
  String get label => 'Preview';

  /// en: 'Device'
  ///
  /// ar: 'Device'
  String get device => 'Device';

  /// en: 'Previous Page'
  ///
  /// ar: 'Previous Page'
  String get previousPage => 'Previous Page';

  /// en: 'Next Page'
  ///
  /// ar: 'Next Page'
  String get nextPage => 'Next Page';

  /// en: 'Previous Chapter'
  ///
  /// ar: 'Previous Chapter'
  String get previousChapter => 'Previous Chapter';

  /// en: 'Next Chapter'
  ///
  /// ar: 'Next Chapter'
  String get nextChapter => 'Next Chapter';

  /// en: 'Show Editor Content in Preview'
  ///
  /// ar: 'Show Editor Content in Preview'
  String get showEditorContentInPreview => 'Show Editor Content in Preview';

  /// en: 'Show Preview Content in Editor'
  ///
  /// ar: 'Show Preview Content in Editor'
  String get showPreviewContentInEditor => 'Show Preview Content in Editor';

  /// en: 'Limit to Page Size'
  ///
  /// ar: 'Limit to Page Size'
  String get limitToPageSize => 'Limit to Page Size';

  /// en: 'Show Bleed in Proof Mode'
  ///
  /// ar: 'Show Bleed in Proof Mode'
  String get showBleedInProofMode => 'Show Bleed in Proof Mode';

  late final Translations$menu$preview$devices$en devices = Translations$menu$preview$devices$en.internal(_root);
}

// Path: menu.view
class Translations$menu$view$en {
  Translations$menu$view$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'View'
  ///
  /// ar: 'View'
  String get label => 'View';

  /// en: 'Show Tab Bar'
  ///
  /// ar: 'Show Tab Bar'
  String get showTabBar => 'Show Tab Bar';

  /// en: 'Show All Tabs'
  ///
  /// ar: 'Show All Tabs'
  String get showAllTabs => 'Show All Tabs';

  /// en: 'Navigator'
  ///
  /// ar: 'Navigator'
  String get navigator => 'Navigator';

  /// en: 'Preview'
  ///
  /// ar: 'Preview'
  String get preview => 'Preview';

  /// en: 'Contents'
  ///
  /// ar: 'Contents'
  String get contents => 'Contents';

  /// en: 'Styles'
  ///
  /// ar: 'Styles'
  String get styles => 'Styles';

  /// en: 'Invisible Characters'
  ///
  /// ar: 'Invisible Characters'
  String get invisibleCharacters => 'Invisible Characters';

  /// en: 'Show Toolbar'
  ///
  /// ar: 'Show Toolbar'
  String get showToolbar => 'Show Toolbar';

  /// en: 'Customize Toolbar…'
  ///
  /// ar: 'Customize Toolbar…'
  String get customizeToolbar => 'Customize Toolbar…';

  /// en: 'Enter Full Screen'
  ///
  /// ar: 'Enter Full Screen'
  String get enterFullScreen => 'Enter Full Screen';
}

// Path: menu.window
class Translations$menu$window$en {
  Translations$menu$window$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Window'
  ///
  /// ar: 'Window'
  String get label => 'Window';

  /// en: 'Minimize'
  ///
  /// ar: 'Minimize'
  String get minimize => 'Minimize';

  /// en: 'Zoom'
  ///
  /// ar: 'Zoom'
  String get zoom => 'Zoom';

  /// en: 'Fill'
  ///
  /// ar: 'Fill'
  String get fill => 'Fill';

  /// en: 'Center'
  ///
  /// ar: 'Center'
  String get center => 'Center';

  /// en: 'Move & Resize'
  ///
  /// ar: 'Move & Resize'
  String get moveAndResize => 'Move & Resize';

  /// en: 'Full Screen Tile'
  ///
  /// ar: 'Full Screen Tile'
  String get fullScreenTile => 'Full Screen Tile';

  /// en: 'Remove Window from Set'
  ///
  /// ar: 'Remove Window from Set'
  String get removeWindowFromSet => 'Remove Window from Set';

  /// en: 'Show Photo Library'
  ///
  /// ar: 'Show Photo Library'
  String get showPhotoLibrary => 'Show Photo Library';

  /// en: 'Show Previous Tab'
  ///
  /// ar: 'Show Previous Tab'
  String get showPreviousTab => 'Show Previous Tab';

  /// en: 'Show Next Tab'
  ///
  /// ar: 'Show Next Tab'
  String get showNextTab => 'Show Next Tab';

  /// en: 'Move Tab to New Window'
  ///
  /// ar: 'Move Tab to New Window'
  String get moveTabToNewWindow => 'Move Tab to New Window';

  /// en: 'Merge All Windows'
  ///
  /// ar: 'Merge All Windows'
  String get mergeAllWindows => 'Merge All Windows';

  /// en: 'Bring All to Front'
  ///
  /// ar: 'Bring All to Front'
  String get bringAllToFront => 'Bring All to Front';

  /// en: 'Word Craft'
  ///
  /// ar: 'Word Craft'
  String get wordCraft => 'Word Craft';

  /// en: 'Halves'
  ///
  /// ar: 'Halves'
  String get halves => 'Halves';

  /// en: 'Left'
  ///
  /// ar: 'Left'
  String get left => 'Left';

  /// en: 'Right'
  ///
  /// ar: 'Right'
  String get right => 'Right';

  /// en: 'Top'
  ///
  /// ar: 'Top'
  String get top => 'Top';

  /// en: 'Bottom'
  ///
  /// ar: 'Bottom'
  String get bottom => 'Bottom';

  /// en: 'Quarters'
  ///
  /// ar: 'Quarters'
  String get quarters => 'Quarters';

  /// en: 'Top Left'
  ///
  /// ar: 'Top Left'
  String get topLeft => 'Top Left';

  /// en: 'Top Right'
  ///
  /// ar: 'Top Right'
  String get topRight => 'Top Right';

  /// en: 'Bottom Left'
  ///
  /// ar: 'Bottom Left'
  String get bottomLeft => 'Bottom Left';

  /// en: 'Bottom Right'
  ///
  /// ar: 'Bottom Right'
  String get bottomRight => 'Bottom Right';

  /// en: 'Arrange'
  ///
  /// ar: 'Arrange'
  String get arrange => 'Arrange';

  /// en: 'Left & Right'
  ///
  /// ar: 'Left & Right'
  String get leftAndRight => 'Left & Right';

  /// en: 'Right & Left'
  ///
  /// ar: 'Right & Left'
  String get rightAndLeft => 'Right & Left';

  /// en: 'Top & Bottom'
  ///
  /// ar: 'Top & Bottom'
  String get topAndBottom => 'Top & Bottom';

  /// en: 'Bottom & Top'
  ///
  /// ar: 'Bottom & Top'
  String get bottomAndTop => 'Bottom & Top';

  /// en: 'Return to Previous Size'
  ///
  /// ar: 'Return to Previous Size'
  String get returnToPreviousSize => 'Return to Previous Size';
}

// Path: menu.help
class Translations$menu$help$en {
  Translations$menu$help$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Help'
  ///
  /// ar: 'Help'
  String get label => 'Help';

  /// en: 'Search'
  ///
  /// ar: 'Search'
  String get search => 'Search';

  /// en: 'Word Craft Tutorial'
  ///
  /// ar: 'Word Craft Tutorial'
  String get tutorial => 'Word Craft Tutorial';

  /// en: 'Word Craft Help Overview'
  ///
  /// ar: 'Word Craft Help Overview'
  String get helpOverview => 'Word Craft Help Overview';

  /// en: 'Contact Word Craft Support…'
  ///
  /// ar: 'Contact Word Craft Support…'
  String get contactSupport => 'Contact Word Craft Support…';
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
  /// ar: 'Find'
  String get label => 'Find';

  /// en: 'Find…'
  ///
  /// ar: 'Find…'
  String get find => 'Find…';

  /// en: 'Find and Replace'
  ///
  /// ar: 'Find and Replace'
  String get findAndReplace => 'Find and Replace';

  /// en: 'Find Special…'
  ///
  /// ar: 'Find Special…'
  String get findSpecial => 'Find Special…';

  /// en: 'Find Next'
  ///
  /// ar: 'Find Next'
  String get findNext => 'Find Next';

  /// en: 'Find Previous'
  ///
  /// ar: 'Find Previous'
  String get findPrevious => 'Find Previous';

  /// en: 'Use Selection For Find'
  ///
  /// ar: 'Use Selection For Find'
  String get useSelectionForFind => 'Use Selection For Find';

  /// en: 'Jump to Selection'
  ///
  /// ar: 'Jump to Selection'
  String get jumpToSelection => 'Jump to Selection';
}

// Path: menu.edit.spellingAndGrammar
class Translations$menu$edit$spellingAndGrammar$en {
  Translations$menu$edit$spellingAndGrammar$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Spelling and Grammar'
  ///
  /// ar: 'Spelling and Grammar'
  String get label => 'Spelling and Grammar';

  /// en: 'Show Spelling and Grammar'
  ///
  /// ar: 'Show Spelling and Grammar'
  String get show => 'Show Spelling and Grammar';

  /// en: 'Check Document Now'
  ///
  /// ar: 'Check Document Now'
  String get checkDocumentNow => 'Check Document Now';

  /// en: 'Check Spelling While Typing'
  ///
  /// ar: 'Check Spelling While Typing'
  String get checkSpellingWhileTyping => 'Check Spelling While Typing';

  /// en: 'Check Grammar With Spelling'
  ///
  /// ar: 'Check Grammar With Spelling'
  String get checkGrammarWithSpelling => 'Check Grammar With Spelling';

  /// en: 'Correct Spelling Automatically'
  ///
  /// ar: 'Correct Spelling Automatically'
  String get correctSpellingAutomatically => 'Correct Spelling Automatically';
}

// Path: menu.chapter.element
class Translations$menu$chapter$element$en {
  Translations$menu$chapter$element$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Blurbs'
  ///
  /// ar: 'Blurbs'
  String get blurbs => 'Blurbs';

  /// en: 'Half Title'
  ///
  /// ar: 'Half Title'
  String get halfTitle => 'Half Title';

  /// en: 'Title Page'
  ///
  /// ar: 'Title Page'
  String get titlePage => 'Title Page';

  /// en: 'Copyright'
  ///
  /// ar: 'Copyright'
  String get copyright => 'Copyright';

  /// en: 'Dedication'
  ///
  /// ar: 'Dedication'
  String get dedication => 'Dedication';

  /// en: 'Epigraph'
  ///
  /// ar: 'Epigraph'
  String get epigraph => 'Epigraph';

  /// en: 'Table of Contents'
  ///
  /// ar: 'Table of Contents'
  String get tableOfContents => 'Table of Contents';

  /// en: 'Foreword'
  ///
  /// ar: 'Foreword'
  String get foreword => 'Foreword';

  /// en: 'Introduction'
  ///
  /// ar: 'Introduction'
  String get introduction => 'Introduction';

  /// en: 'Preface'
  ///
  /// ar: 'Preface'
  String get preface => 'Preface';

  /// en: 'Prologue'
  ///
  /// ar: 'Prologue'
  String get prologue => 'Prologue';

  /// en: 'Epilogue'
  ///
  /// ar: 'Epilogue'
  String get epilogue => 'Epilogue';

  /// en: 'Afterword'
  ///
  /// ar: 'Afterword'
  String get afterword => 'Afterword';

  /// en: 'Endnotes'
  ///
  /// ar: 'Endnotes'
  String get endnotes => 'Endnotes';

  /// en: 'Bibliography'
  ///
  /// ar: 'Bibliography'
  String get bibliography => 'Bibliography';

  /// en: 'Acknowledgments'
  ///
  /// ar: 'Acknowledgments'
  String get acknowledgments => 'Acknowledgments';

  /// en: 'About the Author'
  ///
  /// ar: 'About the Author'
  String get aboutTheAuthor => 'About the Author';

  /// en: 'Also By'
  ///
  /// ar: 'Also By'
  String get alsoBy => 'Also By';

  /// en: 'Full Page Image'
  ///
  /// ar: 'Full Page Image'
  String get fullPageImage => 'Full Page Image';

  /// en: 'Uncategorized'
  ///
  /// ar: 'Uncategorized'
  String get uncategorized => 'Uncategorized';
}

// Path: menu.chapter.convert
class Translations$menu$chapter$convert$en {
  Translations$menu$chapter$convert$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Chapter'
  ///
  /// ar: 'Chapter'
  String get chapter => 'Chapter';

  /// en: 'Blurbs'
  ///
  /// ar: 'Blurbs'
  String get blurbs => 'Blurbs';

  /// en: 'Copyright'
  ///
  /// ar: 'Copyright'
  String get copyright => 'Copyright';

  /// en: 'Dedication'
  ///
  /// ar: 'Dedication'
  String get dedication => 'Dedication';

  /// en: 'Epigraph'
  ///
  /// ar: 'Epigraph'
  String get epigraph => 'Epigraph';

  /// en: 'Foreword'
  ///
  /// ar: 'Foreword'
  String get foreword => 'Foreword';

  /// en: 'Introduction'
  ///
  /// ar: 'Introduction'
  String get introduction => 'Introduction';

  /// en: 'Preface'
  ///
  /// ar: 'Preface'
  String get preface => 'Preface';

  /// en: 'Prologue'
  ///
  /// ar: 'Prologue'
  String get prologue => 'Prologue';

  /// en: 'Epilogue'
  ///
  /// ar: 'Epilogue'
  String get epilogue => 'Epilogue';

  /// en: 'Afterword'
  ///
  /// ar: 'Afterword'
  String get afterword => 'Afterword';

  /// en: 'Bibliography'
  ///
  /// ar: 'Bibliography'
  String get bibliography => 'Bibliography';

  /// en: 'Acknowledgments'
  ///
  /// ar: 'Acknowledgments'
  String get acknowledgments => 'Acknowledgments';

  /// en: 'About the Author'
  ///
  /// ar: 'About the Author'
  String get aboutTheAuthor => 'About the Author';

  /// en: 'Also By'
  ///
  /// ar: 'Also By'
  String get alsoBy => 'Also By';

  /// en: 'Uncategorized'
  ///
  /// ar: 'Uncategorized'
  String get uncategorized => 'Uncategorized';
}

// Path: menu.chapter.include
class Translations$menu$chapter$include$en {
  Translations$menu$chapter$include$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'All Editions'
  ///
  /// ar: 'All Editions'
  String get allEditions => 'All Editions';

  /// en: 'Ebooks only'
  ///
  /// ar: 'Ebooks only'
  String get ebooksOnly => 'Ebooks only';

  /// en: 'Print only'
  ///
  /// ar: 'Print only'
  String get printOnly => 'Print only';
}

// Path: menu.chapter.begin
class Translations$menu$chapter$begin$en {
  Translations$menu$chapter$begin$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Right Side of Spread'
  ///
  /// ar: 'Right Side of Spread'
  String get rightSideOfSpread => 'Right Side of Spread';

  /// en: 'Either Side of Spread'
  ///
  /// ar: 'Either Side of Spread'
  String get eitherSideOfSpread => 'Either Side of Spread';
}

// Path: menu.text.feature
class Translations$menu$text$feature$en {
  Translations$menu$text$feature$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Subhead'
  ///
  /// ar: 'Subhead'
  String get subhead => 'Subhead';

  /// en: 'Ornamental Break'
  ///
  /// ar: 'Ornamental Break'
  String get ornamentalBreak => 'Ornamental Break';

  /// en: 'Image…'
  ///
  /// ar: 'Image…'
  String get image => 'Image…';

  /// en: 'Alignment Block'
  ///
  /// ar: 'Alignment Block'
  String get alignmentBlock => 'Alignment Block';

  /// en: 'List'
  ///
  /// ar: 'List'
  String get list => 'List';

  /// en: 'Block Quotation'
  ///
  /// ar: 'Block Quotation'
  String get blockQuotation => 'Block Quotation';

  /// en: 'Verse'
  ///
  /// ar: 'Verse'
  String get verse => 'Verse';

  /// en: 'Text Conversation'
  ///
  /// ar: 'Text Conversation'
  String get textConversation => 'Text Conversation';

  /// en: 'Written Note'
  ///
  /// ar: 'Written Note'
  String get writtenNote => 'Written Note';

  /// en: 'Web Link'
  ///
  /// ar: 'Web Link'
  String get webLink => 'Web Link';

  /// en: 'Store Link'
  ///
  /// ar: 'Store Link'
  String get storeLink => 'Store Link';

  /// en: 'Internal Link'
  ///
  /// ar: 'Internal Link'
  String get internalLink => 'Internal Link';

  /// en: 'Endnote'
  ///
  /// ar: 'Endnote'
  String get endnote => 'Endnote';

  /// en: 'Footnote'
  ///
  /// ar: 'Footnote'
  String get footnote => 'Footnote';
}

// Path: menu.preview.devices
class Translations$menu$preview$devices$en {
  Translations$menu$preview$devices$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Kindle'
  ///
  /// ar: 'Kindle'
  String get kindle => 'Kindle';

  /// en: 'Fire'
  ///
  /// ar: 'Fire'
  String get fire => 'Fire';

  /// en: 'Paperwhite'
  ///
  /// ar: 'Paperwhite'
  String get paperwhite => 'Paperwhite';

  /// en: 'Apple Books'
  ///
  /// ar: 'Apple Books'
  String get appleBooks => 'Apple Books';

  /// en: 'iPad'
  ///
  /// ar: 'iPad'
  String get ipad => 'iPad';

  /// en: 'iPhone'
  ///
  /// ar: 'iPhone'
  String get iphone => 'iPhone';

  /// en: 'Nook'
  ///
  /// ar: 'Nook'
  String get nook => 'Nook';

  /// en: 'Simple Touch'
  ///
  /// ar: 'Simple Touch'
  String get simpleTouch => 'Simple Touch';

  /// en: 'Kobo'
  ///
  /// ar: 'Kobo'
  String get kobo => 'Kobo';

  /// en: 'Clara'
  ///
  /// ar: 'Clara'
  String get clara => 'Clara';

  /// en: 'Google Play'
  ///
  /// ar: 'Google Play'
  String get googlePlay => 'Google Play';

  /// en: 'Android Tablet'
  ///
  /// ar: 'Android Tablet'
  String get androidTablet => 'Android Tablet';

  /// en: 'Print'
  ///
  /// ar: 'Print'
  String get print => 'Print';
}
