Below is a clean Vellum-style menu implementation for your current structure.

Your current app already wraps `MaterialApp.router` with `PlatformMenuBar` and calls `menuApp()`, `menuFile()`, `menuEdit()`, `menuChapter()`, `menuText()`, `menuPreview()`, `menuView()`, `menuWindows()`, and `menuHelp()` . The problem is that several menu files are still hardcoded, `menuChapter()` and `menuPreview()` are empty  , and `menuText()` is still using the wrong lowercase label and repeated static strings .

Slang supports JSON translation files, nested keys, namespaces, type-safe access, and `dart run slang` generation; it also documents `assets/i18n` as a valid input directory and `.i18n.json` as the common file pattern. ([Dart packages][1]) Flutter’s `PlatformMenuBar` is the correct native macOS menu API; it supplies menu data to the platform and has no normal visual representation in the widget tree. ([api.flutter.dev][2])

---

## 1. Replace `assets/i18n/en/menu.i18n.json`

```json
{
  "app": {
    "label": "Word Craft",
    "about": "About Word Craft",
    "checkForUpdates": "Check For Updates…",
    "settings": "Settings…"
  },
  "file": {
    "label": "File",
    "newBook": "New Book",
    "newBookSet": "New Book Set…",
    "open": "Open…",
    "openRecent": "Open Recent",
    "noRecentBooks": "No Recent Books",
    "clearRecents": "Clear Recents",
    "importWordFile": "Import Word File…",
    "close": "Close",
    "save": "Save",
    "duplicate": "Duplicate",
    "rename": "Rename",
    "moveTo": "Move To",
    "revertTo": "Revert To",
    "noDocument": "No Document",
    "share": "Share",
    "reimportWordFile": "Reimport Word File…",
    "reuseElementsFrom": "Reuse Elements From",
    "others": "Others…",
    "reuseSummary": "Reuse Summary…",
    "generateBooks": "Generate Books…",
    "exportContentAs": "Export Content As",
    "exportWordFile": "Word File…",
    "exportRichTextFormat": "Rich Text Format…",
    "selectPlatforms": "Select Platforms…",
    "printSettings": "Print Settings…"
  },
  "edit": {
    "label": "Edit",
    "undo": "Undo",
    "redo": "Redo",
    "cut": "Cut",
    "copy": "Copy",
    "paste": "Paste",
    "pasteAndMatchStyle": "Paste and Match Style",
    "delete": "Delete",
    "selectAll": "Select All",
    "find": {
      "label": "Find",
      "find": "Find…",
      "findAndReplace": "Find and Replace",
      "findSpecial": "Find Special…",
      "findNext": "Find Next",
      "findPrevious": "Find Previous",
      "useSelectionForFind": "Use Selection For Find",
      "jumpToSelection": "Jump to Selection"
    },
    "spellingAndGrammar": {
      "label": "Spelling and Grammar",
      "show": "Show Spelling and Grammar",
      "checkDocumentNow": "Check Document Now",
      "checkSpellingWhileTyping": "Check Spelling While Typing",
      "checkGrammarWithSpelling": "Check Grammar With Spelling",
      "correctSpellingAutomatically": "Correct Spelling Automatically"
    },
    "substitutions": "Substitutions",
    "transformations": "Transformations",
    "speech": "Speech",
    "specialCharacters": "Special Characters"
  },
  "chapter": {
    "label": "Chapter",
    "addChapter": "Add Chapter",
    "addElement": "Add Element",
    "addMultipleElements": "Add Multiple Elements…",
    "createPartFromSelection": "Create Part from Selection",
    "createVolumeFromSelection": "Create Volume from Selection",
    "convertTo": "Convert To",
    "numbered": "Numbered",
    "heading": "Heading",
    "includeIn": "Include In",
    "beginOn": "Begin On",
    "insertPageBreak": "Insert Page Break",
    "splitChapterAtCursor": "Split Chapter at Cursor",
    "mergeSelectedChapters": "Merge Selected Chapters",
    "goToPreviousChapter": "Go to Previous Chapter",
    "goToNextChapter": "Go to Next Chapter",
    "numbering": "Numbering…",
    "terminology": "Terminology…",
    "element": {
      "blurbs": "Blurbs",
      "halfTitle": "Half Title",
      "titlePage": "Title Page",
      "copyright": "Copyright",
      "dedication": "Dedication",
      "epigraph": "Epigraph",
      "tableOfContents": "Table of Contents",
      "foreword": "Foreword",
      "introduction": "Introduction",
      "preface": "Preface",
      "prologue": "Prologue",
      "epilogue": "Epilogue",
      "afterword": "Afterword",
      "endnotes": "Endnotes",
      "bibliography": "Bibliography",
      "acknowledgments": "Acknowledgments",
      "aboutTheAuthor": "About the Author",
      "alsoBy": "Also By",
      "fullPageImage": "Full Page Image",
      "uncategorized": "Uncategorized"
    },
    "convert": {
      "chapter": "Chapter",
      "blurbs": "Blurbs",
      "copyright": "Copyright",
      "dedication": "Dedication",
      "epigraph": "Epigraph",
      "foreword": "Foreword",
      "introduction": "Introduction",
      "preface": "Preface",
      "prologue": "Prologue",
      "epilogue": "Epilogue",
      "afterword": "Afterword",
      "bibliography": "Bibliography",
      "acknowledgments": "Acknowledgments",
      "aboutTheAuthor": "About the Author",
      "alsoBy": "Also By",
      "uncategorized": "Uncategorized"
    },
    "include": {
      "allEditions": "All Editions",
      "ebooksOnly": "Ebooks only",
      "printOnly": "Print only"
    },
    "begin": {
      "rightSideOfSpread": "Right Side of Spread",
      "eitherSideOfSpread": "Either Side of Spread"
    }
  },
  "text": {
    "label": "Text",
    "bold": "Bold",
    "italic": "Italic",
    "underline": "Underline",
    "smallCaps": "Small Caps",
    "sansSerif": "Sans Serif",
    "monospace": "Monospace",
    "superscript": "Superscript",
    "subscript": "Subscript",
    "strikethrough": "Strikethrough",
    "addFeature": "Add Feature",
    "feature": {
      "subhead": "Subhead",
      "ornamentalBreak": "Ornamental Break",
      "image": "Image…",
      "alignmentBlock": "Alignment Block",
      "list": "List",
      "blockQuotation": "Block Quotation",
      "verse": "Verse",
      "textConversation": "Text Conversation",
      "writtenNote": "Written Note",
      "webLink": "Web Link",
      "storeLink": "Store Link",
      "internalLink": "Internal Link",
      "endnote": "Endnote",
      "footnote": "Footnote"
    }
  },
  "preview": {
    "label": "Preview",
    "device": "Device",
    "previousPage": "Previous Page",
    "nextPage": "Next Page",
    "previousChapter": "Previous Chapter",
    "nextChapter": "Next Chapter",
    "showEditorContentInPreview": "Show Editor Content in Preview",
    "showPreviewContentInEditor": "Show Preview Content in Editor",
    "limitToPageSize": "Limit to Page Size",
    "showBleedInProofMode": "Show Bleed in Proof Mode",
    "devices": {
      "kindle": "Kindle",
      "fire": "Fire",
      "paperwhite": "Paperwhite",
      "appleBooks": "Apple Books",
      "ipad": "iPad",
      "iphone": "iPhone",
      "nook": "Nook",
      "simpleTouch": "Simple Touch",
      "kobo": "Kobo",
      "clara": "Clara",
      "googlePlay": "Google Play",
      "androidTablet": "Android Tablet",
      "print": "Print"
    }
  },
  "view": {
    "label": "View",
    "showTabBar": "Show Tab Bar",
    "showAllTabs": "Show All Tabs",
    "navigator": "Navigator",
    "preview": "Preview",
    "contents": "Contents",
    "styles": "Styles",
    "invisibleCharacters": "Invisible Characters",
    "showToolbar": "Show Toolbar",
    "customizeToolbar": "Customize Toolbar…",
    "enterFullScreen": "Enter Full Screen"
  },
  "window": {
    "label": "Window",
    "minimize": "Minimize",
    "zoom": "Zoom",
    "fill": "Fill",
    "center": "Center",
    "moveAndResize": "Move & Resize",
    "fullScreenTile": "Full Screen Tile",
    "removeWindowFromSet": "Remove Window from Set",
    "showPhotoLibrary": "Show Photo Library",
    "showPreviousTab": "Show Previous Tab",
    "showNextTab": "Show Next Tab",
    "moveTabToNewWindow": "Move Tab to New Window",
    "mergeAllWindows": "Merge All Windows",
    "bringAllToFront": "Bring All to Front",
    "wordCraft": "Word Craft",
    "halves": "Halves",
    "left": "Left",
    "right": "Right",
    "top": "Top",
    "bottom": "Bottom",
    "quarters": "Quarters",
    "topLeft": "Top Left",
    "topRight": "Top Right",
    "bottomLeft": "Bottom Left",
    "bottomRight": "Bottom Right",
    "arrange": "Arrange",
    "leftAndRight": "Left & Right",
    "rightAndLeft": "Right & Left",
    "topAndBottom": "Top & Bottom",
    "bottomAndTop": "Bottom & Top",
    "returnToPreviousSize": "Return to Previous Size"
  },
  "help": {
    "label": "Help",
    "search": "Search",
    "tutorial": "Word Craft Tutorial",
    "helpOverview": "Word Craft Help Overview",
    "contactSupport": "Contact Word Craft Support…"
  }
}
```

