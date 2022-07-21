// import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';

extension IncidenciaInadimplenciasMapper on IncidenciaInadimplenciasEntity {
  List<IncidenciaInadimplenciasEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  IncidenciaInadimplenciasEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return IncidenciaInadimplenciasEntity(
      nomTip: map['NOMTIP'],
      datInc: map['DATINC'] != null ? DateTime.parse(map['DATINC']) : null,
      datDis: map['DATDIS'] != null ? DateTime.parse(map['DATDIS']) : null,
      valDiv: map['VALDIV'] != null ? map['VALDIV'].toDouble() : 0,
      nomCar: map['NOMCAR'] != null ? map['NOMCAR'] : '',
      numDoc: map['NUMDOC'] != null ? map['NUMDOC'] : '',
    );
  }
}
