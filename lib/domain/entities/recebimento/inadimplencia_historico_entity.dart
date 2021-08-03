import 'package:flutter/foundation.dart';

@immutable
class HistoricoInadimEntity {
  final String historico;
  final DateTime datemi;
  final int codOrd;

  const HistoricoInadimEntity({
    this.historico,
    this.datemi,
    this.codOrd,
  });
}
