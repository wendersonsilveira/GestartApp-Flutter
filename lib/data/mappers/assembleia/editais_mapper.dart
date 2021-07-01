import 'package:Gestart/domain/entities/assembleia/editais_entity.dart';

extension AssembleiaMapper on EditaisEntity {
  EditaisEntity copyWith(EditaisEntity editais) {
    return EditaisEntity(
      id: id ?? this.id,
      codcon: codcon ?? this.codcon,
      codtip: codtip ?? this.codtip,
      datreu: datreu ?? this.datreu,
      horreu_1: horreu_1 ?? this.horreu_1,
      horreu_2: horreu_2 ?? this.horreu_2,
      loc: loc ?? this.loc,
      idAta: idAta ?? this.idAta,
      nomtip: nomtip ?? this.nomtip,
      status: status ?? this.status,
      apelido: apelido ?? this.apelido,
      logo: logo ?? this.logo,
    );
  }

  List<EditaisEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  EditaisEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EditaisEntity(
      id: map['ID'],
      codcon: map['CODCON'],
      codtip: map['CODTIP'],
      datreu: DateTime.parse(map['DATREU']),
      horreu_1: DateTime.parse(map['HORREU_1']),
      horreu_2: DateTime.parse(map['HORREU_2']),
      loc: map['LOC'],
      idAta: map['ID_ATA'],
      nomtip: map['NOMTIP'],
      status: map['STATUS'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
    );
  }
}
