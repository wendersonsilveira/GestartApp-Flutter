import 'package:flutter/foundation.dart';

@immutable
class PagamentoEntity {
  final String unidade;
  final int codOrd;
  final int codCon;
  final String codImo;
  final String mesAno;
  final DateTime datVen;
  final DateTime datPag;
  final double valPag;
  final String histor;
  final DateTime datCre;
  final String nomCon;
  final DateTime dt1;
  final DateTime dt2;
  final String apelido;
  final String logo;
  final String linkPhoto;

  const PagamentoEntity({
    this.unidade,
    this.codOrd,
    this.codCon,
    this.codImo,
    this.mesAno,
    this.datVen,
    this.datPag,
    this.valPag,
    this.histor,
    this.datCre,
    this.nomCon,
    this.dt1,
    this.dt2,
    this.apelido,
    this.logo,
    this.linkPhoto,
  });
}
