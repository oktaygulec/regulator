import 'package:flutter/material.dart';

import '/theme/color/color_schemes.dart';

class TextThemes {
  static TextThemes? _instance;
  static TextThemes get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = TextThemes.init();
      return _instance!;
    }
  }

  TextThemes.init();

  ColorSchemes get _colorScheme => ColorSchemes.instance;

  TextStyle get _fontStyle => const TextStyle(fontFamily: "Inter");

  TextTheme get textTheme => TextTheme(
        headline1: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 84,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: -1.5,
        ),
        headline2: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 58,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: -0.5,
        ),
        headline3: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 47,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0,
        ),
        headline4: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 36,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.25,
        ),
        headline5: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 23,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 0,
        ),
        headline6: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 19,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          overflow: TextOverflow.clip,
          letterSpacing: 0.15,
        ),
        subtitle1: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.15,
        ),
        subtitle2: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
        bodyText1: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
        ),
        bodyText2: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.25,
        ),
        button: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.25,
        ),
        caption: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.4,
        ),
        overline: _fontStyle.copyWith(
          color: _colorScheme.black,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.5,
        ),
      );
}
