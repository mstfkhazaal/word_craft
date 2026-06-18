import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

bool spellingWhileTyping = true;
bool checkGrammarWithSpelling = true;
bool correctSpellingAutomatically = true;

void toggleSpellingWhileTyping() => spellingWhileTyping = !spellingWhileTyping;

void toggleCheckGrammarWithSpelling() => checkGrammarWithSpelling = !checkGrammarWithSpelling;

void toggleCorrectSpellingAutomatically() =>
    correctSpellingAutomatically = !correctSpellingAutomatically;

EnhancedPlatformMenu menuEdit() {
  return EnhancedPlatformMenu.standard(
    label: t.menu.edit.label,
    identifier: StandardMenuIdentifier.edit,
    menus: [
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: 'Undo',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyZ, meta: true),
          ),
          PlatformMenuItem(
            label: 'Redo',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyZ, meta: true, shift: true),
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: 'Cut',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyX, meta: true),
          ),
          PlatformMenuItem(
            label: 'Copy',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyC, meta: true),
          ),
          PlatformMenuItem(
            label: 'Paste',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyV, meta: true),
          ),

          PlatformMenuItem(
            label: 'Paste and Match Style',
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyV,
              alt: true,
              shift: true,
              meta: true,
            ),
          ),
          PlatformMenuItem(
            label: 'Delete',
            shortcut: const SingleActivator(LogicalKeyboardKey.backspace, meta: true),
          ),
          PlatformMenuItem(
            label: 'Select All',
            shortcut: const SingleActivator(LogicalKeyboardKey.keyA, meta: true),
          ),
        ],
      ),

      PlatformMenuItemGroup(
        members: [
          PlatformMenu(
            label: 'Find',
            menus: [
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: 'Find...',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyF, meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Find and Replace',
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyF,
                      control: true,
                      meta: true,
                    ),
                  ),
                  PlatformMenuItem(label: 'Find Special...'),
                ],
              ),
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: 'Find Next',

                    shortcut: const SingleActivator(LogicalKeyboardKey.keyG, meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Find Previous',
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyG,
                      meta: true,
                      shift: true,
                    ),
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: 'Use Selection For Find',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyE, meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Jum to Selection',
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyJ, meta: true),
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: 'Spelling and Grammar',
            menus: [
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: 'Show Spelling and Grammar',
                    shortcut: const SingleActivator(LogicalKeyboardKey.compose, meta: true),
                  ),
                  PlatformMenuItem(
                    label: 'Check Document Now',
                    shortcut: const SingleActivator(LogicalKeyboardKey.comma, meta: true),
                  ),
                ],
              ),
              EnhancedPlatformMenuItemGroup(
                members: [
                  EnhancedPlatformMenuItem(
                    label: 'Check Spelling While Typing',
                    checked: spellingWhileTyping,
                    onSelected: toggleSpellingWhileTyping,
                  ),
                  EnhancedPlatformMenuItem(
                    label: 'Check Grammar With Spelling',
                    checked: checkGrammarWithSpelling,
                    onSelected: toggleCheckGrammarWithSpelling,
                  ),
                  EnhancedPlatformMenuItem(
                    label: 'Correct Spelling Automatically',
                    checked: correctSpellingAutomatically,
                    onSelected: toggleCorrectSpellingAutomatically,
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(label: 'Substitutions', menus: []),
          PlatformMenu(label: 'Transformations', menus: []),
          PlatformMenu(label: 'Speech', menus: []),
          PlatformMenu(label: 'Special Characters', menus: []),
        ],
      ),
    ],
  );
}
