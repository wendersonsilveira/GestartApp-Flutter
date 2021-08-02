import 'package:Gestart/domain/entities/contas/contas_entity.dart';

extension ContasMapper on ContasEntity {
  List<ContasEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  ContasEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return ContasEntity(
      tipo: map['TIPO'],
      tipFor: map['TIPFOR'],
      codCon: map['CODCON'],
      tipCon: map['TIPCON'],
      codFor: map['CODFOR'],
      tipoContrato: map['TIPO_CONTRATO'],
      diaVen: map['DIAVEN'],
      mesVencimento: map['MES_VENCIMENTO'],
      tipPag: map['TIPPAG'],
      valCon: map['VALCON'] == null ? null : map['VALCON'].toDouble(),
      datEmi: map['DATEMI'] != null ? DateTime.parse(map['DATEMI']) : null,
      numMins: map['NUMINS'],
      senha: map['SENHA'],
      codPla: map['CODPLA'],
      codCed: map['CODCED'],
      codHis: map['CODHIS'],
      tipHis: map['TIPHIS'],
      datIni: map['DATINI'] != null ? DateTime.parse(map['DATINI']) : null,
      quaPar: map['QUAPAR'],
      nominal: map['NOMINAL'],
      debaut: map['DEBAUT'],
      dds: map['DDS'],
      id: map['ID'],
      forPag: map['FORPAG'],
      codFinTed: map['CODFIN_TED'],
      idContaDeb: map['ID_CONTA_DEB'],
      gerarMedia: map['GERAR_MEDIA'],
      considerarMedia: map['CONSIDERAR_MEDIA'],
      pagEletronico: map['PAG_ELETRONICO'],
      idContaCredito: map['ID_CONTA_CREDITO'],
      nomFor: map['NOMFOR'],
      valorMedia: map['VALOR_MEDIA'],
      nomPla: map['NOMPLA'],
      nomCla: map['NOMCLA'],
      apelido: map['APELIDO'],
      nomCon: map['NOMCON'],
    );
  }
}
