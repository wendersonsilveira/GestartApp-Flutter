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
}
