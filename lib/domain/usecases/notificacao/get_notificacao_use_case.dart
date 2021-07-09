import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/entities/notificacao/notificacao_entity.dart';
import 'package:Gestart/domain/repositories/notificacao/notificacao_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNotificacaoUseCase
    extends BaseFutureUseCase<void, ResourceData<List<NotificacaoEntity>>> {
  NotificacaoRepository _notificacaoRepository;

  GetNotificacaoUseCase(this._notificacaoRepository);

  @override
  Future<ResourceData<List<NotificacaoEntity>>> call([void entity]) {
    return _notificacaoRepository.getNotificacao();
  }
}
