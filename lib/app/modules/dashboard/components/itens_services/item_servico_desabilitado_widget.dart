import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemServicoDesabilitadoWidget extends StatelessWidget {
  const ItemServicoDesabilitadoWidget({Key key, this.icone, this.descricao})
      : super(key: key);
  final IconData icone;
  final String descricao;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColorScheme.grey,
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: Icon(
                icone,
                size: 50.h,
                color: AppColorScheme.primaryColor,
              ),
            ),
            Text(
              descricao,
              style:
                  TextStyle(color: AppColorScheme.primaryColor, fontSize: 16),
            )
          ],
        ));
  }
}
