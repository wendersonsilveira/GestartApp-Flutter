import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';

extension HistoricoInadimMapper on HistoricoInadimEntity {
  List<HistoricoInadimEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  HistoricoInadimEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return HistoricoInadimEntity(
      historico: map['HISTORICO'],
      datemi: map['DATEMI'] != null ? DateTime.parse(map['DATEMI']) : null,
      codOrd: map['CODORD'],
    );
  }
}
