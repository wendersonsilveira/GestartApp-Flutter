import 'package:Gestart/domain/entities/reserva/hora_entity.dart';

extension HoraMapper on HoraEntity {
  List<HoraEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  HoraEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return HoraEntity(
      id: map['ID'],
      descricao: map['DESCRICAO'],
      valor: map['VALOR'],
      tipo: map['TOPO'],
      ordem: map['ORDEM'],
    );
  }
}
