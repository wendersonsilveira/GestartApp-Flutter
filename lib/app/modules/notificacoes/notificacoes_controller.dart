import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/notificacao/notificacao_entity.dart';
import 'package:Gestart/domain/usecases/notificacao/get_notificacao_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'notificacoes_controller.g.dart';

@Injectable()
class NotificacoesController = _NotificacoesControllerBase
    with _$NotificacoesController;

abstract class _NotificacoesControllerBase with Store {
  final _getNotificacao = getIt.get<GetNotificacaoUseCase>();

  @observable
  ResourceData<List<NotificacaoEntity>> notificacoes;

  init() async {
    notificacoes = ResourceData(status: Status.loading);
    notificacoes = await _getNotificacao();
    print(notificacoes.data);
  }
}