---

## 2. Replace `assets/i18n/ar/menu.i18n.json`

```json
{
  "app": {
    "label": "وورد كرافت",
    "about": "حول وورد كرافت",
    "checkForUpdates": "التحقق من التحديثات…",
    "settings": "الإعدادات…"
  },
  "file": {
    "label": "ملف",
    "newBook": "كتاب جديد",
    "newBookSet": "مجموعة كتب جديدة…",
    "open": "فتح…",
    "openRecent": "فتح ملف حديث",
    "noRecentBooks": "لا توجد كتب حديثة",
    "clearRecents": "مسح الملفات الحديثة",
    "importWordFile": "استيراد ملف وورد…",
    "close": "إغلاق",
    "save": "حفظ",
    "duplicate": "نسخ",
    "rename": "إعادة تسمية",
    "moveTo": "نقل إلى",
    "revertTo": "الرجوع إلى",
    "noDocument": "لا يوجد مستند",
    "share": "مشاركة",
    "reimportWordFile": "إعادة استيراد ملف وورد…",
    "reuseElementsFrom": "إعادة استخدام عناصر من",
    "others": "أخرى…",
    "reuseSummary": "إعادة استخدام الملخص…",
    "generateBooks": "توليد الكتب…",
    "exportContentAs": "تصدير المحتوى كـ",
    "exportWordFile": "ملف وورد…",
    "exportRichTextFormat": "تنسيق نص منسق…",
    "selectPlatforms": "اختيار المنصات…",
    "printSettings": "إعدادات الطباعة…"
  },
  "edit": {
    "label": "تحرير",
    "undo": "تراجع",
    "redo": "إعادة",
    "cut": "قص",
    "copy": "نسخ",
    "paste": "لصق",
    "pasteAndMatchStyle": "لصق ومطابقة النمط",
    "delete": "حذف",
    "selectAll": "تحديد الكل",
    "find": {
      "label": "بحث",
      "find": "بحث…",
      "findAndReplace": "بحث واستبدال",
      "findSpecial": "بحث خاص…",
      "findNext": "بحث عن التالي",
      "findPrevious": "بحث عن السابق",
      "useSelectionForFind": "استخدام التحديد للبحث",
      "jumpToSelection": "الانتقال إلى التحديد"
    },
    "spellingAndGrammar": {
      "label": "الإملاء والقواعد",
      "show": "عرض الإملاء والقواعد",
      "checkDocumentNow": "فحص المستند الآن",
      "checkSpellingWhileTyping": "فحص الإملاء أثناء الكتابة",
      "checkGrammarWithSpelling": "فحص القواعد مع الإملاء",
      "correctSpellingAutomatically": "تصحيح الإملاء تلقائيًا"
    },
    "substitutions": "الاستبدالات",
    "transformations": "التحويلات",
    "speech": "النطق",
    "specialCharacters": "الأحرف الخاصة"
  },
  "chapter": {
    "label": "الفصل",
    "addChapter": "إضافة فصل",
    "addElement": "إضافة عنصر",
    "addMultipleElements": "إضافة عدة عناصر…",
    "createPartFromSelection": "إنشاء جزء من التحديد",
    "createVolumeFromSelection": "إنشاء مجلد من التحديد",
    "convertTo": "تحويل إلى",
    "numbered": "مرقم",
    "heading": "العنوان",
    "includeIn": "التضمين في",
    "beginOn": "يبدأ على",
    "insertPageBreak": "إدراج فاصل صفحة",
    "splitChapterAtCursor": "تقسيم الفصل عند المؤشر",
    "mergeSelectedChapters": "دمج الفصول المحددة",
    "goToPreviousChapter": "الانتقال إلى الفصل السابق",
    "goToNextChapter": "الانتقال إلى الفصل التالي",
    "numbering": "الترقيم…",
    "terminology": "المصطلحات…",
    "element": {
      "blurbs": "النصوص الترويجية",
      "halfTitle": "نصف العنوان",
      "titlePage": "صفحة العنوان",
      "copyright": "حقوق النشر",
      "dedication": "الإهداء",
      "epigraph": "الاقتباس الافتتاحي",
      "tableOfContents": "جدول المحتويات",
      "foreword": "التقديم",
      "introduction": "المقدمة",
      "preface": "التمهيد",
      "prologue": "الافتتاحية",
      "epilogue": "الخاتمة",
      "afterword": "كلمة ختامية",
      "endnotes": "ملاحظات ختامية",
      "bibliography": "المراجع",
      "acknowledgments": "الشكر والتقدير",
      "aboutTheAuthor": "عن المؤلف",
      "alsoBy": "من أعماله أيضًا",
      "fullPageImage": "صورة صفحة كاملة",
      "uncategorized": "غير مصنف"
    },
    "convert": {
      "chapter": "فصل",
      "blurbs": "نصوص ترويجية",
      "copyright": "حقوق النشر",
      "dedication": "إهداء",
      "epigraph": "اقتباس افتتاحي",
      "foreword": "تقديم",
      "introduction": "مقدمة",
      "preface": "تمهيد",
      "prologue": "افتتاحية",
      "epilogue": "خاتمة",
      "afterword": "كلمة ختامية",
      "bibliography": "مراجع",
      "acknowledgments": "شكر وتقدير",
      "aboutTheAuthor": "عن المؤلف",
      "alsoBy": "من أعماله أيضًا",
      "uncategorized": "غير مصنف"
    },
    "include": {
      "allEditions": "كل الإصدارات",
      "ebooksOnly": "الكتب الإلكترونية فقط",
      "printOnly": "الطباعة فقط"
    },
    "begin": {
      "rightSideOfSpread": "الجانب الأيمن من الصفحة المزدوجة",
      "eitherSideOfSpread": "أي جانب من الصفحة المزدوجة"
    }
  },
  "text": {
    "label": "النص",
    "bold": "غامق",
    "italic": "مائل",
    "underline": "تحته خط",
    "smallCaps": "حروف صغيرة كبيرة",
    "sansSerif": "Sans Serif",
    "monospace": "Monospace",
    "superscript": "نص علوي",
    "subscript": "نص سفلي",
    "strikethrough": "يتوسطه خط",
    "addFeature": "إضافة ميزة",
    "feature": {
      "subhead": "عنوان فرعي",
      "ornamentalBreak": "فاصل زخرفي",
      "image": "صورة…",
      "alignmentBlock": "كتلة محاذاة",
      "list": "قائمة",
      "blockQuotation": "اقتباس كتلي",
      "verse": "شعر",
      "textConversation": "محادثة نصية",
      "writtenNote": "ملاحظة مكتوبة",
      "webLink": "رابط ويب",
      "storeLink": "رابط متجر",
      "internalLink": "رابط داخلي",
      "endnote": "ملاحظة ختامية",
      "footnote": "حاشية"
    }
  },
  "preview": {
    "label": "معاينة",
    "device": "الجهاز",
    "previousPage": "الصفحة السابقة",
    "nextPage": "الصفحة التالية",
    "previousChapter": "الفصل السابق",
    "nextChapter": "الفصل التالي",
    "showEditorContentInPreview": "عرض محتوى المحرر في المعاينة",
    "showPreviewContentInEditor": "عرض محتوى المعاينة في المحرر",
    "limitToPageSize": "تقييد بحجم الصفحة",
    "showBleedInProofMode": "إظهار الهوامش النازفة في وضع التدقيق",
    "devices": {
      "kindle": "Kindle",
      "fire": "Fire",
      "paperwhite": "Paperwhite",
      "appleBooks": "Apple Books",
      "ipad": "iPad",
      "iphone": "iPhone",
      "nook": "Nook",
      "simpleTouch": "Simple Touch",
      "kobo": "Kobo",
      "clara": "Clara",
      "googlePlay": "Google Play",
      "androidTablet": "Android Tablet",
      "print": "Print"
    }
  },
  "view": {
    "label": "عرض",
    "showTabBar": "إظهار شريط التبويب",
    "showAllTabs": "إظهار كل التبويبات",
    "navigator": "المتصفح",
    "preview": "المعاينة",
    "contents": "المحتويات",
    "styles": "الأنماط",
    "invisibleCharacters": "الأحرف المخفية",
    "showToolbar": "إظهار شريط الأدوات",
    "customizeToolbar": "تخصيص شريط الأدوات…",
    "enterFullScreen": "دخول ملء الشاشة"
  },
  "window": {
    "label": "نافذة",
    "minimize": "تصغير",
    "zoom": "تكبير",
    "fill": "ملء",
    "center": "توسيط",
    "moveAndResize": "تحريك وتغيير الحجم",
    "fullScreenTile": "تجانب ملء الشاشة",
    "removeWindowFromSet": "إزالة النافذة من المجموعة",
    "showPhotoLibrary": "عرض مكتبة الصور",
    "showPreviousTab": "إظهار التبويب السابق",
    "showNextTab": "إظهار التبويب التالي",
    "moveTabToNewWindow": "نقل التبويب إلى نافذة جديدة",
    "mergeAllWindows": "دمج كل النوافذ",
    "bringAllToFront": "إحضار الكل إلى المقدمة",
    "wordCraft": "وورد كرافت",
    "halves": "أنصاف",
    "left": "يسار",
    "right": "يمين",
    "top": "أعلى",
    "bottom": "أسفل",
    "quarters": "أرباع",
    "topLeft": "أعلى اليسار",
    "topRight": "أعلى اليمين",
    "bottomLeft": "أسفل اليسار",
    "bottomRight": "أسفل اليمين",
    "arrange": "ترتيب",
    "leftAndRight": "يسار ويمين",
    "rightAndLeft": "يمين ويسار",
    "topAndBottom": "أعلى وأسفل",
    "bottomAndTop": "أسفل وأعلى",
    "returnToPreviousSize": "العودة إلى الحجم السابق"
  },
  "help": {
    "label": "مساعدة",
    "search": "بحث",
    "tutorial": "شرح وورد كرافت",
    "helpOverview": "نظرة عامة على مساعدة وورد كرافت",
    "contactSupport": "التواصل مع دعم وورد كرافت…"
  }
}
```

