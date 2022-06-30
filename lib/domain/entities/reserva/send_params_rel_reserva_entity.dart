import 'package:flutter/foundation.dart';

@immutable
class SendParamsRelReservaEntity {
  final int codCon;
  final String codimo;
  final String espaco;
  final int status;
  final String dataIni;
  final String dataFim;
  final String tipo;
  const SendParamsRelReservaEntity(
      {this.codCon,
      this.codimo,
      this.espaco,
      this.status,
      this.dataIni,
      this.tipo = null,
      this.dataFim});
}
