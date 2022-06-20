import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCondominioAtivoUseCase
    extends BaseFutureUseCase<void, ResourceData<List<UnidadeAtivaEntity>>> {
  CondominioRepository _condominioRepository;

  GetCondominioAtivoUseCase(this._condominioRepository);

  @override
  Future<ResourceData<List<UnidadeAtivaEntity>>> call([void entity]) {
    return _condominioRepository.getCondominiosAtivos();
  }
}
