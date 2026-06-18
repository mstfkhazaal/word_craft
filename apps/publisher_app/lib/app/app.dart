import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:publisher_app/app/menu/menu.dart';
import 'package:publisher_app/core/di/injection.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';
import 'package:publisher_app/core/router/app_router.dart';
import 'package:publisher_app/features/startup/application/application_start/application_start_cubit.dart';
import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:sizer/sizer.dart';

class AppStart extends StatelessWidget {
  AppStart({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return BlocBuilder<ApplicationStartCubit, ApplicationStartState>(
          builder: (context, state) {
            final locale = TranslationProvider.of(context).flutterLocale;

            return PlatformMenuBar(
              menus: [
                menuApp(),
                menuFile(),

                menuEdit(),
                menuChapter(),
                menuText(),
                menuPreview(),

                menuView(),
                menuWindows(),
                menuHelp(),],
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: state.themeMode,
                locale: locale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                localizationsDelegates: const [
                  ...GlobalMaterialLocalizations.delegates,
                  LocaleNamesLocalizationsDelegate(),
                ],
                builder: (context, child) {
                  final appChild = child ?? const SizedBox.shrink();

                  final responsiveChild = ResponsiveBreakpoints.builder(
                    child: appChild,
                    breakpoints: const [
                      Breakpoint(
                        start: AppBreakpoints.mobileMin,
                        end: AppBreakpoints.tabletMin - 1,
                        name: MOBILE,
                      ),
                      Breakpoint(
                        start: AppBreakpoints.tabletMin,
                        end: AppBreakpoints.desktopMin - 1,
                        name: TABLET,
                      ),
                      Breakpoint(
                        start: AppBreakpoints.desktopMin,
                        end: AppBreakpoints.wideMin - 1,
                        name: DESKTOP,
                      ),
                      Breakpoint(
                        start: AppBreakpoints.wideMin,
                        end: double.infinity,
                        name: 'wideDesktop',
                      ),
                    ],
                  );

                  if (state.isLoadingLanguage) {
                    return Scaffold(
                      body: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 280),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.t.language.wait,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 16),
                              const LinearProgressIndicator(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return responsiveChild;
                },
                routerConfig: _appRouter.config(),
              ),
            );
          },
        );
      },
    );
  }
}
