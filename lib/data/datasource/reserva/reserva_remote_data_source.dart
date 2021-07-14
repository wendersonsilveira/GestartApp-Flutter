import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/reserva/reserva_mapper.dart';
import 'package:Gestart/data/mappers/reserva/hora_mapper.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReservaRemoteDataSource {
  CustomDio _dio;
  ReservaRemoteDataSource(this._dio);
  Future<ResourceData<List<ReservaEntity>>> getReservas() async {
    try {
      final result = await _dio.get('reservas');

      return ResourceData(status: Status.success, data: ReservaEntity().fromMapList(result), message: 'Pet cadastrado com sucesso!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao cadastra o pets", error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<HoraEntity>>> getHoras() async {
    try {
      final result = await _dio.get('horarios');

      return ResourceData(status: Status.success, data: HoraEntity().fromMapList(result), message: 'Horários encontrados com sucesso!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao listar Horários", error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> criarReserva(d) async {
    try {
      await _dio.post('reserva', data: d);

      return ResourceData(status: Status.success, data: null, message: 'Reserva realzada!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao fazer reserva", error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> cancelarReserva(int id) async {
    try {
      await _dio.post('cancelar-reserva/$id');

      return ResourceData(status: Status.success, data: null, message: 'Reserva cancelada!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao cancelar reserva", error: ErrorMapper.from(e));
    }
  }
}
