import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/data/mappers/feed/feed_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeedRemoteDataSource {
  CustomDio _dio;
  FeedRemoteDataSource(this._dio);

  Future<ResourceData<List<FeedEntity>>> getInformacoes() async {
    try {
      final result = await _dio.get('feed');
      if (result.length > 0)
        return ResourceData<List<FeedEntity>>(
            status: Status.success, data: FeedEntity().fromMapList(result));
      else
        return ResourceData<List<FeedEntity>>(status: Status.success, data: []);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: [],
          message: "Erro ao listar as informações",
          error: ErrorMapper.from(e));
      //
    }
  }

  Future<ResourceData<List<FeedEntity>>> getComunicadosCondom(int codcon) async {
    try {
      final result = await _dio.get('condom_feed/$codcon');
      if (result.length > 0)
        return ResourceData<List<FeedEntity>>(
            status: Status.success, data: FeedEntity().fromMapList(result));
      else
        return ResourceData<List<FeedEntity>>(status: Status.success, data: []);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: [],
          message: "Erro ao listar as informações",
          error: ErrorMapper.from(e));
      //
    }
  }

  Future<ResourceData<FeedEntity>> getAviso(int id) async { 
    try {
      final result = await _dio.get('aviso/$id');
      if (result.length > 0)
        return ResourceData<FeedEntity>(
            status: Status.success, data: FeedEntity().fromMap(result[0]));
      else
        return ResourceData<FeedEntity>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar o aviso",
          error: ErrorMapper.from(e));
    }
  }
}
