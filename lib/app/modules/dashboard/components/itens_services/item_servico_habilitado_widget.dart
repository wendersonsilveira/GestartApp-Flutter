import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemServicoHabilitadoWidget extends StatelessWidget {
  const ItemServicoHabilitadoWidget(
      {Key key, this.icone, this.descricao, this.routeName, this.condominios})
      : super(key: key);
  final IconData icone;
  final String descricao;
  final String routeName;
  final List<CondominioEntity> condominios;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(routeName);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.white,
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
                style: TextStyle(
                    color: AppColorScheme.neutralMedium4, fontSize: 16),
              )
            ],
          )),
    );
  }
}
