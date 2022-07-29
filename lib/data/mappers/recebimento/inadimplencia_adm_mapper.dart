import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_entity.dart';

extension InadimplenciaMapper on InadimplenciaAdmEntity {
  List<InadimplenciaAdmEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  InadimplenciaAdmEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return InadimplenciaAdmEntity(
      codCon: map['CODCON'],
      codImo: map['CODIMO'],
      codOrd: map['CODORD'],
      condomTipId: map['CONDOM_TIPOS_ID'] != null ? map['CONDOM_TIPOS_ID'] : -1,
      multa: map['MULTA'] != null ? map['MULTA'].toDouble() : 0,
      negativado: map['NEGATIVADO'] != null ? map['NEGATIVADO'] : '',
      negativadoInt:
          map['NEGATIVADO_INT'] != null ? map['NEGATIVADO_INT'] : false,
      nomPro: map['NOMPRO'] != null ? map['NOMPRO'] : '',
      processado: map['PROCESSADO'] != null ? map['PROCESSADO'] : '',
      processadoInt: map['PROCESSADO_INT'] != null
          ? map['PROCESSADO_INT'] > 0
              ? true
              : false
          : 0,
      tipCob: map['TIPCOB'] != null ? map['TIPCOB'] : '',
      tipCobDes: map['TIPCOB_DESCRI'] != null ? map['TIPCOB_DESCRI'] : '',
      total: map['TOTAL'] != null ? map['TOTAL'].toDouble() : 0,
      valMen: map['VALMEN'] != null ? map['VALMEN'].toDouble() : 0,
      valPag: map['VALPAG'] != null ? map['VALPAG'].toDouble() : 0,
    );
  }
}
