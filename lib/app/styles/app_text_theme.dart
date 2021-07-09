import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  /// https://material.io/design/typography/the-type-system.html#type-scale - Helps to create textTheme

  static TextTheme get textTheme => textThemeRoboto;

  static TextTheme textThemeRoboto = TextTheme(
    headline1: headingH1Regular2,
    headline2: headingH2Medium2,
    headline3: headingH3Regular2,
    headline4: headingH4Regular2,
    headline5: headingH5Medium2,
    headline6: GoogleFonts.roboto(
      fontSize: 19.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15.sp,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15.sp,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1.sp,
    ),
    bodyText1: bodyRegular2,
    bodyText2: body2Medium2,
    button: GoogleFonts.roboto(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25.sp,
    ),
    caption: geralCaptionRegular2,
    overline: geralOverlineRegular2,
  );

  static TextStyle headingH1Regular2 = TextStyle(
      fontSize: 48.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle headingH2Medium2 = TextStyle(
      fontSize: 40.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);
  static TextStyle headingH2Regular2 = TextStyle(
      fontSize: 40.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static TextStyle headingH3Regular2 = TextStyle(
      fontSize: 32.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle gestartLogin = TextStyle(
      color: Colors.white,
      fontSize: 36.sp,
      fontFamily: 'roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold);

  static TextStyle negrito = TextStyle(
      // color: Colors.black,
      fontSize: 40.sp,
      fontFamily: 'roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold);

  static TextStyle white = TextStyle(
    color: Colors.white,
    fontSize: 5,
    fontFamily: 'roboto',
    fontStyle: FontStyle.normal,
  );

  static TextStyle smallIconEmoji = TextStyle(
      fontSize: 11.sp, fontFamily: 'roboto', fontStyle: FontStyle.normal);

  static TextStyle negritoInformativo = TextStyle(
      fontSize: 24.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal);

  static TextStyle headingH4Regular2 = TextStyle(
      fontSize: 32.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static TextStyle headingH5Medium2 = TextStyle(
      fontSize: 20.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static TextStyle headingH5Regular2 = TextStyle(
      fontSize: 19.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle headingH5Medium = TextStyle(
      fontSize: 19.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static TextStyle bodySemibold2 = TextStyle(
      fontSize: 15.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);

  static TextStyle bodyMedium2 = TextStyle(
      fontSize: 15.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static TextStyle bodySemibold3 = TextStyle(
      fontSize: 15.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);

  static TextStyle bodySemibold4 = TextStyle(
      fontSize: 24.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);

  static TextStyle bodyRegular2 = TextStyle(
      fontSize: 15.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle body2Semibold2 = TextStyle(
      fontSize: 13.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);

  static TextStyle body2Medium2 = TextStyle(
      fontSize: 13.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static TextStyle body2Regular2 = TextStyle(
      fontSize: 13.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle geralMedium = TextStyle(
      fontSize: 12.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static TextStyle geralCaptionBold2 = TextStyle(
      fontSize: 12.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal);

  static TextStyle geralCaptionRegular2 = TextStyle(
      fontSize: 12.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle geralOverlineRegular2 = TextStyle(
      fontSize: 11.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle geralOverlineSemibold2 = TextStyle(
      fontSize: 10.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal);

  static TextStyle successRateBody = TextStyle(
      fontSize: 40.sp,
      fontFamily: 'roboto',
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal);

  static TextStyle itemNameHint = TextStyle(
    fontSize: 19.sp,
    fontFamily: 'roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.15.sp,
    color: AppColorScheme.neutralMedium2,
  );

  static double fontSizeButton = 30.sp;

  static TextStyle buttonContained = TextStyle(
    fontSize: fontSizeButton,
    fontFamily: 'roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    color: AppColorScheme.white,
  );

  static TextStyle buttonFlat = TextStyle(
    fontSize: fontSizeButton,
    fontFamily: 'roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    color: AppColorScheme.primaryswatch[600],
  );

  static TextStyle titleAppBar = TextStyle(
    fontSize: 36.sp,
    fontFamily: 'roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    color: AppColorScheme.white,
  );

  static TextStyle titleAlertError = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15.sp,
    fontFamily: 'roboto',
    color: AppColorScheme.feedbackDangerDark,
  );
  static TextStyle titleAlertInfo = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15.sp,
    fontFamily: 'roboto',
    color: AppColorScheme.tagOrange2,
  );

  static TextStyle titleAlertQestion = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15.sp,
    fontFamily: 'roboto',
    color: AppColorScheme.black,
  );

  static TextStyle titleAlertSuccess = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15.sp,
    fontFamily: 'roboto',
    color: AppColorScheme.feedbackSuccessDark2,
  );

  static TextStyle subtitleAppBar = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15.sp,
    fontFamily: 'roboto',
    fontStyle: FontStyle.normal,
    color: AppColorScheme.white,
  );

  static TextStyle titleDashboardPage = TextStyle(
    fontSize: 44.sp,
    letterSpacing: 0.18.sp,
    fontFamily: 'roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    color: AppColorScheme.black,
  );

  static TextStyle infoSerachDashboardPage = TextStyle(
    fontSize: 23.sp,
    letterSpacing: 0.15.sp,
    fontFamily: 'roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    color: AppColorScheme.neutralDefault2,
  );

  static TextStyle messageError = TextStyle(
    fontSize: 32.sp,
    letterSpacing: 0.15.sp,
    fontFamily: 'roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColorScheme.neutralDefault2,
  );
  // -------- novos ------------------------------

  static TextStyle textActionButton = TextStyle(
    fontSize: 32.sp,
    color: Color(0xFFffffff),
  );
}
