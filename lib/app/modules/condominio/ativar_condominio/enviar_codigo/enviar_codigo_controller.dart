import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/emails_ativacao_entity.dart';
import 'package:Gestart/domain/usecases/condominio/gerar_codigo_ativacao_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_emails_ativacao_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'enviar_codigo_controller.g.dart';

@Injectable()
class EnviarCodigoController = _EnviarCodigoControllerBase
    with _$EnviarCodigoController;

abstract class _EnviarCodigoControllerBase with Store {
  final _emails = getIt.get<GetEmailAtivacaoUseCase>();
  final _gerarCodigo = getIt.get<GerarCodigoAtivacaoUseCase>();

  @observable
  ResourceData<List<EmailAtivacaoEntity>> emails;

  @observable
  ResourceData<int> statusGeracaoCodigo = ResourceData(status: Status.success);

  @action
  getEmails() async {
    emails = ResourceData(status: Status.loading);
    emails = await _emails();
  }

  @action
  Future<int> gerarCodigo(int idEmail) async {
    statusGeracaoCodigo = ResourceData(status: Status.loading);
    statusGeracaoCodigo = await _gerarCodigo(idEmail);
    return statusGeracaoCodigo.data;
  }
}
