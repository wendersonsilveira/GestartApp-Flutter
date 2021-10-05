import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_meses_entity.dart';
import 'package:Gestart/domain/usecases/contas/get_movimento_financeiro_meses_use_case.dart';
import 'package:Gestart/domain/usecases/contas/get_movimento_financeiro_use_case.dart';

import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'movimento_financeiro_controller.g.dart';

@Injectable()
class MovimentoFinanceiroController = _MovimentoFinanceiroControllerBase
    with _$MovimentoFinanceiroController;

abstract class _MovimentoFinanceiroControllerBase with Store {
  final _getMovFinanceiro = getIt.get<GetMovFinanceiroUseCase>();
  final _getMovFinanceiroMeses = getIt.get<GetMovFinanceiroMesesUseCase>();

  @observable
  ResourceData<List<MovFinanceiroEntity>> movimentacao;

  @observable
  ResourceData<List<MovFinanceiroMesesEntity>> meses;

  @observable
  int mesIndex = 0;

  @observable
  MovFinanceiroMesesEntity mesAtual;

  @observable
  double saldo = 0;

  int codCon;

  @computed
  int get statusPage => meses.status == Status.loading
      ? 0
      : meses.status == Status.success
          ? 1
          : 2;

  @action
  calcularSaldo() {
    saldo = 0;
    for (var item in movimentacao.data) {
      saldo += item.saldo;
    }
  }

  @action
  inserirMesAtual(index) {
    mesAtual = meses.data[index];
    mesIndex = index;
    getMovimentacao(mesAtual.mesAno);
  }

  @action
  mudarPeriodo(int inc) {
    if (mesIndex + inc >= 0 && mesIndex + inc < meses.data.length) {
      mesIndex += inc;
      mesAtual = meses.data[mesIndex];
      getMovimentacao(mesAtual.mesAno);
    }
  }

  @action
  Future getMovimentacao(String mesAno) async {
    movimentacao = ResourceData(status: Status.loading);
    codCon = await UIHelper.getStorageInt('codCon');
    movimentacao = await _getMovFinanceiro(
        MovFinanceiroEntity(codCon: codCon, mesAno: mesAno));
    calcularSaldo();
  }

  @action
  init() async {
    meses = ResourceData(status: Status.loading);
    movimentacao = ResourceData(status: Status.loading);
    codCon = await UIHelper.getStorageInt('codCon');
    meses = await _getMovFinanceiroMeses(codCon);
    if (meses.data != null)
      meses.data.sort((a, b) => a.datSal.isAfter(b.datSal) ? -1 : 1);

    mesAtual = meses.data[mesIndex];
    await getMovimentacao(mesAtual.mesAno);
  }
}
