import 'package:Gestart/data/datasource/recebimento/recebimento_data_source.dart';
import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class RecebimentoRepositoryImpl implements RecebimentoRepository {
  RecebimentoRemoteDataSource _recebimentoRemoteDataSource;

  RecebimentoRepositoryImpl(this._recebimentoRemoteDataSource);

  @override
  Future<ResourceData<List<RecebimentoEntity>>> getRecebimentos(Map<String, dynamic> filtro) async {
    int codCon = filtro['CODCON'];
    filtro.remove('CODCON');
    final resource = await _recebimentoRemoteDataSource.getRecebimentos(codCon, filtro);

    return resource;
  }

  @override
  Future<ResourceData<List<TipoTaxaEntity>>> getTiposTaxa(int codCon) async {
    final resource = await _recebimentoRemoteDataSource.getTiposTaxas(codCon);

    return resource;
  }
}
