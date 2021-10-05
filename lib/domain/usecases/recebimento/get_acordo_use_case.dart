import 'package:Gestart/domain/entities/recebimento/acrodo_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAcordoUseCase extends BaseFutureUseCase<int, ResourceData> {
  RecebimentoRepository _recebimentoRepository;

  GetAcordoUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<AcordoEntity>>> call([int numAco]) {
    return _recebimentoRepository.getAcordo(numAco);
  }
}
