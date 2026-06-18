import 'package:auto_route/auto_route.dart';
import 'package:publisher_app/features/editor/presentation/editor_page.dart';
import 'package:publisher_app/features/startup/presentation/pages/startup_page.dart';
import 'package:publisher_app/features/welcome/presentation/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: WelcomeRoute.page,
        path: '/',
        initial: true,
      ),
      AutoRoute(
        page: EditorRoute.page,
        path: '/editor',
      ),
    ];
  }
}