---

## 3. Replace `lib/app/menu/menu.dart`

```dart
export 'menu_app.dart';
export 'menu_chapter.dart';
export 'menu_edit.dart';
export 'menu_file.dart';
export 'menu_help.dart';
export 'menu_preview.dart';
export 'menu_text.dart';
export 'menu_view.dart';
export 'menu_windows.dart';
```

---

## 4. Replace `lib/app/menu/menu_app.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuApp() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.application,
    label: t.menu.app.label,
    menus: [
      if (PlatformProvidedMenuItem.hasMenu(PlatformProvidedMenuItemType.about))
        const PlatformProvidedMenuItem(
          type: PlatformProvidedMenuItemType.about,
        ),
      PlatformMenuItem(
        label: t.menu.app.checkForUpdates,
        onSelected: () {},
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.menu.app.settings,
            onSelected: () {},
          ),
          if (PlatformProvidedMenuItem.hasMenu(PlatformProvidedMenuItemType.hide))
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.hide,
            ),
          if (PlatformProvidedMenuItem.hasMenu(
            PlatformProvidedMenuItemType.hideOtherApplications,
          ))
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.hideOtherApplications,
            ),
        ],
      ),
      if (PlatformProvidedMenuItem.hasMenu(
        PlatformProvidedMenuItemType.showAllApplications,
      ))
        const PlatformProvidedMenuItem(
          type: PlatformProvidedMenuItemType.showAllApplications,
        ),
      if (PlatformProvidedMenuItem.hasMenu(PlatformProvidedMenuItemType.quit))
        const PlatformProvidedMenuItem(
          type: PlatformProvidedMenuItemType.quit,
        ),
    ],
  );
}
```

---

## 5. Replace `lib/app/menu/menu_file.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuFile() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.file,
    label: t.menu.file.label,
    removeDefaultItems: true,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.file.newBook,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyN, meta: true),
            onSelected: () {},
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.newBookSet,
            onSelected: () {},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.file.open,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyO, meta: true),
            onSelected: () {},
          ),
          EnhancedPlatformMenu.custom(
            label: t.menu.file.openRecent,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.file.clearRecents,
                onSelected: () {},
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.importWordFile,
            onSelected: () {},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.file.close,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyW, meta: true),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.save,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyS, meta: true),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.duplicate,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyS,
              shift: true,
              meta: true,
            ),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.rename,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.moveTo,
            onSelected: null,
          ),
          EnhancedPlatformMenu.custom(
            label: t.menu.file.revertTo,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.file.noDocument,
                onSelected: null,
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.menu.file.share,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.file.noDocument,
                onSelected: null,
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.file.reimportWordFile,
            onSelected: null,
          ),
          EnhancedPlatformMenu.custom(
            label: t.menu.file.reuseElementsFrom,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.file.others,
                onSelected: null,
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.reuseSummary,
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.file.generateBooks,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyB,
              shift: true,
              meta: true,
            ),
            onSelected: () {},
          ),
          EnhancedPlatformMenu.custom(
            label: t.menu.file.exportContentAs,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.file.exportWordFile,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.file.exportRichTextFormat,
                onSelected: null,
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.file.selectPlatforms,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.file.printSettings,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyP,
              shift: true,
              meta: true,
            ),
            onSelected: null,
          ),
        ],
      ),
    ],
  );
}
```

---

## 6. Replace `lib/app/menu/menu_edit.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

