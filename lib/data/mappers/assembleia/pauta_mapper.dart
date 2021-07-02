import 'package:Gestart/domain/entities/assembleia/assembleia_entity.dart';
import 'package:Gestart/domain/entities/assembleia/pautas_entity.dart';

extension AssembleiaMapper on PautaEntity {
  List<AssembleiaEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  AssembleiaEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return AssembleiaEntity(
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

  // List<PautaEntity> fromEditaisList(List<EditaisEntity> editais) =>
  //     List.from(editais).map((element) => fromEditais(element)).toList();

  // PautaEntity fromEditais(EditaisEntity edital){
  //   return PautaEntity(descricao: edital.)
  // }
}
