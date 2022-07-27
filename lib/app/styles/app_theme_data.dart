import 'package:Gestart/app/styles/app_bar_theme_app.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// https://rxlabz.github.io/panache/#/

final ThemeData themeData = ThemeData(
    primarySwatch: Colors.orange,
    brightness: Brightness.light,
    primaryColor: AppColorScheme.primaryColor,
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0xffffccbc),
    primaryColorDark: AppColorScheme.primaryswatch[700],
    accentColor: AppColorScheme.primaryswatch[800],
    accentColorBrightness: Brightness.dark,
    canvasColor: Color(0xfffafafa),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Color(0xfffafafa),
    bottomAppBarColor: Color(0xffffffff),
    cardColor: AppColorScheme.white,
    dividerColor: Color(0x1f000000),
    highlightColor: Color(0x66bcbcbc),
    splashColor: Color(0x66c8c8c8),
    selectedRowColor: Color(0xfff5f5f5),
    unselectedWidgetColor: Color(0x8a000000),
    disabledColor: AppColorScheme.primaryswatch[200],
    buttonColor: Color(0xffe0e0e0),
    toggleableActiveColor: AppColorScheme.primaryswatch[700],
    secondaryHeaderColor: Color(0xfffbe9e7),
    // textSelectionColor: AppColorScheme.primaryswatch[200],
    // cursorColor: AppColorScheme.primaryswatch[200],
    // textSelectionHandleColor: AppColorScheme.primaryswatch[300],
    backgroundColor: AppColorScheme.primaryswatch[200],
    dialogBackgroundColor: AppColorScheme.white,
    indicatorColor: AppColorScheme.primaryColor,
    hintColor: Color(0x8a000000),
    errorColor: AppColorScheme.feedbackDangerDark,
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        disabledColor: AppColorScheme.primaryswatch[200],
        buttonColor: AppColorScheme.primaryswatch[600],
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.h))),
    appBarTheme: AppBarThemeApp.appBarTheme);
