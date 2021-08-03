import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AcordoEntity {
  final int numAco;
  final String unidade;
  final double valTax;
  final int totPar;
  final DateTime datAco;
  final dynamic tipAco;
  final String tipTax;
  final int codCon;
  final double valMul;
  final double valJur;
  final double valOut;
  final double valDes;
  final double valEnt;
  final double totAcordo;
  final double totAcordoPag;
  final double totAcordoAberto;
  final double totAcordoAVencer;
  final double saldoDevedor;
  final double valRet;
  final String tipAcoDescri;
  final String apelido;
  final String nomeCon;
  final String codImo;
  final int codOrd;
  final String nomPro;
  final String mesAno;
  final double valMen;
  final double valPag;
  final String histor;
  final DateTime datVen;
  final DateTime datPag;
  final DateTime datCre;
  final bool isTaxaOriginal;
  final bool isTaxaParcela;
  final bool isPago;

  const AcordoEntity({
    this.numAco,
    this.unidade,
    this.valTax,
    this.totPar,
    this.datAco,
    this.tipAco,
    this.codCon,
    this.valMul,
    this.valJur,
    this.valOut,
    this.valDes,
    this.valEnt,
    this.totAcordo,
    this.totAcordoPag,
    this.totAcordoAberto,
    this.totAcordoAVencer,
    this.saldoDevedor,
    this.apelido,
    this.nomeCon,
    this.valRet,
    this.tipAcoDescri,
    this.codImo,
    this.codOrd,
    this.nomPro,
    this.tipTax,
    this.mesAno,
    this.valMen,
    this.valPag,
    this.histor,
    this.datVen,
    this.datPag,
    this.datCre,
    this.isTaxaOriginal,
    this.isTaxaParcela,
    this.isPago,
  });
}
