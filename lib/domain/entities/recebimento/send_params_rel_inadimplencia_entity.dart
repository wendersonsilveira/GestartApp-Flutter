import 'package:flutter/foundation.dart';

@immutable
class SendParamsRelInadimplenciaEntity {
  final int codCon;
  final String codImo;
  final int codOrd;
  final List<String> tipTax;
  final String tipCob;
  final String datIni;
  final String datFim;
  final String tipo;
  final String usrName;
  final String usrLastname;
  const SendParamsRelInadimplenciaEntity({
    this.codCon,
    this.codImo,
    this.codOrd,
    this.tipTax,
    this.tipCob,
    this.datIni,
    this.tipo,
    this.datFim,
    this.usrName,
    this.usrLastname,
  });
}
