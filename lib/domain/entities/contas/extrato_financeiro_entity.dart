class ExtratoFinanceiroEntity {
  final int diaId;
  final int idSisPag;
  final int idSisPagDetail;
  final DateTime datLan;
  final DateTime datVen;
  final double valLan;
  final String tipLan;
  final int idConta;
  final String contaDescricao;
  final String hisLan;
  final String codPla;
  double saldoAtual = 0;
  final double saldoAnterior;
  final int codCon;
  final String nomCon;
  final int isCap;
  final dynamic sisPags = [];
  ExtratoFinanceiroEntity(
      {this.diaId,
      this.idSisPag,
      this.idSisPagDetail,
      this.datLan,
      this.datVen,
      this.valLan,
      this.tipLan,
      this.idConta,
      this.contaDescricao,
      this.hisLan,
      this.codPla,
      this.saldoAtual = 0,
      this.saldoAnterior,
      this.codCon,
      this.nomCon,
      this.isCap});

  @override
  String toString() {
    return 'ExtratoFinanceiroEntity(diaId: $diaId, idSisPag: $idSisPag, idSisPagDetail: $idSisPagDetail, datLan: $datLan, datVen: $datVen, valLan: $valLan, tipLan: $tipLan, idConta: $idConta, contaDescricao: $contaDescricao, hisLan: $hisLan, codPla: $codPla, saldoAtual: $saldoAtual, saldoAnterior: $saldoAnterior, codCon: $codCon, nomCon: $nomCon, isCap: $isCap)';
  }
}
