import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/usecases/contas/get_contas_use_case.dart';
import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:Gestart/app/modules/sindico/graficos/pie_chart_model.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:charts_flutter/flutter.dart' as charts;

part 'contas_fixas_controller.g.dart';

@Injectable()
class ContasFixasController = _ContasFixasControllerBase
    with _$ContasFixasController;

abstract class _ContasFixasControllerBase with Store {
  final _getContas = getIt.get<GetContasUseCase>();

  @observable
  ResourceData<List<ContasEntity>> contas;

  @observable
  List<ContasEntity> tipos = [];
  List<Color> cores = [
    Colors.red,
    Color(0xFF47505F),
    Colors.green,
    Colors.yellow,
    Colors.lightBlueAccent,
    Colors.pink
  ];
  final List<BarChartModel> data = [];
  int codCon;

  @observable
  double totalCategorias = 0.0;
  @action
  init() async {
    contas = ResourceData(status: Status.loading);
    codCon = await UIHelper.getStorageInt('codCon');
    contas = await _getContas(codCon);
    inserirTipos();
  }

  @action
  inserirTipos() {
    for (var conta in contas.data) {
      int index = tipos.indexWhere((element) => element.nomCla == conta.nomCla);
      if (index == -1) tipos.add(conta);
    }
    somarTotalCategoria();
    abastecerGrafigo();
  }

  abastecerGrafigo() {
    var index = 0;
    for (var tipo in tipos) {
      index++;
      data.add(BarChartModel(
        descricao: tipo.nomCla,
        valor: tipo.totalCategoria,
        color: charts.ColorUtil.fromDartColor(cores[index]),
      ));
    }
    debugPrint('Lista Data: ***' + data.length.toString());
  }

  @action
  somarTotalCategoria() {
    for (var tipo in tipos) {
      for (var item in contas.data) {
        if (item.nomCla == tipo.nomCla) {
          tipo.totalCategoria += item.valCon;
        }
      }
      totalCategorias += tipo.totalCategoria;
    }
  }
}
