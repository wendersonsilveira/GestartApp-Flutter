import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/domain/repositories/comunicacao/comunicacao_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAvisosUseCase extends BaseFutureUseCase<int, ResourceData<List<AvisoEntity>>> {
  ComunicacaoRepository _avisosRepository;

  GetAvisosUseCase(this._avisosRepository);

  @override
  Future<ResourceData<List<AvisoEntity>>> call([int codCon]) {
    return _avisosRepository.getAvisos(codCon);
  }
}
