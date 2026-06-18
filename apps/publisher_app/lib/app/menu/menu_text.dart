import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';

PlatformMenu menuText() {
  return PlatformMenu(
    label: 'text',
    menus: [
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: 'Bold',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyB, meta: true),
          ),
          PlatformMenuItem(
            label: 'Italic',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyI, meta: true),
          ),

          PlatformMenuItem(
            label: 'Underline',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyU, meta: true),
          ),
        ],
      ),

      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(label: 'Small Caps'),
          PlatformMenuItem(label: 'Sans Serif'),
          PlatformMenuItem(label: 'Monospace'),
        ],
      ),

      EnhancedPlatformMenuItemGroup(
        members: [
          PlatformMenuItem(label: 'Superscript'),
          PlatformMenuItem(label: 'Subscript'),
        ],
      ),
      EnhancedPlatformMenuItemGroup(members: [PlatformMenuItem(label: 'Strikethrough')]),
      EnhancedPlatformMenuItemGroup(members: [PlatformMenuItem(label: 'Strikethrough')]),

    ],
  );
}
