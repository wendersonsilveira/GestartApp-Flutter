import 'package:flutter/foundation.dart';

@immutable
class TaxaEntity {
  final String tiptax;
  final String destax;

  const TaxaEntity({
    this.tiptax,
    this.destax,
  });

  String taxaAsString() {
    return '${this.tiptax} - ${this.destax}';
  }
}
