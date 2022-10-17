import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_doc_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'segunda_via_controller.g.dart';

@Injectable()
class SegundaViaController = _SegundaViaControllerBase
    with _$SegundaViaController;

abstract class _SegundaViaControllerBase with Store {

  @observable
  bool hasFaturas = false;

  @observable
  bool checked = false;

  @observable
  var _getBoletos = getIt.get<GetBoletosDocUseCase>();

  @observable
  ResourceData<List<BoletoEntity>> boletos = ResourceData(status: Status.success, data: []);


  init(String cpfCnpj) {
  }

  @action
  Future<void> getBoletos(String cpfCnpj) async {
    boletos = ResourceData(status: Status.loading);
    boletos = await _getBoletos(cpfCnpj);
    if (boletos.data.isNotEmpty) hasFaturas = true;
    checked = true;
  }

  @action
  Future<void> checkPage() {
  }

  @observable
  ResourceData<int> loadingCheck = ResourceData(status: Status.success);

  @observable
  ResourceData<UserEntity> userLogin = ResourceData(status: Status.success);
}
