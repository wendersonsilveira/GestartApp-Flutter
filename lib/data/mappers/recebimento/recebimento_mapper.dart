import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';

extension RecebimentoMapper on RecebimentoEntity {
  RecebimentoEntity copyWith({
    int id,
    int codOrd,
    String unidade,
    double valor,
    String codimo,
    String nomcon,
    DateTime dt1,
    DateTime dt2,
    String apelido,
    String logo,
    String linkPhoto,
  }) {
    return RecebimentoEntity(
      id: id ?? this.id,
      codOrd: codOrd ?? this.codOrd,
      unidade: unidade ?? this.unidade,
      valor: valor ?? this.valor,
      codimo: codimo ?? this.codimo,
      nomcon: nomcon ?? this.nomcon,
      dt1: dt1 ?? this.dt1,
      dt2: dt2 ?? this.dt2,
      apelido: apelido ?? this.apelido,
      logo: logo ?? this.logo,
      linkPhoto: linkPhoto ?? this.linkPhoto,
    );
  }

  List<RecebimentoEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  RecebimentoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return RecebimentoEntity(
      id: map['ID'],
      codOrd: map['CODORD'],
      unidade: map['UNIDADE'],
      valor: map['VALOR'].toDouble(),
      codimo: map['CODIMO'],
      nomcon: map['NOMCON'],
      dt1: DateTime.parse(map['DT1']),
      dt2: DateTime.parse(map['DT2']),
      apelido: map['APELIDO'],
      logo: map['LOGO'],
      linkPhoto: map['LINK_PHOTO'],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'ID': id != null ? id : 0,
  //     'TIPO': tipo,
  //     'RACA': raca,
  //     'PORTE': porte,
  //     'NOME': nome,
  //   };
  // }
}
