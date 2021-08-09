import 'package:Gestart/domain/entities/contas/extrato_financeiro_entity.dart';

extension ExtratoFinanceiroMapper on ExtratoFinanceiroEntity {
  List<ExtratoFinanceiroEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  ExtratoFinanceiroEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return ExtratoFinanceiroEntity(
      diaId: map['DIA_ID'],
      idSisPag: map['IS_SISPAG'],
      idSisPagDetail: map['IS_SISPAG_DETAIL'],
      datLan: map['DATLAN'] != null ? DateTime.parse(map['DATLAN']) : null,
      datVen: map['DATVEN'] != null ? DateTime.parse(map['DATVEN']) : null,
      valLan: map['VALLAN'] != null ? map['VALLAN'].toDouble() : null,
      tipLan: map['TIPLAN'],
      idConta: map['ID_CONTA'],
      contaDescricao: map['CONTA_DESCRICAO'],
      hisLan: map['HISLAN'],
      codPla: map['CODPLA'],
      saldoAtual:
          map['SALDO_ATUAL'] != null ? map['SALDO_ATUAL'].toDouble() : null,
      saldoAnterior: map['SALDO_ANTERIOR'] != null
          ? map['SALDO_ANTERIOR'].toDouble()
          : null,
      codCon: map['CODCON'],
      nomCon: map['NOMCON'],
      isCap: map['IS_CAP'],
    );
  }
}
