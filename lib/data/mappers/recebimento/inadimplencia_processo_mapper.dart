// import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_processos_entity.dart';

extension ProcessoInadimplenciasMapper on ProcessoInadimplenciasEntity {
  List<ProcessoInadimplenciasEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  ProcessoInadimplenciasEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ProcessoInadimplenciasEntity(
      datEmi: DateTime.parse(map['DATEMI']),
      numPro: map['NUMPRO'] != null ? map['NUMPRO'] : '',
      nomFas: map['NOMFAS'] != null ? map['NOMFAS'] : '',
    );
  }
}
