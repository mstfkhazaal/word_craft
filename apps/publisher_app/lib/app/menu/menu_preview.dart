import 'package:enhanced_platform_menu/enhanced_platform_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

EnhancedPlatformMenu menuPreview() {
  return EnhancedPlatformMenu.standard(
    identifier: StandardMenuIdentifier.format,
    label: 'Preview',
    menus: [

    ],
  );
}
