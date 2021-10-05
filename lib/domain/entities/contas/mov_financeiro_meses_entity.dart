import 'package:flutter/foundation.dart';

@immutable
class MovFinanceiroMesesEntity {
  final DateTime datSal;
  final String mesAno;

  MovFinanceiroMesesEntity({
    this.datSal,
    this.mesAno,
  });

  @override
  String toString() => 'MovFinanceiroEntity(datSal: $datSal, mesAno: $mesAno)';
}
