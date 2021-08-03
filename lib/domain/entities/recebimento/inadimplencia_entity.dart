import 'package:flutter/foundation.dart';

@immutable
class InadimplenciaEntity {
  final String unidade;
  final double valor;
  final int codOrd;
  final int codCon;
  final double multa;
  final double total;
  final String tipCob;
  final String tipcobDescri;
  final String apelido;
  final String logo;
  final String linkPhoto;
  //detalhes
  final DateTime datVen;
  final String histor;
  final DateTime datEmi;
  final String mesano;
  final int idConta;
  final double valMul;
  final double valJur;
  final double valDes;
  final int diasMulta;

  const InadimplenciaEntity({
    this.unidade,
    this.valor,
    this.codOrd,
    this.codCon,
    this.multa,
    this.total,
    this.tipCob,
    this.tipcobDescri,
    this.apelido,
    this.logo,
    this.linkPhoto,
    this.datVen,
    this.histor,
    this.datEmi,
    this.mesano,
    this.idConta,
    this.valMul,
    this.valJur,
    this.valDes,
    this.diasMulta,
  });
}
