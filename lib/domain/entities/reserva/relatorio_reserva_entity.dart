import 'package:flutter/foundation.dart';

@immutable
class RelatorioReservaEntity {
  final int codcon;
  final int datini;
  final int datfim;
  final int status;


  const RelatorioReservaEntity({
    this.codcon,
    this.datini,
    this.datfim,
    this.status
  });
}
