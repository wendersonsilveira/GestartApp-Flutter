import 'package:flutter/foundation.dart';

@immutable
class UnidadeInforEntity {
  final String codimo;
  final int codord;
  final String nompro;
  final int hasInquilino;
  final int hasUser;
  final int hasPets;
  final int hasVeiculos;

  const UnidadeInforEntity({
    this.codimo,
    this.codord,
    this.nompro,
    this.hasInquilino,
    this.hasUser,
    this.hasPets,
    this.hasVeiculos,   
  });

  @override
  String toString() {
    return 'UnidadeInforEntity(codimo: $codimo, codord: $codord, nompro: $nompro, hasInquilino: $hasInquilino, hasUser: $hasUser, hasPet: $hasPets, hasVeiculo: $hasVeiculos)';
  }

  String unidadeAsString() {
    return '${this.codimo} - ${this.nompro}';
  }

}
