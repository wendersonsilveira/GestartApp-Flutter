import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/notificacao/notificacao_mapper.dart';
import 'package:Gestart/domain/entities/notificacao/notificacao_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificacaoRemoteDataSource {
  CustomDio _dio;
  NotificacaoRemoteDataSource(this._dio);

  Future<ResourceData<List<NotificacaoEntity>>> getNotificacao() async {
    try {
      final result = await _dio.get('notificacoes');
      if (result.length > 0)
        return ResourceData<List<NotificacaoEntity>>(
            status: Status.success,
            data: NotificacaoEntity().fromMapList(result));
      else
        return ResourceData<List<NotificacaoEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as notificações",
          error: ErrorMapper.from(e));
    }
  }
}
