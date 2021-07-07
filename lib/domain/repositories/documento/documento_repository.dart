import 'package:Gestart/domain/entities/documento/documento_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class DocumentoRepository {
  Future<ResourceData<List<DocumentoEntity>>> getDocumentos();
}
