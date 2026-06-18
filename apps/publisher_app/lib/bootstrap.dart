import 'dart:async';
import 'dart:developer';

import 'package:enhanced_platform_menu/enhanced_platform_menu_delegate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:publisher_app/core/di/injection.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';
import 'package:publisher_app/core/utils/bloc_observer.dart';
import 'package:publisher_app/features/startup/application/application_start/application_start_cubit.dart';
import 'package:window_manager/window_manager.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WidgetsBinding.instance.platformMenuDelegate = EnhancedPlatformMenuDelegate();

  const windowOptions =  WindowOptions(
    size: Size(700, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
      (await getApplicationSupportDirectory()).path,
    ),
  );


  configureDependencies();

  Bloc.observer = const AppBlocObserver();

  final applicationStartCubit = getIt<ApplicationStartCubit>();

  final currentLocale =
      applicationStartCubit.state.locale ??
          LocaleSettings.useDeviceLocaleSync().languageCode;

  await LocaleSettings.setLocaleRaw(currentLocale);
  await LocaleSettings.setLocaleRaw(currentLocale);

  runApp(
    TranslationProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: applicationStartCubit),
        ],
        child: await builder(),
      ),
    ),
  );


}
