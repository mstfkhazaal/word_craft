import 'package:publisher_app_ui/publisher_app_ui.dart';

abstract final class AppBreakpoints {
  static const mobileMin = 0.0;
  static const tabletMin = 768.0;
  static const desktopMin = 1200.0;
  static const wideMin = 1440.0;

  static const mobile = 'MOBILE';
  static const tablet = 'TABLET';
  static const desktop = 'DESKTOP';
  static const wide = 'WIDE';

  static const values = <Breakpoint>[
    Breakpoint(start: mobileMin, end: tabletMin - 1, name: mobile),
    Breakpoint(start: tabletMin, end: desktopMin - 1, name: tablet),
    Breakpoint(start: desktopMin, end: wideMin - 1, name: desktop),
    Breakpoint(start: wideMin, end: double.infinity, name: wide),
  ];

  static AppDeviceType deviceTypeForWidth(double width) {
    if (width >= wideMin) return AppDeviceType.wide;
    if (width >= desktopMin) return AppDeviceType.desktop;
    if (width >= tabletMin) return AppDeviceType.tablet;
    return AppDeviceType.mobile;
  }
}
