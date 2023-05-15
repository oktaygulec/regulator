import 'package:flutter/material.dart';

import '/theme/color/color_schemes.dart';
import '/theme/text/text_themes.dart';
import '/theme/extension/style_extension.dart';

class AppTheme {
  ColorSchemes get _colorSchemes => ColorSchemes.instance;
  TextThemes get _textThemes => TextThemes.instance;

  static AppTheme? _instance;
  static AppTheme get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppTheme.init();
      return _instance!;
    }
  }

  AppTheme.init();

  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: _colorSchemes.lightGray,
        primaryColor: _colorSchemes.primary,
        textTheme: _textThemes.textTheme,
        appBarTheme: _appBarTheme,
        tabBarTheme: _tabBarTheme,
        dialogTheme: _dialogTheme,
        bottomNavigationBarTheme: _bottomNavBarTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        textButtonTheme: _textButtonTheme,
        floatingActionButtonTheme: _floatingActionButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        textSelectionTheme: _textSelectionTheme,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: _colorSchemes.white,
        foregroundColor: _colorSchemes.black,
        titleTextStyle: _textThemes.textTheme.headline6,
      );

  TabBarTheme get _tabBarTheme => TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 4,
            color: _colorSchemes.primary,
          ),
          insets: const EdgeInsets.only(left: 8, right: 8, bottom: 0),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 24),
        unselectedLabelStyle: _textThemes.textTheme.subtitle2,
        labelStyle: _textThemes.textTheme.subtitle2,
        unselectedLabelColor: _colorSchemes.darkGray,
        labelColor: _colorSchemes.black,
        overlayColor: MaterialStateProperty.all(
          _colorSchemes.primary.withOpacity(0.1),
        ),
      );

  DialogTheme get _dialogTheme => DialogTheme(
        backgroundColor: _colorSchemes.white,
        titleTextStyle: _textThemes.textTheme.headline5,
        contentTextStyle: _textThemes.textTheme.bodyText2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      );

  BottomNavigationBarThemeData get _bottomNavBarTheme =>
      BottomNavigationBarThemeData(
        unselectedItemColor: _colorSchemes.disabled,
        selectedItemColor: _colorSchemes.primary,
        type: BottomNavigationBarType.fixed,
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        hintStyle: _textThemes.textTheme.bodyText1!
            .copyWith(color: _colorSchemes.disabled),
        floatingLabelStyle: _textThemes.textTheme.bodyText2!
            .withColor(_colorSchemes.primary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _colorSchemes.primary,
            width: 2,
          ),
        ),
      );

  TextSelectionThemeData get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: _colorSchemes.primary,
        selectionColor: _colorSchemes.primary,
        selectionHandleColor: _colorSchemes.primary,
      );

  // - BUTTON STYLES | START - //

  ButtonStyle get _buttonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        overlayColor: MaterialStateProperty.all(
            _colorSchemes.primary.withOpacity(.15)),
        foregroundColor: MaterialStateProperty.all(_colorSchemes.primary),
      );

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: _buttonStyle.copyWith(
          backgroundColor:
              MaterialStateProperty.all(_colorSchemes.primary),
          foregroundColor: MaterialStateProperty.all(_colorSchemes.white),
          overlayColor: MaterialStateProperty.all(
            _colorSchemes.white.withOpacity(.15),
          ),
        ),
      );

  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: _buttonStyle.copyWith(
          side: MaterialStateProperty.all(
            BorderSide(
              width: 1,
              color: _colorSchemes.primary,
            ),
          ),
        ),
      );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: _buttonStyle,
      );

  FloatingActionButtonThemeData get _floatingActionButtonTheme =>
      FloatingActionButtonThemeData(
        backgroundColor: _colorSchemes.primary,
        foregroundColor: _colorSchemes.white,
        splashColor: _colorSchemes.white.withOpacity(.15),
      );

  // - BUTTON STYLES | END - //
}
