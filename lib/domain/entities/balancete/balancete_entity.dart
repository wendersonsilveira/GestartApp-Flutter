import 'package:flutter/foundation.dart';

@immutable
class BalanceteEntity {
  final int id;
  final int codcon;
  final String mesAno;
  final String mesAnoAnterior;
  final DateTime dt1;
  final String mesTxt;
  final DateTime dt2;
  final String linkBalanceteAna;
  final String linkBalanceteSin;
  final String apelido;
  final String logo;
  final DateTime datEmi6;
  final DateTime datEmi8;
  final bool contasPagar;
  final String linkBalanceteDigital;
  final int balanceteDigital;
  final int balancete;
  final int balanceteDigitalArquivo;
  final int versao;
  final String tipo;

  const BalanceteEntity({
    this.id,
    this.codcon,
    this.mesAno,
    this.mesAnoAnterior,
    this.dt1,
    this.mesTxt,
    this.dt2,
    this.linkBalanceteAna,
    this.linkBalanceteSin,
    this.apelido,
    this.logo,
    this.datEmi6,
    this.datEmi8,
    this.contasPagar,
    this.linkBalanceteDigital,
    this.balanceteDigital,
    this.balancete,
    this.balanceteDigitalArquivo,
    this.versao,
    this.tipo,
  });

  // @override
  // String toString() {
  //   return 'BalanceteEntity(id: $id)';
  // }
}
