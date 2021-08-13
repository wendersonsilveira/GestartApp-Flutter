import 'package:Gestart/data/datasource/documento/documento_remote_data_source.dart';
import 'package:Gestart/domain/entities/documento/documento_entity.dart';
import 'package:Gestart/domain/repositories/documento/documento_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class DocumentoRepositoryImpl implements DocumentoRepository {
  DocumentoRemoteDataSource _documentoRemoteDataSource;

  DocumentoRepositoryImpl(this._documentoRemoteDataSource);

  @override
  Future<ResourceData<List<DocumentoEntity>>> getDocumentos() async {
    final resource = await _documentoRemoteDataSource.getDocumentos();

    return resource;
  }
}
