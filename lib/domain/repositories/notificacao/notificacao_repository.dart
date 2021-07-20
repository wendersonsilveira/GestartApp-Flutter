import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/entities/notificacao/notificacao_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class NotificacaoRepository {
  Future<ResourceData<List<NotificacaoEntity>>> getNotificacao();
  Future<ResourceData> sendLog(String log);
}
