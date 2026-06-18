import 'package:injectable/injectable.dart';
import 'package:publisher_app/core/router/app_router.dart';

@module
abstract class AppModule {
  /// Router
  @singleton
  AppRouter get appRouter => AppRouter();
}
