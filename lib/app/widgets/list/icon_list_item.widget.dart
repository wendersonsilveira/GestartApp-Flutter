import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_images.dart';
import 'package:flutter/material.dart';

class IconListItemWidget extends StatelessWidget {
  final String link;
  final String icon;

  const IconListItemWidget({Key key, this.link, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColorScheme.white,
      child: Image.network(
        link,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(icon != null ? icon : AppImages.logo);
        },
      ),
    );
  }
}
