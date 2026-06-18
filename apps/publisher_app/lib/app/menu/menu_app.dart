import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuApp(Translations translations) {
  final t = translations.menu.app;
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.application,
    label: t.label,
    menus: [
      if (PlatformProvidedMenuItem.hasMenu(PlatformProvidedMenuItemType.about))
        const PlatformProvidedMenuItem(
          type: PlatformProvidedMenuItemType.about,
        ),
      PlatformMenuItem(
        label: t.checkForUpdates,
        onSelected: () {},
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.settings,
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
