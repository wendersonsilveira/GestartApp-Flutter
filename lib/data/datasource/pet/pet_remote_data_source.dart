import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/data/mappers/pet/pet_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class PetRemoteDataSource {
  CustomDio _dio;
  PetRemoteDataSource(this._dio);

  Future<ResourceData> createPet(PetEntity pet) async {
    try {
      final result = await _dio.post('pets', data: pet.toMap());

      print(result);

      return ResourceData(
          status: Status.success,
          data: null,
          message: 'Pet cadastrado com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao cadastra o pets",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<PetEntity>>> getPets() async {
    try {
      final result = await _dio.get('pets');

      return ResourceData(
          status: Status.success,
          data: PetEntity().fromMapList(result),
          message: 'Pet cadastrado com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao cadastra o pets",
          error: ErrorMapper.from(e));
    }
  }
}
