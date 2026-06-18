import 'package:publisher_app/app/app.dart';
import 'package:publisher_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
