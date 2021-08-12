import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'boleto_controller.g.dart';

@Injectable()
class BoletoController = _BoletoControllerBase with _$BoletoController;

abstract class _BoletoControllerBase with Store {
  final _getBoletos = getIt.get<GetBoletosUseCase>();
  final _getUnidades = getIt.get<GetUnidadesUseCase>();

  @observable
  ResourceData<List<UnidadeEntity>> unidades;

  @observable
  List<BoletoEntity> listaView;
  @observable
  int status = 0;

  @observable
  ResourceData<List<BoletoEntity>> boletos;

  @observable
  int codOrd;

  init() async {
    unidades = ResourceData(status: Status.loading);
    await getUnidades();
    getBoletos();
  }

  @action
  setarStatus(value) => status = value;

  @action
  getBoletos() async {
    boletos = await _getBoletos();

    var storage = await SharedPreferences.getInstance();
    int cod = storage.getInt('codord');
    if (codOrd == null) {
      if (cod != null) {
        codOrd = cod;
      } else {
        codOrd = unidades.data[0].codord;
      }
    } else {
      codOrd = unidades.data[0].codord;
    }
    changeDropdown(codOrd);
  }

  @action
  changeDropdown(int codOrd) {
    listaView = boletos.data.where((i) => i.codord == codOrd).toList();
    setarStatus(1);
  }

  @action
  Future<void> getUnidades() async {
    unidades = await _getUnidades();
  }
}
