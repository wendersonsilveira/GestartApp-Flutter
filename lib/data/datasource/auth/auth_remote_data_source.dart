import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/utils/app_exception.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDataSource {
  CustomDio _dio;
  AuthRemoteDataSource(this._dio);

  Future<ResourceData<int>> checkUser(String cpfCnpj) async {
    try {
      final result = await _dio.post('login-check', data: {"USUARIO": cpfCnpj});

      return ResourceData<int>(status: Status.success, data: result['status']);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar usuario",
          error: ErrorMapper.from(e));
    }
  }
}
