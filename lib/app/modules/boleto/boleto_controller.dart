import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
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
  final _getCondominios = getIt.get<GetCondominiosAtivosUseCase>();
  final _getBoletos = getIt.get<GetBoletosUseCase>();
  final _getUnidades = getIt.get<GetUnidadesUseCase>();

  @observable
  ResourceData<List<UnidadeEntity>> unidades;

  @observable
  List<BoletoEntity> listaView;

  @observable
  ResourceData<List<BoletoEntity>> boletos;

  init() async {
    unidades = ResourceData(status: Status.loading);
    await getUnidades();
    getBoletos();
  }

  int codOrd;

  @action
  getBoletos() async {
    boletos = await _getBoletos();
    listaView = boletos.data;
    var storage = await SharedPreferences.getInstance();
    int cod = storage.getInt('codord');
    if (codOrd == null) {
      if (cod != null) {
        codOrd = cod;
      } else {
        codOrd = listaView[0].codord;
      }
    } else {
      codOrd = listaView[0].codord;
    }
    changeDropdown(codOrd);
  }

  @action
  changeDropdown(int codOrd) =>
      listaView = boletos.data.where((i) => i.codord == codOrd).toList();

  @action
  Future<void> getUnidades() async {
    unidades = await _getUnidades();
    print('teste');
  }
}
