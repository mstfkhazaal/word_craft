import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

bool spellingWhileTyping = true;
bool checkGrammarWithSpelling = true;
bool correctSpellingAutomatically = true;

void toggleSpellingWhileTyping() {
  spellingWhileTyping = !spellingWhileTyping;
}

void toggleCheckGrammarWithSpelling() {
  checkGrammarWithSpelling = !checkGrammarWithSpelling;
}

void toggleCorrectSpellingAutomatically() {
  correctSpellingAutomatically = !correctSpellingAutomatically;
}

EnhancedPlatformMenu menuEdit(Translations translations) {
  final t = translations.menu.edit;
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.edit,
    label: t.label,
    menus: [
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.undo,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyZ, meta: true),
            onSelected: (){},
          ),
          PlatformMenuItem(
            label: t.redo,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyZ,
              meta: true,
              shift: true,
            ),
            onSelected: (){},
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenuItem(
            label: t.cut,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyX, meta: true),
            onSelected: (){},
          ),
          PlatformMenuItem(
            label: t.copy,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyC, meta: true),
            onSelected: (){},
          ),
          PlatformMenuItem(
            label: t.paste,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyV, meta: true),
            onSelected: (){},
          ),
          PlatformMenuItem(
            label: t.pasteAndMatchStyle,
            shortcut: const SingleActivator(
              LogicalKeyboardKey.keyV,
              alt: true,
              shift: true,
              meta: true,
            ),
            onSelected: (){},
          ),
          PlatformMenuItem(
            label: t.delete,
            shortcut: const SingleActivator(LogicalKeyboardKey.backspace),
            onSelected: (){},
          ),
          PlatformMenuItem(
            label: t.selectAll,
            shortcut: const SingleActivator(LogicalKeyboardKey.keyA, meta: true),
            onSelected: (){},
          ),
        ],
      ),
      PlatformMenuItemGroup(
        members: [
          PlatformMenu(
            label: t.find.label,
            menus: [
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.find.find,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyF,
                      meta: true,
                    ),
                    onSelected: (){},
                  ),
                  PlatformMenuItem(
                    label: t.find.findAndReplace,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyF,
                      control: true,
                      meta: true,
                    ),
                    onSelected: (){},
                  ),
                  PlatformMenuItem(
                    label: t.find.findSpecial,
                    onSelected: (){},
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.find.findNext,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyG,
                      meta: true,
                    ),
                    onSelected: (){},
                  ),
                  PlatformMenuItem(
                    label: t.find.findPrevious,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyG,
                      meta: true,
                      shift: true,
                    ),
                    onSelected: (){},
                  ),
                ],
              ),
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.find.useSelectionForFind,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyE,
                      meta: true,
                    ),
                    onSelected: (){},
                  ),
                  PlatformMenuItem(
                    label: t.find.jumpToSelection,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.keyJ,
                      meta: true,
                    ),
                    onSelected: (){},
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: t.spellingAndGrammar.label,
            menus: [
              PlatformMenuItemGroup(
                members: [
                  PlatformMenuItem(
                    label: t.spellingAndGrammar.show,
                    onSelected: (){},
                  ),
                  PlatformMenuItem(
                    label: t.spellingAndGrammar.checkDocumentNow,
                    shortcut: const SingleActivator(
                      LogicalKeyboardKey.semicolon,
                      meta: true,
                    ),
                    onSelected: (){},
                  ),
                ],
              ),
              EnhancedPlatformMenuItemGroup(
                members: [
                  EnhancedPlatformMenuItem(
                    label: t.spellingAndGrammar.checkSpellingWhileTyping,
                    checked: spellingWhileTyping,
                    onSelected: toggleSpellingWhileTyping,
                  ),
                  EnhancedPlatformMenuItem(
                    label: t.spellingAndGrammar.checkGrammarWithSpelling,
                    checked: checkGrammarWithSpelling,
                    onSelected: toggleCheckGrammarWithSpelling,
                  ),
                  EnhancedPlatformMenuItem(
                    label: t.spellingAndGrammar.correctSpellingAutomatically,
                    checked: correctSpellingAutomatically,
                    onSelected: toggleCorrectSpellingAutomatically,
                  ),
                ],
              ),
            ],
          ),
          PlatformMenu(
            label: t.substitutions,
            menus: const [],
          ),
          PlatformMenu(
            label: t.transformations,
            menus: const [],
          ),
          PlatformMenu(
            label: t.speech,
            menus: const [],
          ),
          PlatformMenuItem(
            label: t.specialCharacters,
            onSelected: (){},
          ),
        ],
      ),
    ],
  );
}
