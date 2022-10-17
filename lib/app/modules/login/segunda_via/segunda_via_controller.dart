import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_doc_use_case.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_unidade_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_doc_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'segunda_via_controller.g.dart';

@Injectable()
class SegundaViaController = _SegundaViaControllerBase
    with _$SegundaViaController;

abstract class _SegundaViaControllerBase with Store {
  final _getBoletos = getIt.get<GetBoletosUnidadeUseCase>();
  final _getUnidades = getIt.get<GetUnidadesDocUseCase>();

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

  @observable
  ResourceData<List<UnidadeEntity>> unidades;

  @observable
  bool checked = false;

  init(String cpfCnpj) {
    // unidades = ResourceData(status: Status.loading);
    // getUnidades(cpfCnpj);
  }

  void check() {
    checked = true;
  }

  @action
  Future<void> getBoletos(int codOrd) async {
    boletos = await _getBoletos(codOrd);
    print(boletos);
  }

  @action
  Future<void> getUnidades(String cpfCnpj) async {
    unidades = await _getUnidades(cpfCnpj);
    print(unidades);
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
}
