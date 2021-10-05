import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';

extension BoletoMapper on BoletoEntity {
  BoletoEntity copyWith() {
    return BoletoEntity(
      id: id ?? this.id,
      datven: datven ?? this.datven,
      datemi: datemi ?? this.datemi,
      valtot: valtot ?? this.valtot,
      nompro: nompro ?? this.nompro,
      codcon: codcon ?? this.codcon,
      nomcon: nomcon ?? this.nomcon,
      codord: codord ?? this.codord,
      codimo: codimo ?? this.codimo,
      titcob: titcob ?? this.titcob,
      endcob: endcob ?? this.endcob,
      apelido: apelido ?? this.apelido,
      logo: logo ?? this.logo,
    );
  }

  List<BoletoEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  BoletoEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return BoletoEntity(
      id: map['ID'],
      datven: DateTime.parse(map['DATVEN']),
      datemi: DateTime.parse(map['DATEMI']),
      valtot: (map['VALTOT']).toDouble(),
      nompro: map['NOMPRO'],
      codcon: map['CODCON'],
      nomcon: map['NOMCON'],
      codord: map['CODORD'],
      codimo: map['CODIMO'],
      titcob: map['TITCOB'],
      endcob: map['ENDCOB'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
    );
  }

  /* final int id;
  final DateTime datven;
  final DateTime datemi;
  final double nompro;
  final int codcon;
  final String nomcon;
  final int codord;
  final String codimo;
  final String titcob;
  final String endcob;
  final String apelido;
  final String logo;
*/
}
