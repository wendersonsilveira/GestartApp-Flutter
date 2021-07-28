import 'package:flutter/foundation.dart';

@immutable
class TipoTaxaEntity {
  final String tipTax;
  final String desTax;
  final int qtde;

  const TipoTaxaEntity({
    this.tipTax,
    this.desTax,
    this.qtde,
  });

  // @override
  // String toString() {
  //   return 'TipoTaxaEntity(id: $id, codord: $codOrd, unidade: $unidade, valor: $valor, codimo: $codimo, nomcon: $nomcon)';
  // }
}
