import 'package:Gestart/domain/entities/contas/extrato_financeiro_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/usecases/contas/get_extrato_financeiro_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/di/di.dart';

part 'detalhe_movimento_controller.g.dart';

@Injectable()
class DetalheMovimentoController = _DetalheMovimentoControllerBase
    with _$DetalheMovimentoController;

abstract class _DetalheMovimentoControllerBase with Store {
  final _getExtratoFinanceiroMeses = getIt.get<GetExtratoFinanceiroUseCase>();

  @observable
  ResourceData<List<ExtratoFinanceiroEntity>> dados;
  @observable
  List<ExtratoFinanceiroEntity> extrato = [];
  @observable
  List<ExtratoFinanceiroEntity> extratoVazio = [];
  @observable
  ExtratoFinanceiroEntity saldoAnterior;
  @observable
  double saldo;

  @observable
  bool status = false;

  @observable
  var extratoDia = [];

  @action
  init(MovFinanceiroEntity entity) async {
    dados = ResourceData(status: Status.loading);
    dados = await _getExtratoFinanceiroMeses(MovFinanceiroEntity(
        codCon: entity.codCon, mesAno: entity.mesAno, idConta: entity.idConta));
    await ajustarExtrato();
  }

  ajustarExtrato() {
    for (var item in dados.data) {
      if (item.diaId != null && item.diaId >= 0)
        extrato.add(item);
      else
        extratoVazio.add(item);
    }

    if (extrato.length > 0) {
      saldoAnterior = extrato[0];
      saldo = extrato[0].saldoAnterior != null ? extrato[0].saldoAnterior : 0;
      var saldoE =
          extrato[0].saldoAnterior != null ? extrato[0].saldoAnterior : 0;

      for (var lan in extrato) {
        if (lan.idSisPagDetail == 0) {
          saldo = saldo + lan.valLan;
          lan.saldoAtual = saldo;
        }
      }
      var saldoDia = 0.0;
      saldoDia =
          extrato.fold(saldoDia, (value, element) => value + element.valLan);

      extrato.forEach((element) {
        if (element.idSisPagDetail == 0) {
          var index = extratoDia.indexWhere((e) =>
              e['DIA_ID'] == element.diaId && e['DATLAN'] == element.datLan);

          if (index == -1) {
            extratoDia.add({
              "DIA_ID": element.diaId,
              "DATLAN": element.datLan,
              "SALDO_DIA": saldoDia
            });
          }
        }
      });
      var saldoDiaParcial =
          saldoAnterior.saldoAnterior != null ? saldoAnterior.saldoAnterior : 0;
      extratoDia.forEach((dia) {
        saldoDiaParcial += dia['SALDO_DIA'];
        dia['SALDO_DIA'] = saldoDiaParcial;
        dia['lans'] = extrato
            .where((element) =>
                element.idSisPagDetail == 0 && element.diaId == dia['DIA_ID'])
            .toList();

        dia['lans'].forEach((lan) {
          if (lan.idSisPag == 1)
            lan.sisPags.add(extrato
                .where((element) =>
                    element.idSisPagDetail == 1 && element.diaId == lan.diaId)
                .toList());
        });
      });
      for (var i = 0; i < extratoDia.length; i++) {
        if (i == 0) {
          extratoDia[i]['SALDO_DIA'] = extratoDia[i]['lans']
              .fold(saldoE, (value, element) => value + element.valLan);
        } else {
          extratoDia[i]['SALDO_DIA'] = extratoDia[i]['lans'].fold(
              extratoDia[i - 1]['SALDO_DIA'],
              (value, element) => value + element.valLan);
        }
      }
      extratoDia = extratoDia;
    }
    status = true;
  }
}
