import 'package:Gestart/data/datasource/condominio/condominio_remote_data_source.dart';
import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_ativo_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class CondominioRepositoryImpl implements CondominioRepository {
  CondominioRemoteDataSource _condominioRemoteDataSource;

  CondominioRepositoryImpl(this._condominioRemoteDataSource);

  @override
  Future<ResourceData<CondominioEntity>> getCondominiosPorCpf() async {
    final resource = await _condominioRemoteDataSource.getCondominioPorCpf();

    return resource;
  }

  @override
  Future<ResourceData<CondominioAtivoEntity>> getCondominiosAtivos() async {
    final resource = await _condominioRemoteDataSource.condominioAtivo();
    return resource;
  }
}
