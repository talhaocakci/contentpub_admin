// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color primaryBtnText;
  late Color lineColor;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF96C3E2);
  late Color secondaryColor = const Color(0xFF929B9A);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryBackground = Color.fromARGB(255, 230, 236, 237);
  late Color secondaryBackground = Color.fromARGB(255, 237, 241, 241);
  late Color primaryText = Color.fromARGB(255, 33, 32, 32);
  late Color secondaryText = const Color(0xFFC7C7C7);

  late Color primaryBtnText = Color(0xFF6E6E6E);
  late Color lineColor = Color(0xFF9E9E9E);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Brazila';
  TextStyle get title1 => TextStyle(
        fontFamily: 'Brazila',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title2Family => 'Brazila';
  TextStyle get title2 => TextStyle(
        fontFamily: 'Brazila',
        color: theme.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      );
  String get title3Family => 'Brazila';
  TextStyle get title3 => TextStyle(
        fontFamily: 'Brazila',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  String get subtitle1Family => 'Brazila';
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'Brazila',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  String get subtitle2Family => 'Brazila';
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'Brazila',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  String get bodyText1Family => 'Brazila';
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'Brazila',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Brazila';
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'Brazila',
        color: theme.secondaryText,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
