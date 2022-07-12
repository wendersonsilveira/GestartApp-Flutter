// import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';

extension IncidenciaInadimplenciasMapper on IncidenciaInadimplenciasEntity {
  List<IncidenciaInadimplenciasEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  IncidenciaInadimplenciasEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return IncidenciaInadimplenciasEntity(
      nomTip: map['NOMTIP'],
      datInc: DateTime.parse(map['DATINC']),
      datDis: DateTime.parse(map['DATDIS']),
      valDiv: map['VALDIV'] != null ? map['VALDIV'].toDouble() : 0,
      nomCar: map['NOMCAR'] != null ? map['NOMCAR'] : '',
      numDoc: map['NUMDOC'] != null ? map['NUMDOC'] : '',
    );
  }
}
