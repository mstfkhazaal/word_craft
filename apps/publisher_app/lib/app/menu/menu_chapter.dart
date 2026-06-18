import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuChapter(Translations translations) {
  final t = translations.menu.chapter;
  return EnhancedPlatformMenu.custom(
    label: t.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.addChapter,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyN,
              meta: true,
              shift: true,
            ),
            onSelected: (){},
          ),
          EnhancedPlatformMenu.custom(
            label: t.addElement,
            menus: [
              EnhancedPlatformMenuItem(label: t.element.blurbs, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.halfTitle, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.titlePage, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.copyright, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.dedication, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.epigraph, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.element.tableOfContents,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.element.foreword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.introduction, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.preface, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.prologue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.epilogue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.afterword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.endnotes, onSelected: null),
              EnhancedPlatformMenuItem(label: t.element.bibliography, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.element.acknowledgments,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.element.aboutTheAuthor,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.element.alsoBy, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.element.fullPageImage,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.element.uncategorized,
                onSelected: (){},
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.addMultipleElements,
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.createPartFromSelection,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.createVolumeFromSelection,
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.convertTo,
            menus: [
              EnhancedPlatformMenuItem(label: t.convert.chapter, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.blurbs, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.copyright, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.dedication, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.epigraph, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.foreword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.introduction, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.preface, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.prologue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.epilogue, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.afterword, onSelected: null),
              EnhancedPlatformMenuItem(label: t.convert.bibliography, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.convert.acknowledgments,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.convert.aboutTheAuthor,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.convert.alsoBy, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.convert.uncategorized,
                onSelected: (){},
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.numbered,
            checked: true,
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.heading,
            menus: [
              EnhancedPlatformMenuItem(label: '1', onSelected: null),
              EnhancedPlatformMenuItem(label: '2', onSelected: null),
              EnhancedPlatformMenuItem(label: '3', onSelected: null),
            ],
          ),
          EnhancedPlatformMenu.custom(
            label: t.includeIn,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.include.allEditions,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.include.ebooksOnly,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.include.printOnly,
                onSelected: (){},
              ),
            ],
          ),
          EnhancedPlatformMenu.custom(
            label: t.beginOn,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.begin.rightSideOfSpread,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.begin.eitherSideOfSpread,
                onSelected: (){},
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.insertPageBreak,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.splitChapterAtCursor,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.mergeSelectedChapters,
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.goToPreviousChapter,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.bracketLeft,
              meta: true,
              shift: true,
            ),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.goToNextChapter,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.bracketRight,
              meta: true,
              shift: true,
            ),
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.numbering,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.terminology,
            onSelected: (){},
          ),
        ],
      ),
    ],
  );
}
