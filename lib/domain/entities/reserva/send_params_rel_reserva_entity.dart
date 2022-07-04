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
  final String usr_name;
  final String usr_lastname;
  const SendParamsRelReservaEntity(
      {this.codCon,
      this.codimo,
      this.espaco,
      this.status,
      this.dataIni,
      this.tipo = null,
      this.usr_name = null,
      this.usr_lastname = null,
      this.dataFim});
}
