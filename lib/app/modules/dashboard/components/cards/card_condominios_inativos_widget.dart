import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/icons/icons_utils.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCondInativosWidget extends StatelessWidget {
  const CardCondInativosWidget({Key key, this.condominio}) : super(key: key);
  final List<CondominioEntity> condominio;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300 +
            (2 * condominio.length)
                .w, //colocar a condição para caso tenha mais de 1 condominio vinculado
        color: AppColorScheme.white,
        padding: EdgeInsets.all(14),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    IconsUtils.warning,
                    height: 40,
                    width: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Quase lá!'),
                  )
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Text(
                  'Identificamos que seu CPF ou CNPJ está relacionado ao(s) condomínio(s):'),
              SizedBox(
                height: 26.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: condominio.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text('- ${condominio[index].apelido}');
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Modular.navigator.pushNamed(RouteName.ativar_condominio);
                },
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.checkCircle,
                              size: 40.h,
                              color: AppColorScheme.primaryColor,
                            ),
                            SizedBox(
                              width: 26.h,
                            ),
                            Text('Ative agora'),
                          ],
                        ),
                      ),
                      Icon(
                        LineIcons.arrowRight,
                        size: 40.h,
                        color: AppColorScheme.primaryColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
