import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

EnhancedPlatformMenu menuText(Translations translations) {
  final t = translations.menu.text;
  return EnhancedPlatformMenu.custom(
    label: t.label,
    menus: [
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(
            label: t.bold,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyB, meta: true),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.italic,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyI, meta: true),
            onSelected: (){},
          ),
          EnhancedPlatformMenuItem(
            label: t.underline,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyU, meta: true),
            onSelected: (){},
          ),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.smallCaps, onSelected: null),
          EnhancedPlatformMenuItem(label: t.sansSerif, onSelected: null),
          EnhancedPlatformMenuItem(label: t.monospace, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.superscript, onSelected: null),
          EnhancedPlatformMenuItem(label: t.subscript, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenuItem(label: t.strikethrough, onSelected: null),
        ],
      ),
      EnhancedPlatformMenuItemGroup(
        members: [
          EnhancedPlatformMenu.custom(
            label: t.addFeature,
            menus: [
              EnhancedPlatformMenuItem(
                label: t.feature.subhead,
                shortcut: const SingleActivator(LogicalKeyboardKey.keyD, meta: true),
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.feature.ornamentalBreak,
                shortcut: const SingleActivator(LogicalKeyboardKey.keyK, meta: true),
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.feature.image, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.feature.alignmentBlock,
                shortcut: const SingleActivator(LogicalKeyboardKey.keyT, meta: true),
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.feature.list, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.feature.blockQuotation,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.feature.verse, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.feature.textConversation,
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(label: t.feature.writtenNote, onSelected: null),
              EnhancedPlatformMenuItem(label: t.feature.webLink, onSelected: null),
              EnhancedPlatformMenuItem(label: t.feature.storeLink, onSelected: null),
              EnhancedPlatformMenuItem(label: t.feature.internalLink, onSelected: null),
              EnhancedPlatformMenuItem(
                label: t.feature.endnote,
                shortcut: const SingleActivator(LogicalKeyboardKey.digit1, meta: true),
                onSelected: (){},
              ),
              EnhancedPlatformMenuItem(
                label: t.feature.footnote,
                shortcut: const SingleActivator(LogicalKeyboardKey.digit2, meta: true),
                onSelected: (){},
              ),
            ],
          ),
        ],
      ),
    ],
  );
}