import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GerarCodigoAtivacaoUseCase
    extends BaseFutureUseCase<int, ResourceData<int>> {
  CondominioRepository _condominioRepository;

  GerarCodigoAtivacaoUseCase(this._condominioRepository);

  @override
  Future<ResourceData<int>> call([int codigo]) {
    return _condominioRepository.gerarCodigoAtivacao(codigo);
  }
}
