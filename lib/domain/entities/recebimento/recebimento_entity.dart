import 'package:flutter/foundation.dart';

@immutable
class RecebimentoEntity {
  final int id;
  final int codOrd;
  final String unidade;
  final double valor;
  final String codimo;
  final String nomcon;
  final DateTime dt1;
  final DateTime dt2;
  final String apelido;
  final String logo;
  final String linkPhoto;

  const RecebimentoEntity({
    this.id,
    this.codOrd,
    this.unidade,
    this.valor,
    this.codimo,
    this.nomcon,
    this.dt1,
    this.dt2,
    this.apelido,
    this.logo,
    this.linkPhoto,
  });

  @override
  String toString() {
    return 'RecebimentoEntity(id: $id, codord: $codOrd, unidade: $unidade, valor: $valor, codimo: $codimo, nomcon: $nomcon)';
  }
}