bool spellingWhileTyping = true;
bool checkGrammarWithSpelling = true;
bool correctSpellingAutomatically = true;

void toggleSpellingWhileTyping() {
  spellingWhileTyping = !spellingWhileTyping;
}

void toggleCheckGrammarWithSpelling() {
  checkGrammarWithSpelling = !checkGrammarWithSpelling;
}

void toggleCorrectSpellingAutomatically() {
  correctSpellingAutomatically = !correctSpellingAutomatically;
}

EnhancedPlatformMenu menuEdit() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.edit,
    label: t.menu.edit.label,
    menus: [
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.menu.edit.undo,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyZ, meta: true),
            onSelected: null,
          ),
          PlatformMenuItem(
            label: t.menu.edit.redo,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyZ,
              meta: true,
              shift: true,
            ),
            onSelected: null,
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.menu.edit.cut,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyX, meta: true),
            onSelected: null,
          ),
          PlatformMenuItem(
            label: t.menu.edit.copy,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyC, meta: true),
            onSelected: null,
          ),
          PlatformMenuItem(
            label: t.menu.edit.paste,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyV, meta: true),
            onSelected: null,
          ),
          PlatformMenuItem(
            label: t.menu.edit.pasteAndMatchStyle,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyV,
              alt: true,
              shift: true,
              meta: true,
            ),
            onSelected: null,
          ),
          PlatformMenuItem(
            label: t.menu.edit.delete,
            shortcut: const SingleActivator(LogicalKeyboardKey.backspace),
            onSelected: null,
          ),
          PlatformMenuItem(
            label: t.menu.edit.selectAll,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyA, meta: true),
            onSelected: null,
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenu(
            label: t.menu.edit.find.label,
            menus: [
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.menu.edit.find.find,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyF,
                      meta: true,
                    ),
                    onSelected: null,
                  ),
                  PlatformMenuItem(
                    label: t.menu.edit.find.findAndReplace,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyF,
                      control: true,
                      meta: true,
                    ),
                    onSelected: null,
                  ),
                  PlatformMenuItem(
                    label: t.menu.edit.find.findSpecial,
                    onSelected: null,
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.menu.edit.find.findNext,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyG,
                      meta: true,
                    ),
                    onSelected: null,
                  ),
                  PlatformMenuItem(
                    label: t.menu.edit.find.findPrevious,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyG,
                      meta: true,
                      shift: true,
                    ),
                    onSelected: null,
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.menu.edit.find.useSelectionForFind,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyE,
                      meta: true,
                    ),
                    onSelected: null,
                  ),
                  PlatformMenuItem(
                    label: t.menu.edit.find.jumpToSelection,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyJ,
                      meta: true,
                    ),
                    onSelected: null,
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: t.menu.edit.spellingAndGrammar.label,
            menus: [
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.menu.edit.spellingAndGrammar.show,
                    onSelected: null,
                  ),
                  PlatformMenuItem(
                    label: t.menu.edit.spellingAndGrammar.checkDocumentNow,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.semicolon,
                      meta: true,
                    ),
                    onSelected: null,
                  ),
                ],
              ),
              EnhancedPlatformMenuItemGroup(
                members: [
                  EnhancedPlatformMenuItem(
                    label: t.menu.edit.spellingAndGrammar.checkSpellingWhileTyping,
                    checked: spellingWhileTyping,
                    onSelected: toggleSpellingWhileTyping,
                  ),
                  EnhancedPlatformMenuItem(
                    label: t.menu.edit.spellingAndGrammar.checkGrammarWithSpelling,
                    checked: checkGrammarWithSpelling,
                    onSelected: toggleCheckGrammarWithSpelling,
                  ),
                  EnhancedPlatformMenuItem(
                    label: t.menu.edit.spellingAndGrammar.correctSpellingAutomatically,
                    checked: correctSpellingAutomatically,
                    onSelected: toggleCorrectSpellingAutomatically,
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: t.menu.edit.substitutions,
            menus: const [],
          ),
          PlatformMenu(
            label: t.menu.edit.transformations,
            menus: const [],
          ),
          PlatformMenu(
            label: t.menu.edit.speech,
            menus: const [],
          ),
          PlatformMenuItem(
            label: t.menu.edit.specialCharacters,
            onSelected: null,
          ),
        ],
      ),
    ],
  );
}
```

---

## 7. Replace `lib/app/menu/menu_chapter.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuChapter() {
  return EnhancedPlatformMenu.custom(
    label: t.menu.chapter.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.addChapter,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyN,
              meta: true,
              shift: true,
            ),
            onSelected: null,
          ),
          EnhancedPlatformMenu.custom(
            label: t.menu.chapter.addElement,
            menus: [
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.blurbs, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.halfTitle, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.titlePage, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.copyright, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.dedication, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.epigraph, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.element.tableOfContents,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.foreword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.introduction, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.preface, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.prologue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.epilogue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.afterword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.endnotes, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.bibliography, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.element.acknowledgments,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.element.aboutTheAuthor,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.chapter.element.alsoBy, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.element.fullPageImage,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.element.uncategorized,
                onSelected: null,
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.addMultipleElements,
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.createPartFromSelection,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.createVolumeFromSelection,
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.menu.chapter.convertTo,
            menus: [
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.chapter, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.blurbs, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.copyright, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.dedication, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.epigraph, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.foreword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.introduction, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.preface, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.prologue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.epilogue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.afterword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.bibliography, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.convert.acknowledgments,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.convert.aboutTheAuthor,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.chapter.convert.alsoBy, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.convert.uncategorized,
                onSelected: null,
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.numbered,
            checked: true,
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.menu.chapter.heading,
            menus: [
              EnhancedPlatformMenuItem(label: '1', onSelected: null),
              EnhancedPlatformMenuItem(label: '2', onSelected: null),
              EnhancedPlatformMenuItem(label: '3', onSelected: null),
            ],
          ),
          EnhancedPlatformMenu.custom(
            label: t.menu.chapter.includeIn,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.include.allEditions,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.include.ebooksOnly,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.include.printOnly,
                onSelected: null,
              ),
            ],
          ),
          EnhancedPlatformMenu.custom(
            label: t.menu.chapter.beginOn,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.begin.rightSideOfSpread,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.chapter.begin.eitherSideOfSpread,
                onSelected: null,
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.insertPageBreak,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.splitChapterAtCursor,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.mergeSelectedChapters,
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.goToPreviousChapter,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.bracketLeft,
              meta: true,
              shift: true,
            ),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.goToNextChapter,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.bracketRight,
              meta: true,
              shift: true,
            ),
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.numbering,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.chapter.terminology,
            onSelected: null,
          ),
        ],
      ),
    ],
  );
}
```

---

## 8. Replace `lib/app/menu/menu_text.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuText() {
  return EnhancedPlatformMenu.custom(
    label: t.menu.text.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.text.bold,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyB, meta: true),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.text.italic,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyI, meta: true),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.text.underline,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyU, meta: true),
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.text.smallCaps, onSelected: null),
          EnhancedPlatformMenuItem(label: t.menu.text.sansSerif, onSelected: null),
          EnhancedPlatformMenuItem(label: t.menu.text.monospace, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.text.superscript, onSelected: null),
          EnhancedPlatformMenuItem(label: t.menu.text.subscript, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.text.strikethrough, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.menu.text.addFeature,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.menu.text.feature.subhead,
                shortcut: const SingleActivator(LogicalKeyboardKey.keyD, meta: true),
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.text.feature.ornamentalBreak,
                shortcut: const SingleActivator(LogicalKeyboardKey.keyK, meta: true),
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.text.feature.image, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.text.feature.alignmentBlock,
                shortcut: const SingleActivator(LogicalKeyboardKey.keyT, meta: true),
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.text.feature.list, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.text.feature.blockQuotation,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.text.feature.verse, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.text.feature.textConversation,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.text.feature.writtenNote, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.text.feature.webLink, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.text.feature.storeLink, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.text.feature.internalLink, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.text.feature.endnote,
                shortcut: const SingleActivator(LogicalKeyboardKey.digit1, meta: true),
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.text.feature.footnote,
                shortcut: const SingleActivator(LogicalKeyboardKey.digit2, meta: true),
                onSelected: null,
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
```

---

## 9. Replace `lib/app/menu/menu_preview.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuPreview() {
  return EnhancedPlatformMenu.custom(
    label: t.menu.preview.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.menu.preview.device,
            menus: [
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.kindle, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.fire, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.paperwhite, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.preview.devices.appleBooks,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.ipad, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.iphone, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.nook, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.preview.devices.simpleTouch,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.kobo, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.clara, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.preview.devices.googlePlay,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(
                label: t.menu.preview.devices.androidTablet,
                onSelected: null,
              ),
              EnhancedPlatformMenuItem(label: t.menu.preview.devices.print, onSelected: null),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.preview.previousPage,
            shortcut: const SingleActivator(LogicalKeyboardKey.bracketLeft, meta: true),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.preview.nextPage,
            shortcut: const SingleActivator(LogicalKeyboardKey.bracketRight, meta: true),
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.preview.previousChapter, onSelected: null),
          EnhancedPlatformMenuItem(label: t.menu.preview.nextChapter, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.preview.showEditorContentInPreview,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyY, meta: true),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.preview.showPreviewContentInEditor,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyY,
              meta: true,
              shift: true,
            ),
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.preview.limitToPageSize,
            checked: true,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.preview.showBleedInProofMode,
            onSelected: null,
          ),
        ],
      ),
    ],
  );
}
```

---

## 10. Replace `lib/app/menu/menu_view.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuView() {
  return EnhancedPlatformMenu.custom(
    label: t.menu.view.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.view.showTabBar, onSelected: null),
          EnhancedPlatformMenuItem(
            label: t.menu.view.showAllTabs,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.backslash,
              meta: true,
              shift: true,
            ),
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.view.navigator,
            checked: true,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyT,
              meta: true,
              shift: true,
            ),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.view.preview,
            checked: true,
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.view.contents,
            checked: true,
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(label: t.menu.view.styles, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.view.invisibleCharacters, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.view.showToolbar,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyT,
              meta: true,
              alt: true,
            ),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(label: t.menu.view.customizeToolbar, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.view.enterFullScreen,
            onSelected: null,
          ),
        ],
      ),
    ],
  );
}
```

---

## 11. Replace `lib/app/menu/menu_windows.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuWindows() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.window,
    label: t.menu.window.label,
    removeDefaultItems: true,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.window.minimize,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyM, meta: true),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(label: t.menu.window.zoom, onSelected: null),
          EnhancedPlatformMenuItem(
            label: t.menu.window.fill,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyF,
              control: true,
              fn: true,
            ),
            onSelected: null,
          ),
          EnhancedPlatformMenuItem(
            label: t.menu.window.center,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyC,
              control: true,
              fn: true,
            ),
            onSelected: null,
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.menu.window.moveAndResize,
            menus: [
              EnhancedPlatformMenuItem(label: t.menu.window.halves, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.left, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.right, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.top, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.bottom, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.quarters, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.topLeft, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.topRight, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.bottomLeft, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.bottomRight, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.arrange, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.leftAndRight, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.rightAndLeft, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.topAndBottom, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.bottomAndTop, onSelected: null),
              EnhancedPlatformMenuItem(label: t.menu.window.quarters, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.menu.window.returnToPreviousSize,
                shortcut: const SingleActivator(
                  LogicalKeyboardKey.keyR,
                  control: true,
                  fn: true,
                ),
                onSelected: null,
              ),
            ],
          ),
          EnhancedPlatformMenuItem(label: t.menu.window.fullScreenTile, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.window.removeWindowFromSet, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.window.showPhotoLibrary, onSelected: () {}),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.window.showPreviousTab, onSelected: null),
          EnhancedPlatformMenuItem(label: t.menu.window.showNextTab, onSelected: null),
          EnhancedPlatformMenuItem(label: t.menu.window.moveTabToNewWindow, onSelected: null),
          EnhancedPlatformMenuItem(label: t.menu.window.mergeAllWindows, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.menu.window.bringAllToFront, onSelected: () {}),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.menu.window.wordCraft,
            checked: true,
            onSelected: () {},
          ),
        ],
      ),
    ],
  );
}
```

---

## 12. Replace `lib/app/menu/menu_help.dart`

```dart
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuHelp() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.help,
    label: t.menu.help.label,
    menus: [
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.menu.help.tutorial,
            onSelected: () {},
          ),
          PlatformMenuItem(
            label: t.menu.help.helpOverview,
            onSelected: () {},
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.menu.help.contactSupport,
            onSelected: () {},
          ),
        ],
      ),
    ],
  );
}
```

---

## 13. Run generation

From:

```bash
cd apps/publisher_app
```

run:

```bash
dart run slang
dart format lib/app/menu
flutter analyze
flutter run -d macos --flavor development -t lib/main_development.dart
```

If Slang does not pick up split files, check your `slang.yaml`. It should include namespaces and assets input:

```yaml
base_locale: en
fallback_strategy: base_locale
input_directory: assets/i18n
input_file_pattern: .i18n.json
output_directory: lib/core/i18n
output_file_name: translations.g.dart
locale_handling: true
flutter_integration: true
namespaces: true
translate_var: t
enum_name: AppLocale
class_name: Translations
key_case: camel
key_map_case: camel
param_case: camel
string_interpolation: braces
flat_map: false
format:
  enabled: true
  width: 100
```

One important fix: your files named `dialog.json` and `error.json` will **not** be picked up if your pattern is `.i18n.json`. Rename them:

```bash
mv assets/i18n/en/dialog.json assets/i18n/en/dialog.i18n.json
mv assets/i18n/en/error.json assets/i18n/en/error.i18n.json
mv assets/i18n/ar/dialog.json assets/i18n/ar/dialog.i18n.json
mv assets/i18n/ar/error.json assets/i18n/ar/error.i18n.json
```

That keeps the Slang namespace structure consistent.

[1]: https://pub.dev/packages/slang "slang | Dart package"
[2]: https://api.flutter.dev/flutter/widgets/PlatformMenuBar-class.html "PlatformMenuBar class - widgets library - Dart API"
