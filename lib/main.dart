import 'package:Gestart/di/di.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  // Stetho.initialize();

  initilizerInjection();

  runApp(
    ScreenUtilInit(
        designSize: Size(750, 1334),
        allowFontScaling: false,
        builder: () => ModularApp(module: AppModule())),
  );
}
