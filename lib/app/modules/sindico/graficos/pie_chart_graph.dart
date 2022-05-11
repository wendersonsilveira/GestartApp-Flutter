import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'pie_chart_model.dart';

class BarChartGraph extends StatefulWidget {
  final List<BarChartModel> data;
  final bool horizontalFirst;
  const BarChartGraph({Key key, this.data, this.horizontalFirst = false})
      : super(key: key);

  @override
  _BarChartGraphState createState() => _BarChartGraphState();
}

class _BarChartGraphState extends State<BarChartGraph> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
          id: "Contas",
          data: widget.data,
          domainFn: (BarChartModel series, _) => series.descricao,
          measureFn: (BarChartModel series, _) => series.valor,
          colorFn: (BarChartModel series, _) => series.color),
    ];

    return _buildFinancialList(series);
  }

  Widget _buildFinancialList(series) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Expanded(
              child: charts.PieChart(
            series,
            animate: true,
            behaviors: [new charts.DatumLegend(horizontalFirst: false)],
          )),
        ],
      ),
    );
  }
}
