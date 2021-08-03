import 'package:Gestart/domain/entities/recebimento/inadimplencia_entity.dart';

extension InadimplenciaMapper on InadimplenciaEntity {
  List<InadimplenciaEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  InadimplenciaEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return InadimplenciaEntity(
      unidade: map['UNIDADE'],
      valor: map['VALOR'].toDouble(),
      codOrd: map['CODORD'],
      codCon: map['CODCON'],
      multa: map['MULTA'].toDouble(),
      total: map['TOTAL'].toDouble(),
      tipCob: map['TIPCOB'],
      tipcobDescri: map['TIPCOB_DESCRI'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
      linkPhoto: map['LINK_PHOTO'],
      datVen: map['DATVEN'] != null ? DateTime.parse(map['DATVEN']) : null,
      histor: map['HISTOR'],
      datEmi: map['DATEMI'] != null ? DateTime.parse(map['DATEMI']) : null,
      mesano: map['MESANO'],
      idConta: map['ID_CONTA'],
      valMul: map['VALMUL'] != null ? map['VALMUL'].toDouble() : null,
      valJur: map['VALJUR'] != null ? map['VALJUR'].toDouble() : null,
      valDes: map['VALDES'] != null ? map['VALDES'].toDouble() : null,
      diasMulta: map['DIAS_MULTA'],
    );
  }
}
