import 'package:flutter/foundation.dart';

@immutable
class InadimplenciaAdmEntity {
  final int codCon;
  final String codImo;
  final int codOrd;
  final String nomPro;
  final double valMen;
  final double valPag;
  final double multa;
  final double total;
  final String tipCob;
  final String tipCobDes;
  final int condomTipId;
  final String negativado;
  final bool negativadoInt;
  final String processado;
  final bool processadoInt;

  const InadimplenciaAdmEntity({
    this.negativadoInt,
    this.processadoInt,
    this.codCon,
    this.codImo,
    this.codOrd,
    this.nomPro,
    this.valMen,
    this.valPag,
    this.multa,
    this.total,
    this.tipCob,
    this.tipCobDes,
    this.condomTipId,
    this.negativado,
    this.processado,
  });
}
