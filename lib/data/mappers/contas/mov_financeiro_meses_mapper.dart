import 'package:Gestart/domain/entities/contas/mov_financeiro_meses_entity.dart';

extension MovFinanceiroMesesMapper on MovFinanceiroMesesEntity {
  List<MovFinanceiroMesesEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  MovFinanceiroMesesEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return MovFinanceiroMesesEntity(
      datSal: map['DATSAL'] != null ? DateTime.parse(map['DATSAL']) : null,
      mesAno: map['MESANO'],
    );
  }
}
