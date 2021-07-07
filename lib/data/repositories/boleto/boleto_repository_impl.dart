import 'package:Gestart/data/datasource/boleto/boleto_remote_data_source.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';
import 'package:Gestart/domain/repositories/boleto/boleto_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class BoletoRepositoryImpl implements BoletoRepository {
  BoletoRemoteDataSource _boletoRemoteDataSource;

  BoletoRepositoryImpl(this._boletoRemoteDataSource);

  @override
  Future<ResourceData<List<BoletoEntity>>> getBoletos() async {
    final resource = await _boletoRemoteDataSource.getBoletos();

    return resource;
  }

  @override
  Future<ResourceData<DetalheBoletoEntity>> getBoleto(int codord) async {
    final resource = await _boletoRemoteDataSource.getBoleto(codord);

    return resource;
  }
}
