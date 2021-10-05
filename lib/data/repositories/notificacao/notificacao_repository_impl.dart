import 'package:Gestart/data/datasource/notificacao/notificacao_data_source.dart';
import 'package:Gestart/domain/entities/notificacao/notificacao_entity.dart';
import 'package:Gestart/domain/repositories/notificacao/notificacao_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class NotificacaoRepositoryImpl implements NotificacaoRepository {
  NotificacaoRemoteDataSource _notificacaoRemoteDataSource;

  NotificacaoRepositoryImpl(this._notificacaoRemoteDataSource);

  @override
  Future<ResourceData<List<NotificacaoEntity>>> getNotificacao() async {
    final resource = await _notificacaoRemoteDataSource.getNotificacao();

    return resource;
  }

  @override
  Future<ResourceData> sendLog(String log) async {
    final resource = await _notificacaoRemoteDataSource.sendLog(log);

    return resource;
  }
}
