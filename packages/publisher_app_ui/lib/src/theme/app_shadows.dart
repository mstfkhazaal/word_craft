import 'package:publisher_app_ui/publisher_app_ui.dart';

abstract final class AppShadows {
  static const none = <BoxShadow>[];
  static const xs = <BoxShadow>[
    BoxShadow(blurRadius: 8, offset: Offset(0, 2), color: Color(0x0F000000)),
  ];
  static const sm = <BoxShadow>[
    BoxShadow(blurRadius: 16, offset: Offset(0, 8), color: Color(0x14000000)),
  ];
  static const md = <BoxShadow>[
    BoxShadow(blurRadius: 24, offset: Offset(0, 12), color: Color(0x1F000000)),
  ];
  static const lg = <BoxShadow>[
    BoxShadow(blurRadius: 32, offset: Offset(0, 16), color: Color(0x24000000)),
  ];
  static const xl = <BoxShadow>[
    BoxShadow(blurRadius: 48, offset: Offset(0, 24), color: Color(0x2E000000)),
  ];
}
