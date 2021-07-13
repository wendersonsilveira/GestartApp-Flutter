import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';

extension HorariosEspacoMapper on HorarioEspacoEntity {
  List<HorarioEspacoEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  HorarioEspacoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return HorarioEspacoEntity(
        horiniId: map['HORINI_ID'],
        horIniDescricao: map['HORINI_DESCRICAO'],
        horfimId: map['HORFIM_ID'],
        horfimDescricao: map['HORFIM_DESCRICAO'],
        reservaId: map['RESERVA_ID'],
        bloqueado: map['BLOQUEADO']);
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
