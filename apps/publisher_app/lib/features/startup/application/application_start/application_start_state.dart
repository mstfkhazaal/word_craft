part of 'application_start_cubit.dart';

enum ApplicationStartupStatus {
  initial,
  loading,
  ready,
  failure,
}

@freezed
abstract class ApplicationStartState with _$ApplicationStartState {
  const factory ApplicationStartState({
    @Default(false) bool isLoadingLanguage,
    @Default(false) bool isFirstTime,
    @Default(false) bool isSetupComplete,
    @Default(ThemeMode.system) ThemeMode themeMode,
    String? locale,
    @Default(ApplicationStartupStatus.initial)
    ApplicationStartupStatus startupStatus,
    String? startupError,
  }) = _ApplicationStartState;
}
