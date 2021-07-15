import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/veiculo/veiculo_mapper.dart';
import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class VeiculoRemoteDataSource {
  CustomDio _dio;
  VeiculoRemoteDataSource(this._dio);

  Future<ResourceData> createVeiculo(VeiculoEntity veiculo) async {
    try {
      await _dio.post('veiculos', data: veiculo.toMap());
      return ResourceData(status: Status.success, data: null, message: 'Veiculo cadastrado com sucesso!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao cadastra o veiculo", error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<VeiculoEntity>>> getVeiculos() async {
    try {
      final result = await _dio.get('veiculos');

      return ResourceData(status: Status.success, data: VeiculoEntity().fromMapList(result), message: 'Veiculos listados com sucesso!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao cadastra o veiculos", error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<VeiculoEntity>> getVeiculo(int id) async {
    try {
      final result = await _dio.get('veiculo/$id');

      return ResourceData(status: Status.success, data: VeiculoEntity().fromMap(result[0]), message: 'Veiculo econtrado!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao listar o veiculo", error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> deleteVeiculo(int id) async {
    try {
      await _dio.delete('veiculo/$id');

      return ResourceData(status: Status.success, message: 'Veiculo deletado!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao deletar o veiculos", error: ErrorMapper.from(e));
    }
  }
}
