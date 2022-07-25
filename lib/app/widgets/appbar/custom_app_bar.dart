import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarCustom extends AppBar {
  AppBarCustom(BuildContext context,
      {Key key,
      Widget title,
      String textTitle,
      List<Widget> actions,
      double elevation = 6,
      bool automaticallyImplyLeading = true,
      double titleSpacing = 0.0,
      Widget leading,
      bool center = true,
      PreferredSizeWidget bottom,
      Widget flexibleSpace})
      : super(
            flexibleSpace: flexibleSpace,
            key: key,
            title: textTitle != null
                ? Text(
                    textTitle,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.titleAppBar,
                  )
                : title,
            centerTitle: center,
            actions: actions,
            backgroundColor: AppColorScheme.primaryColor,
            elevation: elevation,
            automaticallyImplyLeading: automaticallyImplyLeading,
            leading: leading == null
                ? !Navigator.of(context).canPop()
                    ? const SizedBox()
                    : IconButton(
                        icon: Icon(
                          Icons.ac_unit,
                          size: 60.h,
                        ),
                        onPressed: () => Modular.navigator.pop(),
                      )
                : leading,
            titleSpacing: titleSpacing,
            bottom: bottom);
}
