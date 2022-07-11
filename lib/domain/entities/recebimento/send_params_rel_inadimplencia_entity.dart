import 'package:flutter/foundation.dart';

@immutable
class SendParamsRelInadimplenciaEntity {
  final int codCon;
  final String codImo;
  final int codOrd;
  final String tipTax;
  final String tipCob;
  final String datIni;
  final String datFim;
  const SendParamsRelInadimplenciaEntity({
    this.codCon,
    this.codImo,
    this.codOrd,
    this.tipTax,
    this.tipCob,
    this.datIni,
    this.datFim,
  });
}
