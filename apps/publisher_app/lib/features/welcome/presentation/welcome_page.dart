import 'package:auto_route/auto_route.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';
import 'package:publisher_app_ui/publisher_app_ui.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(t.app.name),
            Text(t.app.version(version: 2)),
            Text(t.app.copyright),
          ],
        ),
      ),
    );
  }
}
