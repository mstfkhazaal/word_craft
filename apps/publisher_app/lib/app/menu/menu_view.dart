import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuView(Translations translations) {
  final t = translations.menu.view;
  return EnhancedPlatformMenu.custom(
    label: t.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.navigator,
            checked: true,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyT,
              meta: true,
              shift: true,
            ),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.preview,
            checked: true,
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.contents,
            checked: true,
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.styles,
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.invisibleCharacters,
            onSelected: (){},
          ),
        ],
      ),
    ],
  );
}
