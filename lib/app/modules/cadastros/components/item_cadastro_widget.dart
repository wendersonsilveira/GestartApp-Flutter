import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCadastroWidget extends StatelessWidget {
  const ItemCadastroWidget(
      {Key key, this.descricao, this.icone, this.routeName})
      : super(key: key);

  final String descricao;
  final IconData icone;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.navigator.pushNamed(RouteName.pets);
      },
      child: Container(
        color: Color(0xfffafafa),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icone,
              size: 50.h,
              color: AppColorScheme.primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              descricao,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
