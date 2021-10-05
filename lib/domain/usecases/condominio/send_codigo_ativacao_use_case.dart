import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendCodigoAtivacao extends BaseFutureUseCase<String, ResourceData> {
  CondominioRepository _condominioRepository;

  SendCodigoAtivacao(this._condominioRepository);

  @override
  Future<ResourceData> call([String codigo]) {
    return _condominioRepository.sendCodigoAtivacao(codigo);
  }
}
