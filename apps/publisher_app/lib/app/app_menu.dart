import 'package:publisher_app/app/menu/menu.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';
import 'package:publisher_app_ui/publisher_app_ui.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({
    required this.translations,
    required this.child,
    super.key,
  });

  final Translations translations;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final t = translations;

    return PlatformMenuBar(
      key: ValueKey(t.$meta.locale.languageCode),
      menus: [
        menuApp(t),
        menuFile(t),
        menuEdit(t),
        menuChapter(t),
        menuText(t),
        menuPreview(t),
        menuView(t),
        menuWindows(t),
        menuHelp(t),
      ],
      child: child,
    );
  }
}