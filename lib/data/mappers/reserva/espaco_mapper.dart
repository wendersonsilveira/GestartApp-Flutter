import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';

extension EspacoMapper on EspacoEntity {
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
      minCancel: map['INTER_ANT_CANCELAMENTO'],
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
      statusEspaco: map['STATUS'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'DOM': dom,
      'SEG': seg,
      'TER': ter,
      'QUA': qua,
      'QUI': qui,
      'SEX': sex,
      'SAB': sab
    };
  }

  Map<String, dynamic> toMap2() {
    return {
      'ID': id ?? null,
      'CODCON': codcon,
      'DESCRICAO': descricao,
      'OBS': obs,
      'CAPACIDADE': capacidade,
      'PERMIN': perMin,
      'PERMAX': perMax,
      'ANTMIN': antMin,
      'ANTMAX': antMax,
      'INTRES': intRes,
      'INTER_ANT_CANCELAMENTO': minCancel,
      'DOM': dom ? 1 : 0,
      'DOM_INI': domIni,
      'DOM_FIM': domFim,
      'SEG': seg ? 1 : 0,
      'SEG_INI': segIni,
      'SEG_FIM': segFim,
      'TER': ter ? 1 : 0,
      'TER_INI': terIni,
      'TER_FIM': terFim,
      'QUA': qua ? 1 : 0,
      'QUA_INI': quaIni,
      'QUA_FIM': quaFim,
      'QUI': qui ? 1 : 0,
      'QUI_INI': quiIni,
      'QUI_FIM': quiFim,
      'SEX': sex ? 1 : 0,
      'SEX_INI': sexIni,
      'SEX_FIM': sexFim,
      'SAB': sab ? 1 : 0,
      'SAB_INI': sabIni,
      'SAB_FIM': sabFim,
      'APROVACAO': aprovacao ? 1 : 0,
      'APENAS_MASTER': apenasMaster ? 1 : 0,
      'STATUS': statusEspaco ? 1 : 0,
    };
  }
}
