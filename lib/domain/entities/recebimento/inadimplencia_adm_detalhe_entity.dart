import 'package:flutter/foundation.dart';

@immutable
class InadimplenciaAdmDetalheEntity {
  final String mesAno;
  final DateTime datVen;
  final double valMen;
  final double multa;
  final double total;
  final String histor;

  const InadimplenciaAdmDetalheEntity(
      {this.mesAno,
      this.datVen,
      this.valMen,
      this.multa,
      this.total,
      this.histor});
}
