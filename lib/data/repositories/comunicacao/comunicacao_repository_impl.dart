import 'package:Gestart/data/datasource/comunicacao/comunicacao_data_source.dart';
import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/domain/repositories/comunicacao/comunicacao_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class ComunicacaoRepositoryImpl implements ComunicacaoRepository {
  ComunicacaoRemoteDataSource _comunicacaoRemoteDataSource;

  ComunicacaoRepositoryImpl(this._comunicacaoRemoteDataSource);

  @override
  Future<ResourceData<List<AvisoEntity>>> getAvisos(int codCon) async {
    final resource = await _comunicacaoRemoteDataSource.getAvisos(codCon);

    return resource;
  }
}
