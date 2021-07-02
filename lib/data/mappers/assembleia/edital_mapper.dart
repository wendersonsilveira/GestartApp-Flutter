import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';

extension EditalMapper on EditalEntity {
  List<EditalEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  EditalEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return EditalEntity(
      codcon: map['CODCON'],
      codtip: map['CODTIP'],
      nomsol: map['NOMSOL'],
      loc: map['LOC'],
      datemi: DateTime.parse(map['DATEMI']),
      datreu: DateTime.parse(map['DATREU']),
      horreu_1: DateTime.parse(map['HORREU_1']),
      horreu_2: DateTime.parse(map['HORREU_2']),
      logo: map['LOGO'],
      nomTip: map['NOMTIP'],
      apelido: map['APELIDO'],
      assunto: map['ASSUNTO'],
      nomsolLinkPhoto: map['NOMSOL_LINK_PHOTO'],
      nompre: map['NOMPRE'],
      nompreLinkPhoto: map['NOMPRE_LINK_PHOTO'],
      nomsec: map['NOMSEC'],
      nomsecLinkPhoto: map['NOMSEC_LINK_PHOTO'],
      nomsin: map['NOMSIN'],
      nomsinLinkPhoto: map['NOMSIN_LINK_PHOTO'],
      linkAta: map['LINK_ATA'],
      linkEdital: map['LINK_EDITAL'],
      // lido: map['LIDO'],
      datemi_1: DateTime.parse(map['DATEMI_1']),
      // datemi_2: DateTime.parse(map['DATEMI_2']),
      // datemi_3: DateTime.parse(map['DATEMI_3']),
      // datemi_4: DateTime.parse(map['DATEMI_4']),
      // datemi_5: DateTime.parse(map['DATEMI_5']),
      // datemi_6: DateTime.parse(map['DATEMI_6']),
      // datemi_7: DateTime.parse(map['DATEMI_7']),
      // datemi_8: DateTime.parse(map['DATEMI_8']),
      // datemi_9: DateTime.parse(map['DATEMI_9']),
      nomusu_1: map['NOMUSU_1'],
      // nomusu_2: map['NOMUSU_2'],
      // nomusu_3: map['NOMUSU_3'],
      // nomusu_4: map['NOMUSU_4'],
      // nomusu_5: map['NOMUSU_5'],
      // nomusu_6: map['NOMUSU_6'],
      // nomusu_7: map['NOMUSU_7'],
      // nomusu_8: map['NOMUSU_8'],
      // nomusu_9: map['NOMUSU_9'],
      obs_1: map['OBS_1'],
      // obs_2: map['OBS_2'],
      // obs_3: map['OBS_3'],
      // obs_4: map['OBS_4'],
      // obs_5: map['OBS_5'],
      // obs_6: map['OBS_6'],
      // obs_7: map['OBS_7'],
      // obs_8: map['OBS_8'],
      // obs_9: map['OBS_9'],
      idAta: map['ID_ATA'],
      alteraAdm: map['ALTERA_ADM'],
      // confirmacao:
    );
  }
}
