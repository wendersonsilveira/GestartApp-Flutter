import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/usecases/contas/get_contas_use_case.dart';
import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:Gestart/app/utils/ui_helper.dart';

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

  int codCon;
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
    print(tipos);
  }
}
