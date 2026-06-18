import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuPreview(Translations translations) {
  final t = translations.menu.preview;
  return EnhancedPlatformMenu.custom(
    label: t.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.device,
            menus: [
              EnhancedPlatformMenuItem(label: t.devices.kindle, onSelected: (){},),
              EnhancedPlatformMenuItem(label: t.devices.fire, onSelected: (){},),
              EnhancedPlatformMenuItem(label: t.devices.paperwhite, onSelected: (){},),
              EnhancedPlatformMenuItem(
                label: t.devices.appleBooks,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.devices.ipad, onSelected: (){},),
              EnhancedPlatformMenuItem(label: t.devices.iphone, onSelected: (){},),
              EnhancedPlatformMenuItem(label: t.devices.nook, onSelected: (){},),
              EnhancedPlatformMenuItem(
                label: t.devices.simpleTouch,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.devices.kobo, onSelected: (){},),
              EnhancedPlatformMenuItem(label: t.devices.clara, onSelected: (){},),
              EnhancedPlatformMenuItem(
                label: t.devices.googlePlay,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.devices.androidTablet,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.devices.print, onSelected: (){},),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.previousPage,
            shortcut: const SingleActivator(LogicalKeyboardKey.bracketLeft, meta: true),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.nextPage,
            shortcut: const SingleActivator(LogicalKeyboardKey.bracketRight, meta: true),
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.previousChapter, onSelected: (){},),
          EnhancedPlatformMenuItem(label: t.nextChapter, onSelected: (){},),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.showEditorContentInPreview,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyY, meta: true),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.showPreviewContentInEditor,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyY,
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
            label: t.limitToPageSize,
            checked: true,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.showBleedInProofMode,
            onSelected: (){},
          ),
        ],
      ),
    ],
  );
}
