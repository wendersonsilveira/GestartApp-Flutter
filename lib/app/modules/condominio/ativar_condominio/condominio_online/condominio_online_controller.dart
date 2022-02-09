import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/usecases/condominio/ativar_condominio_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/di/di.dart';

part 'condominio_online_controller.g.dart';

@Injectable()
class CondominioOnlineController = _CondominioOnlineControllerBase
    with _$CondominioOnlineController;

abstract class _CondominioOnlineControllerBase with Store {
  final _ativarCondominio = getIt.get<AtivarCondominioUseCase>();

  @observable
  ResourceData<int> statusAtivacao = ResourceData(status: Status.success);

  @observable
  ResourceData<int> status;

  @action
  Future<ResourceData<int>> ativarCondominio(
      LoginAuthEntity credenciais) async {
    statusAtivacao = ResourceData(status: Status.loading);
    statusAtivacao = await _ativarCondominio(credenciais);
    return statusAtivacao;
  }
}
