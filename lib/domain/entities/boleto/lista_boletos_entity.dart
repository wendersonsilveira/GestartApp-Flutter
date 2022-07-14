import 'package:flutter/foundation.dart';

@immutable
class ListaBoletosEntity {
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

  const ListaBoletosEntity(
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
      this.logo});

  @override
  String toString() {
    return 'PautaEntity(codcon: $codcon)';
  }
}
