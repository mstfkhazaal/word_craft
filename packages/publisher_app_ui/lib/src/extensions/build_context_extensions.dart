import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Extension on [BuildContext] for easy access to custom theme tokens.
extension AppThemeBuildContext on BuildContext {
  /// Returns the [AppColors] from the current theme.
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;

  /// Returns the [AppSpacing] from the current theme.
  AppSpacing get appSpacing => Theme.of(this).extension<AppSpacing>()!;

  /// Returns the [AppRadius] from the current theme.
  AppRadius get appRadius => Theme.of(this).extension<AppRadius>()!;

  /// Returns the [AppSize] from the current theme.
  AppSize get appSize => Theme.of(this).extension<AppSize>()!;

  /// Returns typography based on the current text direction.
  ///
  /// LTR uses Inter. RTL uses IBM Plex Sans Arabic.
  AppTypography get appTypography {
    return AppTypography.resolve(Directionality.of(this));
  }
}
