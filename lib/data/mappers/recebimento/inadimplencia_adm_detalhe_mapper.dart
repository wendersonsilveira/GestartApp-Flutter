import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_detalhe_entity.dart';

extension InadimplenciaDetalheMapper on InadimplenciaAdmDetalheEntity {
  List<InadimplenciaAdmDetalheEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  InadimplenciaAdmDetalheEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return InadimplenciaAdmDetalheEntity(
      mesAno: map['MESANO'],
      datVen: DateTime.parse(map['DATVEN']),
      valMen: map['VALMEN'] != null ? map['VALMEN'].toDouble() : 0,
      multa: map['MULTA'] != null ? map['MULTA'].toDouble() : 0,
      total: map['TOTAL'] != null ? map['TOTAL'].toDouble() : 0,
      histor: map['HISTOR'] != null ? map['HISTOR'] : '',
    );
  }
}
