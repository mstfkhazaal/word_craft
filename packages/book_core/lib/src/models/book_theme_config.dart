class BookThemeConfig {
  const BookThemeConfig({
    required this.pageSize,
    required this.fontFamily,
    required this.fontSize,
    required this.lineHeight,
    required this.pageMargin,
    required this.primaryColor,
    required this.textColor,
    required this.backgroundColor,
    required this.headingColor,
  });

  factory BookThemeConfig.fromJson(Map<String, dynamic> json) {
    return BookThemeConfig(
      pageSize: json['pageSize'] as String? ?? 'a4',
      fontFamily: json['fontFamily'] as String? ?? 'serif',
      fontSize: (json['fontSize'] as num? ?? 13).toDouble(),
      lineHeight: (json['lineHeight'] as num? ?? 1.55).toDouble(),
      pageMargin: (json['pageMargin'] as num? ?? 48).toDouble(),
      primaryColor: json['primaryColor'] as String? ?? '#1E293B',
      textColor: json['textColor'] as String? ?? '#111827',
      backgroundColor: json['backgroundColor'] as String? ?? '#FFFFFF',
      headingColor: json['headingColor'] as String? ?? '#0F172A',
    );
  }

  final String pageSize;
  final String fontFamily;
  final double fontSize;
  final double lineHeight;
  final double pageMargin;
  final String primaryColor;
  final String textColor;
  final String backgroundColor;
  final String headingColor;

  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'lineHeight': lineHeight,
      'pageMargin': pageMargin,
      'primaryColor': primaryColor,
      'textColor': textColor,
      'backgroundColor': backgroundColor,
      'headingColor': headingColor,
    };
  }

  BookThemeConfig copyWith({
    String? pageSize,
    String? fontFamily,
    double? fontSize,
    double? lineHeight,
    double? pageMargin,
    String? primaryColor,
    String? textColor,
    String? backgroundColor,
    String? headingColor,
  }) {
    return BookThemeConfig(
      pageSize: pageSize ?? this.pageSize,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      pageMargin: pageMargin ?? this.pageMargin,
      primaryColor: primaryColor ?? this.primaryColor,
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headingColor: headingColor ?? this.headingColor,
    );
  }
}
