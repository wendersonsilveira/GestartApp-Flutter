import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_ativo_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCondominioAtivoUseCase
    extends BaseFutureUseCase<void, ResourceData<CondominioAtivoEntity>> {
  CondominioRepository _condominioRepository;

  GetCondominioAtivoUseCase(this._condominioRepository);

  @override
  Future<ResourceData<CondominioAtivoEntity>> call([void entity]) {
    return _condominioRepository.getCondominiosAtivos();
  }
}
