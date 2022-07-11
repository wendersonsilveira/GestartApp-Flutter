import 'package:flutter/foundation.dart';

@immutable
class SendParamsRelInadimplenciaEntity {
  final int codCon;
  final String codImo;
  final String tipTax;
  final String tipCob;
  final String datIni;
  final String datFim;
  const SendParamsRelInadimplenciaEntity({
    this.codCon,
    this.tipTax,
    this.codImo,
    this.tipCob,
    this.datIni,
    this.datFim,
  });
}
