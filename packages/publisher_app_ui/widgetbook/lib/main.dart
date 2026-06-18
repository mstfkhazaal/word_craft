import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_catalog/core/i18n/translations.g.dart';
import 'package:widgetbook_catalog/widgetbook/widgetbook.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TranslationProvider(child: const WidgetbookApp()));
}
