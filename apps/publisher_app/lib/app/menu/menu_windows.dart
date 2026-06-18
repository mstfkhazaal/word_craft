import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuWindows(Translations translations) {
  final t = translations.menu.window;
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.window,
    label: t.label,
    menus: [
      PlatformMenuItemGroup(
        members: [
          if (PlatformProvidedMenuItem.hasMenu(
            PlatformProvidedMenuItemType.minimizeWindow,
          ))
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.minimizeWindow,
            ),
          if (PlatformProvidedMenuItem.hasMenu(
            PlatformProvidedMenuItemType.zoomWindow,
          ))
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.zoomWindow,
            ),
          if (PlatformProvidedMenuItem.hasMenu(
            PlatformProvidedMenuItemType.toggleFullScreen,
          ))
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.toggleFullScreen,
            ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.showPhotoLibrary,
            onSelected: () {},
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          if (PlatformProvidedMenuItem.hasMenu(
            PlatformProvidedMenuItemType.arrangeWindowsInFront,
          ))
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.arrangeWindowsInFront,
            ),
        ],
      ),
    ],
  );
}
