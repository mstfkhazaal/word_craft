import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:publisher_app/core/i18n/translations.g.dart';

part 'application_start_cubit.freezed.dart';
part 'application_start_state.dart';

ThemeMode themeModeFromIndex(int? index) {
  if (index == null || index < 0 || index >= ThemeMode.values.length) {
    return ThemeMode.system;
  }

  return ThemeMode.values[index];
}

AppLocale? appLocaleFromLanguageCode(String? languageCode) {
  if (languageCode == null || languageCode.trim().isEmpty) {
    return null;
  }

  for (final locale in AppLocale.values) {
    if (locale.languageCode == languageCode) {
      return locale;
    }
  }

  return null;
}

@singleton
class ApplicationStartCubit extends HydratedCubit<ApplicationStartState> {
  ApplicationStartCubit() : super(const ApplicationStartState());


  Future<void> setLocale(AppLocale locale) async {
    if (state.locale == locale.languageCode &&
        LocaleSettings.currentLocale == locale) {
      return;
    }

    emit(state.copyWith(isLoadingLanguage: true));

    try {
      await LocaleSettings.setLocale(locale);

      emit(
        state.copyWith(
          locale: locale.languageCode,
          isLoadingLanguage: false,
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          isLoadingLanguage: false,
          startupError: error.toString(),
        ),
      );
    }
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void setThemeModeIndex(int index) {
    emit(
      state.copyWith(
        themeMode: themeModeFromIndex(index),
      ),
    );
  }

  @override
  ApplicationStartState? fromJson(Map<String, dynamic> json) {
    final rawThemeModeIndex =
        (json['themeMode'] as int?) ?? (json['themeModeIndex'] as int?);

    return ApplicationStartState(
      isFirstTime: json['isFirstTime'] as bool? ?? false,
      themeMode: themeModeFromIndex(rawThemeModeIndex),
      locale: json['locale'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson(ApplicationStartState state) {
    return {
      'isFirstTime': state.isFirstTime,
      'themeMode': state.themeMode.index,
      'locale': state.locale,
    };
  }
}
