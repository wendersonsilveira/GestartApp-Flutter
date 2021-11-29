import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';
import 'package:Gestart/data/mappers/boleto/boleto_mapper.dart';
import 'package:Gestart/data/mappers/boleto/detalhe_boleto_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ParcelamentoBoletoRemoteDataSource {
  Dio dio;
  ParcelamentoBoletoRemoteDataSource(this.dio);

  Future<ResourceData<String>> getLinkParcelamento(String identificador) async {
    try {
      final result = await dio.get(
          'http://condominioonline.gestartcondominios.com.br:8080/parcelamento/$identificador');
      print(result);
      // if (result.length > 0)
      //   return ResourceData<DetalheBoletoEntity>(
      //       status: Status.success,
      //       data: DetalheBoletoEntity().fromMap(result[0]));
      // else
      return ResourceData<String>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar o boleto",
          error: ErrorMapper.from(e));
    }
  }
}
