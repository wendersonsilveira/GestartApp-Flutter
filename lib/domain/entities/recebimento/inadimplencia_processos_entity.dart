import 'package:flutter/foundation.dart';

@immutable
class ProcessoInadimplenciasEntity {
  final DateTime datEmi;
  final String numPro;
  final String nomFas;

  const ProcessoInadimplenciasEntity({
    this.datEmi,
    this.numPro,
    this.nomFas,
  });
}
