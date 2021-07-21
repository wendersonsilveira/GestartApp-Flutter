import 'package:flutter/material.dart';

class AppColorScheme {
  static final ColorScheme colorSchemeLight = ColorScheme.fromSwatch(
    backgroundColor: const Color(0xff6a7a6c),
    accentColor: primaryswatchAccent,
    primarySwatch: primaryswatch,
    errorColor: feedbackDangerBase,
  ).copyWith(onPrimary: white);

  /// http://mcg.mbitson.com/
  static const MaterialColor primaryswatch =
      MaterialColor(_primaryswatchPrimaryValue, <int, Color>{
    50: Color(0xFFEBF4EA),
    100: Color(0xFFCCE4C9),
    200: Color(0xFFAAD3A6),
    300: Color(0xFF88C182),
    400: Color(0xFF6FB367),
    500: Color(_primaryswatchPrimaryValue),
    600: Color(0xFF4E9E45),
    700: Color(0xFF44953C),
    800: Color(0xFF3B8B33),
    900: Color(0xFF2A7B24),
  });
  static const int _primaryswatchPrimaryValue = 0xFF55A64C;

  static const MaterialColor primaryswatchAccent =
      MaterialColor(_primaryswatchAccentValue, <int, Color>{
    100: Color(0xFFC0FFBB),
    200: Color(_primaryswatchAccentValue),
    400: Color(0xFF61FF55),
    700: Color(0xFF49FF3B),
  });
  static const int _primaryswatchAccentValue = 0xFF90FF88;

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color grey = Color(0xffe0e0eb);

  static const backgroundColor = Color(0xFFf4f4f4);
  static const primaryColor = Color(0xFF008001);
  static const primaryColor50 = Color(0xFFFFEBE3);
  static const secondaryColor = Color(0x70008000);

  static const corMenuBotton = Color(0xFFe8e8e8);

  static const neutralWhite2A = Color.fromRGBO(255, 255, 255, 0.1);
  static const neutralDefault2 = Color(0xff616e7c);
  static const neutralLight2 = Color(0xffcfdae5);
  static const neutralLighest2 = Color(0xfff2f4f7);
  static const neutralMedium2 = Color(0xff9aa5b1);
  static const neutralMedium3 = Color(0xff757575);
  static const neutralDark2 = Color(0xff1f2933);
  static const backgroundGreyLight = Color(0xffDCDCDC);

  static const feedbackWarningDefault2 = Color(0xffffc300);
  static const feedbackWarningLighest2 = Color(0xfffff7de);
  static const feedbackWarningDark2 = Color(0xffcc9c00);
  static const feedbackWarningLight2 = Color(0xffffe799);
  static const feedbackWarningMedium2 = Color(0xffffdb66);
  static const feedbackDangerLighest = Color(0xfffeebed);
  static const feedbackDangerLight = Color(0xfffccdd1);
  static const feedbackDangerMedium = Color(0xfff6727f);
  static const feedbackDangerBase = Color(0xfff23548);
  static const feedbackDangerDark = Color(0xffff0000);
  static const feedbackSuccessDefault2 = Color(0xff00e484);
  static const feedbackSuccessLighest2 = Color(0xffebfaf3);
  static const feedbackSuccessLight2 = Color(0xff9dfad3);
  static const feedbackSuccessMedium2 = Color(0xff66efb5);
  static const feedbackSuccessDark2 = Color(0xff00cc76);

  static const tagRed2 = Color(0xffee4d4d);
  static const tagOrange2 = Color(0xffff884d);
  static const tagTurquesa2 = Color(0xff4ddbc4);
  static const tagGreen2 = Color(0xffa2d471);
  static const tagPurple2 = Color(0xffa67aff);
  static const tagBlue2 = Color(0xff6398ff);
  static const tagYellow2 = Color(0xffffc44d);

  static const googleButton = Color.fromRGBO(231, 77, 60, 1);
  static const facebookButton = Color.fromRGBO(66, 103, 178, 1);
  static const appleButton = Color.fromRGBO(0, 0, 0, 1);

  static const itemOptionCardShadow = Color(0xFFDCDCDC);

  static const textInfo = Color(0xFF0975BD);
}
