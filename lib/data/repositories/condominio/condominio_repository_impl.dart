import 'package:Gestart/data/datasource/condominio/condominio_remote_data_source.dart';
import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class CondominioRepositoryImpl implements CondominioRepository {
  CondominioRemoteDataSource _condominioRemoteDataSource;

  CondominioRepositoryImpl(this._condominioRemoteDataSource);

  @override
  Future<ResourceData<List<CondominioEntity>>> getCondominiosPorCpf() async {
    final resource = await _condominioRemoteDataSource.getCondominioPorCpf();

    return resource;
  }

  @override
  Future<ResourceData<UnidadeAtivaEntity>> getCondominiosAtivos() async {
    final resource = await _condominioRemoteDataSource.condominioAtivo();
    return resource;
  }

  @override
  Future<ResourceData<List<CondominiosAtivosEntity>>>
      getAllCondominiosAtivos() async {
    final resource = await _condominioRemoteDataSource.condominiosAtivos();
    return resource;
  }

  @override
  Future<ResourceData<List<UserAdmEntity>>> getInforAdmCondominios() async {
    final resource = await _condominioRemoteDataSource.inforCondominios();
    return resource;
  }

  @override
  Future<ResourceData> sendCodigoAtivacao(String codigo) async {
    final resource =
        await _condominioRemoteDataSource.sendCodigoAtivacao(codigo);
    return resource;
  }
}
