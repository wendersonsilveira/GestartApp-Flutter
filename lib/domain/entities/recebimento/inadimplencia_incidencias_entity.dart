import 'package:flutter/foundation.dart';

@immutable
class IncidenciaInadimplenciasEntity {
  final String nomTip;
  final DateTime datInc;
  final DateTime datDis;
  final double valDiv;
  final String nomCar;
  final String numDoc;

  const IncidenciaInadimplenciasEntity(
      {this.nomTip,
      this.datInc,
      this.datDis,
      this.valDiv,
      this.nomCar,
      this.numDoc});
}
