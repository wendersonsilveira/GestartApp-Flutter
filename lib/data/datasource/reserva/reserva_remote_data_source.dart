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

  // Future<ResourceData> createPet(ReservaEntity reserva) async {
  //   try {
  //     final result = await _dio.post('pets', data: pet.toMap());
  //     return ResourceData(
  //         status: Status.success,
  //         data: null,
  //         message: 'Pet cadastrado com sucesso!');
  //   } on DioError catch (e) {
  //     return ResourceData(
  //         status: Status.failed,
  //         data: null,
  //         message: "Erro ao cadastra o pets",
  //         error: ErrorMapper.from(e));
  //   }
  // }

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

  // Future<ResourceData<PetEntity>> getPet(int id) async {
  //   try {
  //     final result = await _dio.get('pet/${id}');

  //     return ResourceData(
  //         status: Status.success,
  //         data: PetEntity().fromMap(result[0]),
  //         message: 'Pet econtrado!');
  //   } on DioError catch (e) {
  //     return ResourceData(
  //         status: Status.failed,
  //         data: null,
  //         message: "Erro ao listar o pets",
  //         error: ErrorMapper.from(e));
  //   }
  // }

  // Future<ResourceData> deletePet(int id) async {
  //   try {
  //     final result = await _dio.delete('pet/${id}');

  //     return ResourceData(status: Status.success, message: 'Pet deletado!');
  //   } on DioError catch (e) {
  //     return ResourceData(
  //         status: Status.failed,
  //         data: null,
  //         message: "Erro ao deletar o pets",
  //         error: ErrorMapper.from(e));
  //   }
  // }
}
