import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuFile(Translations translations) {
  final t = translations.menu.file;
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.file,
    label: t.label,
    removeDefaultItems: true,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.newBook,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyN, meta: true),
            onSelected: () {},
          ),
          EnhancedPlatformMenuItem(
            label: t.newBookSet,
            onSelected: () {},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.open,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyO, meta: true),
            onSelected: () {},
          ),
          EnhancedPlatformMenu.custom(
            label: t.openRecent,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.clearRecents,
                onSelected: () {},
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.importWordFile,
            onSelected: () {},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.close,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyW, meta: true),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.save,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyS, meta: true),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.duplicate,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyS,
              shift: true,
              meta: true,
            ),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.rename,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.moveTo,
            onSelected: (){},
          ),
          EnhancedPlatformMenu.custom(
            label: t.revertTo,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.noDocument,
                onSelected: (){},
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.share,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.noDocument,
                onSelected: (){},
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.reimportWordFile,
            onSelected: (){},
          ),
          EnhancedPlatformMenu.custom(
            label: t.reuseElementsFrom,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.others,
                onSelected: (){},
              ),
            ],
          ),
          EnhancedPlatformMenuItem(
            label: t.reuseSummary,
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.generateBooks,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyB,
              shift: true,
              meta: true,
            ),
            onSelected: () {},
          ),
          EnhancedPlatformMenu.custom(
            label: t.exportContentAs,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.exportWordFile,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.exportRichTextFormat,
                onSelected: (){},
              ),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.selectPlatforms,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.printSettings,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyP,
              shift: true,
              meta: true,
            ),
            onSelected:  (){},
          ),
        ],
      ),
    ],
  );
}
