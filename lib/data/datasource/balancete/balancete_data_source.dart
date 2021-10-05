import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/data/mappers/balancete/balancete_mapper.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class BalanceteRemoteDataSource {
  CustomDio _dio;
  BalanceteRemoteDataSource(this._dio);

  Future<ResourceData<List<BalanceteEntity>>> getBalancetes() async {
    try {
      final result = await _dio.get('balancetes');

      return ResourceData(status: Status.success, data: BalanceteEntity().fromMapList(result), message: 'Balancete listados com sucesso!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao listar balancetes", error: ErrorMapper.from(e));
    }
  }
}
