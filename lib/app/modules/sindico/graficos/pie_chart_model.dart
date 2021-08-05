import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String descricao;
  double valor;
  // int financial;
  final charts.Color color;

  BarChartModel({
    this.descricao,
    this.valor,
    this.color,
  });
}
