import 'dart:ui';
import 'package:publisher_app_ui/publisher_app_ui.dart';

class AppRadius extends ThemeExtension<AppRadius> {
  const AppRadius({
    this.none = 0,
    this.xs = 4,
    this.sm = 8,
    this.md = 12,
    this.lg = 16,
    this.xl = 24,
    this.xxl = 32,
    this.full = 999,
  });

  final double none;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double full;
  BorderRadius get noneBorder => BorderRadius.circular(none);
  BorderRadius get xsBorder => BorderRadius.circular(xs);
  BorderRadius get smBorder => BorderRadius.circular(sm);
  BorderRadius get mdBorder => BorderRadius.circular(md);
  BorderRadius get lgBorder => BorderRadius.circular(lg);
  BorderRadius get xlBorder => BorderRadius.circular(xl);
  BorderRadius get xxlBorder => BorderRadius.circular(xxl);
  BorderRadius get fullBorder => BorderRadius.circular(full);

  @override
  AppRadius copyWith({
    double? none,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? full,
  }) {
    return AppRadius(
      none: none ?? this.none,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      full: full ?? this.full,
    );
  }

  @override
  AppRadius lerp(AppRadius? other, double t) {
    if (other is! AppRadius) return this;
    return AppRadius(
      none: lerpDouble(none, other.none, t)!,
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      xxl: lerpDouble(xxl, other.xxl, t)!,
      full: lerpDouble(full, other.full, t)!,
    );
  }
}
