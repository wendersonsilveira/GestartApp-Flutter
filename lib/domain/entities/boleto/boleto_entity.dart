import 'package:flutter/foundation.dart';

@immutable
class BoletoEntity {
  final int id;
  final String identificador;
  final DateTime datven;
  final DateTime datemi;
  final double valtot;
  final String nompro;
  final int codcon;
  final String nomcon;
  final int codord;
  final String codimo;
  final String titcob;
  final String endcob;
  final String apelido;
  final String logo;
  final String mesAno;
  final String lansDetail;
  final String status;
  final String conts;
  final double total;
  final String linhaDigitavel;
  final String linkBoleto;

  const BoletoEntity(
      {this.id,
      this.identificador,
      this.datven,
      this.datemi,
      this.valtot,
      this.nompro,
      this.codcon,
      this.nomcon,
      this.codord,
      this.codimo,
      this.titcob,
      this.endcob,
      this.apelido,
      this.mesAno,
      this.lansDetail,
      this.status,
      this.conts,
      this.total,
      this.linhaDigitavel,
      this.linkBoleto,
      this.logo});

  @override
  String toString() {
    return 'PautaEntity(codcon: $codcon)';
  }
}
