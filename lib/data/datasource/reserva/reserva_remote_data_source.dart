import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/reserva/reserva_mapper.dart';
import 'package:Gestart/data/mappers/reserva/hora_mapper.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/data/mappers/reserva/send_params_rel_reserva_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReservaRemoteDataSource {
  CustomDio _dio;
  ReservaRemoteDataSource(this._dio);

  Future<ResourceData<List<ReservaEntity>>> getReservasRelatorio(
      SendParamsRelReservaEntity params) async {
    try {
      final result = await _dio.post('get_reservas', data: params.toMap());

      return ResourceData(
          status: Status.success,
          data: ReservaEntity().fromMapList(result),
          message: 'Reservas listadas com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao buscar as reservas",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<dynamic>> getReservasRelatorioPDF(
      SendParamsRelReservaEntity params) async {
    try {
      final result =
          await _dio.get('get_reservas', queryParameters: params.toMap());

      return ResourceData(
          status: Status.success,
          data: result,
          message: 'Reservas listadas com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao buscar as reservas",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<ReservaEntity>>> getReservas() async {
    try {
      final result = await _dio.get('reservas');

      return ResourceData(
          status: Status.success,
          data: ReservaEntity().fromMapList(result),
          message: 'Reservas listadas com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao cadastra o pets",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<ReservaEntity>>> getReservasAdm(int codCon) async {
    try {
      final result = await _dio.get('adm-reservas/$codCon');

      return ResourceData(
          status: Status.success,
          data: ReservaEntity().fromMapList(result),
          message: 'Lista de reservas adm');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as reservas",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<ReservaEntity>> getReserva(int idReserva) async {
    try {
      final result = await _dio.get('reserva/$idReserva');

      return ResourceData(
          status: Status.success, data: ReservaEntity().fromMap(result[0]));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar a reserva",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<ReservaEntity>> getReservaAdm(int idReserva) async {
    try {
      final result = await _dio.get('adm-reserva/$idReserva');
      if (result.length > 0)
        return ResourceData(
            status: Status.success,
            data: ReservaEntity().fromMap(result[0]),
            message: 'Reserva Adm');
      else
        return ResourceData(
            status: Status.success, data: null, message: 'Reserva Adm');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar a reserva",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> aprovarReservar(int reservaId) async {
    try {
      await _dio.post('aprovar-reserva/$reservaId');

      return ResourceData(
          status: Status.success, message: 'Reserva aprovada com sucesso');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao aprovar a reserva",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> rejeitarReservar(int reservaId) async {
    try {
      await _dio.post('rejeitar-reserva/$reservaId');

      return ResourceData(
          status: Status.success, message: 'Reserva rejeitada com sucesso');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao rejeitar a reserva",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<HoraEntity>>> getHoras() async {
    try {
      final result = await _dio.get('horarios');

      return ResourceData(
          status: Status.success,
          data: HoraEntity().fromMapList(result),
          message: 'Horários encontrados com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar Horários",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> criarReserva(d) async {
    try {
      await _dio.post('reserva', data: d);

      return ResourceData(
          status: Status.success, data: null, message: 'Reserva realizada!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao fazer reserva",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> cancelarReserva(int id) async {
    try {
      await _dio.post('cancelar-reserva/$id');

      return ResourceData(
          status: Status.success, data: null, message: 'Reserva cancelada!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao cancelar reserva",
          error: ErrorMapper.from(e));
    }
  }
}
