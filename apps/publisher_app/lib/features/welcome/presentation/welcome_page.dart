import 'package:auto_route/auto_route.dart';
import 'package:publisher_app_ui/publisher_app_ui.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('This is a Test')],
        ),
      ),
    );
  }
}
