import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/usecases/condominio/send_codigo_ativacao_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'codigo_ativacao_controller.g.dart';

@Injectable()
class CodigoAtivacaoController = _CodigoAtivacaoControllerBase
    with _$CodigoAtivacaoController;

abstract class _CodigoAtivacaoControllerBase with Store {
  final _sendCodigoAtivacao = getIt.get<SendCodigoAtivacao>();

  @observable
  ResourceData ativacao = ResourceData(status: Status.success);

  Future<int> ativar(String codigo) async {
    ativacao = ResourceData(status: Status.loading);
    ativacao = await _sendCodigoAtivacao(codigo);
    return ativacao.data;
  }
}
