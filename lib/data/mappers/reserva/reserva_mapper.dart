import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';

extension ReservaMapper on ReservaEntity {
  List<ReservaEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  ReservaEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ReservaEntity(
      dia: map['DIA'],
      mes: map['MES'],
      ano: map['ANO'],
      data: DateTime.parse(map['DATA']),
      id: map['ID'],
      codcon: map['CODCON'],
      codord: map['CODORD'],
      titulo: map['TITULO'],
      descricao: map['DESCRICAO'],
      espacoId: map['ESPACO_ID'],
      condonUserId: map['CONDON_USER_ID'],
      status: map['STATUS'],
      statusDescricao: map['STATUS_DESCRICAO'],
      motivoRecusa: map['MOTIVO_RECUSA'],
      datIni: DateTime.parse(map['DATINI']),
      datFim: DateTime.parse(map['DATFIM']),
      horIniId: map['HORINI_ID'],
      horFimId: map['HORFIM_ID'],
      createat: DateTime.parse(map['CREATEAT']),
      rejeitarMotivo: map['REJEITAR_MOTIVO'],
      canceladoCondonUserId: map['CANCELADO_CONDON_USER_ID'],
      espacoDescricao: map['ESPACO_DESCRICAO'],
      horIniDescricao: map['HORINI_DESCRICAO'],
      horFimDescricao: map['HORFIM_DESCRICAO'],
      codimo: map['CODIMO'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'CODCON': codcon,
      'CODORD': codord,
      'ESPACO_ID': espacoId,
      'ESPACO_DESCRICAO': espacoDescricao,
      'APELIDO': apelido,
      'DATINI': datIni,
      'DATINI_ORIGINAL': datIniOriginal,
      'HORINI_ID': horIniId,
      'HORINI_DESCRICAO': horIniDescricao,
      'HORFIM_ID': horFimId,
      'HORFIM_DESCRICAO': horFimDescricao
    };
  }
}
