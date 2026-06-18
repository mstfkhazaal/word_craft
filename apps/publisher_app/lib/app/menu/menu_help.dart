import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';

EnhancedPlatformMenu menuHelp() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.help,
    label: 'Help',
    menus: [
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(label: 'Tutorial'),
          PlatformMenuItem(label: 'Help Overview'),
        ],
      ),
      PlatformMenuItemGroup(members: [PlatformMenuItem(label: 'Contact Support')]),
    ],
  );
}
