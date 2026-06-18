import 'dart:ui';

import 'package:publisher_app_ui/publisher_app_ui.dart';

/// {@template app_size}
/// Size tokens for icons, controls, touch targets, avatars, and layout elements.
/// {@endtemplate}
class AppSize extends ThemeExtension<AppSize> {
  /// {@macro app_size}
  const AppSize({
    this.iconXs = 16,
    this.iconSm = 20,
    this.iconMd = 24,
    this.iconLg = 32,
    this.iconXl = 40,
    this.controlSm = 32,
    this.controlMd = 40,
    this.controlLg = 48,
    this.touchTarget = 48,
    this.avatarSm = 32,
    this.avatarMd = 40,
    this.avatarLg = 56,
    this.logoSm = 32,
    this.logoMd = 56,
    this.logoLg = 96,
  });

  final double iconXs;
  final double iconSm;
  final double iconMd;
  final double iconLg;
  final double iconXl;

  final double controlSm;
  final double controlMd;
  final double controlLg;

  final double touchTarget;

  final double avatarSm;
  final double avatarMd;
  final double avatarLg;

  final double logoSm;
  final double logoMd;
  final double logoLg;

  @override
  AppSize copyWith({
    double? iconXs,
    double? iconSm,
    double? iconMd,
    double? iconLg,
    double? iconXl,
    double? controlSm,
    double? controlMd,
    double? controlLg,
    double? touchTarget,
    double? avatarSm,
    double? avatarMd,
    double? avatarLg,
    double? logoSm,
    double? logoMd,
    double? logoLg,
  }) {
    return AppSize(
      iconXs: iconXs ?? this.iconXs,
      iconSm: iconSm ?? this.iconSm,
      iconMd: iconMd ?? this.iconMd,
      iconLg: iconLg ?? this.iconLg,
      iconXl: iconXl ?? this.iconXl,
      controlSm: controlSm ?? this.controlSm,
      controlMd: controlMd ?? this.controlMd,
      controlLg: controlLg ?? this.controlLg,
      touchTarget: touchTarget ?? this.touchTarget,
      avatarSm: avatarSm ?? this.avatarSm,
      avatarMd: avatarMd ?? this.avatarMd,
      avatarLg: avatarLg ?? this.avatarLg,
      logoSm: logoSm ?? this.logoSm,
      logoMd: logoMd ?? this.logoMd,
      logoLg: logoLg ?? this.logoLg,
    );
  }

  @override
  AppSize lerp(AppSize? other, double t) {
    if (other is! AppSize) return this;

    return AppSize(
      iconXs: lerpDouble(iconXs, other.iconXs, t)!,
      iconSm: lerpDouble(iconSm, other.iconSm, t)!,
      iconMd: lerpDouble(iconMd, other.iconMd, t)!,
      iconLg: lerpDouble(iconLg, other.iconLg, t)!,
      iconXl: lerpDouble(iconXl, other.iconXl, t)!,
      controlSm: lerpDouble(controlSm, other.controlSm, t)!,
      controlMd: lerpDouble(controlMd, other.controlMd, t)!,
      controlLg: lerpDouble(controlLg, other.controlLg, t)!,
      touchTarget: lerpDouble(touchTarget, other.touchTarget, t)!,
      avatarSm: lerpDouble(avatarSm, other.avatarSm, t)!,
      avatarMd: lerpDouble(avatarMd, other.avatarMd, t)!,
      avatarLg: lerpDouble(avatarLg, other.avatarLg, t)!,
      logoSm: lerpDouble(logoSm, other.logoSm, t)!,
      logoMd: lerpDouble(logoMd, other.logoMd, t)!,
      logoLg: lerpDouble(logoLg, other.logoLg, t)!,
    );
  }
}
