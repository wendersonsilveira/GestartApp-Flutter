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

  @action
  getBoletos() async {
    boletos = await _getBoletos();
    listaView = boletos.data;
    changeDropdown(unidades.data[0].codord);
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
