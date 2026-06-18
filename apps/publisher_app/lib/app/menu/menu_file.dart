import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

EnhancedPlatformMenu menuFile() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.file,
    label: 'File',
    removeDefaultItems: true,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: 'New Book',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyN, meta: true),

            onSelected: () {},
          ),
          EnhancedPlatformMenuItem(label: 'New Book Set...', onSelected: () {}),
        ],
      ),

      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: 'Open…',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyO, meta: true),
          ),
          PlatformMenu(
            label: 'Open Recent',
            menus: [EnhancedPlatformMenuItem(label: 'Clear Recents')],
          ),
          EnhancedPlatformMenuItem(label: 'Import Word File', onSelected: () {}),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: 'Close',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyW, meta: true),
          ),
          EnhancedPlatformMenuItem(
            label: 'Save',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyS, meta: true),
          ),
          EnhancedPlatformMenuItem(
            label: 'Duplicate',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyS, shift: true, meta: true),
          ),
          EnhancedPlatformMenuItem(label: 'Rename'),
          EnhancedPlatformMenuItem(label: 'Move To'),
          PlatformMenu(
            label: 'Revert To',
            menus: [EnhancedPlatformMenuItem(label: 'No Document')],
          ),
        ],
      ),

      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: 'Share',
            menus: [EnhancedPlatformMenuItem(label: 'No Document')],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: 'Reimport Word File...'),
          PlatformMenu(
            label: 'Reuse Elements From',
            menus: [EnhancedPlatformMenuItem(label: 'Others..')],
          ),
          EnhancedPlatformMenuItem(label: 'Reuse Summary...'),
        ],
      ),
      
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: 'Generate Books...',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyB, shift: true, meta: true),

            onSelected: () {},
          ),
          PlatformMenu(
            label: 'Export Content As',
            menus: [
              EnhancedPlatformMenuItem(label: 'Word File...'),
              EnhancedPlatformMenuItem(label: 'Rich Text Format ...'),
            ],
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: 'Select Platforms...'),
          EnhancedPlatformMenuItem(
            label: 'Print Settings ...',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyP, shift: true, meta: true),
          ),
        ],
      ),
    ],
  );
}
