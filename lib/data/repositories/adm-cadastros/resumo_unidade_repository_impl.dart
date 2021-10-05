import 'package:Gestart/data/datasource/adm-cadastro/resumo_unidade_data_source.dart';
import 'package:Gestart/domain/entities/admin-cadastro/resumo_unidade_entity.dart';
import 'package:Gestart/domain/repositories/adm-cadastros/resumo_unidade_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class ResumoUnidadeRepositoryImpl implements ResumoUnidadeRepository {
  ResumoUnidadeRemoteDataSource _resumoUnidadeRemoteDataSource;

  ResumoUnidadeRepositoryImpl(this._resumoUnidadeRemoteDataSource);

  @override
  Future<ResourceData<ResumoUnidadeEntity>> getResumoUnidade(int codCon) async {
    final resource = await _resumoUnidadeRemoteDataSource.getResumoUnidade(codCon);

    return resource;
  }
}
