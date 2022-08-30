import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_unidade_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'boleto_controller.g.dart';

@Injectable()
class BoletoController = _BoletoControllerBase with _$BoletoController;

abstract class _BoletoControllerBase with Store {
  final _getBoletos = getIt.get<GetBoletosUnidadeUseCase>();
  final _getUnidades = getIt.get<GetUnidadesUseCase>();

  @observable
  ResourceData<List<UnidadeEntity>> unidades;

  @observable
  List<BoletoEntity> listaView;
  @observable
  int status = 0;

  @observable
  ResourceData<List<BoletoEntity>> boletos =
      ResourceData(status: Status.loading);

  @observable
  int codOrd;

  @observable
  bool unidadeSelecionada = false;

  init() async {
    unidades = ResourceData(status: Status.loading);
    getUnidades();
  }

  @action
  Future<void> getBoletos(int codOrd) async {
    boletos = await _getBoletos(codOrd);
  }

  @action
  Future<void> getBoletoDetalhes(String conts) async {
    Modular.navigator.pushNamed(RouteName.boletosDetalhes, arguments: conts);
  }

  @action
  changeDropdown(int codOrd) {
    this.boletos = ResourceData<List<BoletoEntity>>(
      data: [],
      status: Status.loading,
    );
    getBoletos(codOrd);
  }

  @action
  Future<void> getUnidades() async {
    unidades = await _getUnidades();
  }
}
