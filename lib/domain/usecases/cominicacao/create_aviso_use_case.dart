import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/domain/repositories/comunicacao/comunicacao_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateAvisoUseCase extends BaseFutureUseCase<AvisoEntity, ResourceData> {
  ComunicacaoRepository _avisosRepository;

  CreateAvisoUseCase(this._avisosRepository);

  @override
  Future<ResourceData> call([AvisoEntity aviso]) {
    return _avisosRepository.createAviso(aviso);
  }
}
