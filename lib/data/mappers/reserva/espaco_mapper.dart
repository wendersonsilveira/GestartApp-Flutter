import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';

extension ReservaMapper on EspacoEntity {
  List<EspacoEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  EspacoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return EspacoEntity(
      id: map['ID'],
      codcon: map['CODCON'],
      descricao: map['DESCRICAO'],
      obs: map['OBS'],
      capacidade: map['CAPACIDADE'],
      perMin: map['PERMIN'],
      perMax: map['PERMAX'],
      antMin: map['ANTMIN'],
      antMax: map['ANTMAX'],
      intRes: map['INTRES'],
      dom: map['DOM'],
      domIni: map['DOM_INI'],
      domFim: map['DOM_FIM'],
      seg: map['SEG'],
      segIni: map['SEG_INI'],
      segFim: map['SEG_FIM'],
      ter: map['TER'],
      terIni: map['TER_INI'],
      terFim: map['TER_FIM'],
      qua: map['QUA'],
      quaIni: map['QUA_INI'],
      quaFim: map['QUA_FIM'],
      qui: map['QUI'],
      quiIni: map['QUI_INI'],
      quiFim: map['QUI_FIM'],
      sex: map['SEX'],
      sexIni: map['SEX_INI'],
      sexFim: map['SEX_FIM'],
      sab: map['SAB'],
      sabIni: map['SAB_INI'],
      sabFim: map['SAB_FIM'],
      aprovacao: map['APROVACAO'],
      apenasMaster: map['APENAS_MASTER'],
      restricoes: map['RESTRICOES'],
      deletedAt: map['DELETED_AT'],
      identificador: map['IDENTIFICADOR'],
      maxRes: map['MAXRES'],
      intResNew: map['INTRESNEW'],
      feriadosIds: map['FERIADOS_IDS'],
      maxResTempo: map['MAXRES_TEMPO'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'CODCON': codcon,
  //     'CODORD': codord,
  //     'ESPACO_ID': espacoId,
  //     'ESPACO_DESCRICAO': espacoDescricao,
  //     'APELIDO': apelido,
  //     'DATINI': datIni,
  //     'DATINI_ORIGINAL': datIniOriginal,
  //     'HORINI_ID': horIniId,
  //     'HORINI_DESCRICAO': horIniDescricao,
  //     'HORFIM_ID': horFimId,
  //     'HORFIM_DESCRICAO': horFimDescricao
  //   };
  // }
}
