import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class AtivarCondominioUseCase
    extends BaseFutureUseCase<LoginAuthEntity, ResourceData<int>> {
  CondominioRepository _condominioRepository;

  AtivarCondominioUseCase(this._condominioRepository);

  @override
  Future<ResourceData<int>> call([LoginAuthEntity credenciais]) {
    return _condominioRepository.ativarCondominio(credenciais);
  }
}
