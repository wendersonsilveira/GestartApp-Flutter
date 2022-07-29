import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_unidade_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/utils/status.dart';

part 'boletos_unidade_controller.g.dart';

@Injectable()
class BoletosUnidadeController = _BoletosUnidadeControllerBase
    with _$BoletosUnidadeController;

abstract class _BoletosUnidadeControllerBase with Store {
  int params;
  final _getBoletos = getIt.get<GetBoletosUnidadeUseCase>();

  @observable
  ResourceData<List<BoletoEntity>> boletos =
      ResourceData(status: Status.loading);

  init(int params) async {
    await getBoletos(params);
  }

  void getBoletosDetalhes(String conts) {
    Modular.navigator.pushNamed(RouteName.boletosDetalhes, arguments: conts);
  }

  @action
  Future<void> getBoletos(int params) async {
    boletos = await _getBoletos(params);
    print(boletos);
  }
}
