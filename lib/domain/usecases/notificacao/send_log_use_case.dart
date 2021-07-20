import 'package:Gestart/domain/repositories/notificacao/notificacao_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendLogUseCase extends BaseFutureUseCase<String, ResourceData> {
  NotificacaoRepository _notificacaoRepository;

  SendLogUseCase(this._notificacaoRepository);

  @override
  Future<ResourceData> call([String log]) {
    return _notificacaoRepository.sendLog(log);
  }
}
