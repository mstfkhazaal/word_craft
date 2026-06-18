import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuHelp(Translations translations) {
  final t = translations.menu.help;
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.help,
    label: t.label,
    menus: [
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.tutorial,
            onSelected: () {},
          ),
          PlatformMenuItem(
            label: t.helpOverview,
            onSelected: () {},
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.contactSupport,
            onSelected: () {},
          ),
        ],
      ),
    ],
  );
}
