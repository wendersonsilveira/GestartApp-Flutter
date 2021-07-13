import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/reserva/horarios_espaco_mapper.dart';
import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class HorariosEspacoRemoteDataSource {
  CustomDio _dio;
  HorariosEspacoRemoteDataSource(this._dio);

  Future<ResourceData<List<HorarioEspacoEntity>>> getHorariosEspaco(
      int espacoId, String data) async {
    try {
      final result = await _dio.get('reservas-espaco-data/$espacoId/$data');

      return ResourceData(
          status: Status.success,
          data: HorarioEspacoEntity().fromMapList(result),
          message: 'Horários encontrados com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar horários",
          error: ErrorMapper.from(e));
    }
  }
}
