import 'package:Gestart/domain/entities/documento/documento_entity.dart';
import 'package:Gestart/domain/repositories/documento/documento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDocumentoUseCase
    extends BaseFutureUseCase<void, ResourceData<List<DocumentoEntity>>> {
  DocumentoRepository _documentoRepository;

  GetDocumentoUseCase(this._documentoRepository);

  @override
  Future<ResourceData<List<DocumentoEntity>>> call([void entity]) {
    return _documentoRepository.getDocumentos();
  }
}
