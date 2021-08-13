import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInforAdmCondominiosUseCase
    extends BaseFutureUseCase<void, ResourceData<List<UserAdmEntity>>> {
  CondominioRepository _condominioRepository;

  GetInforAdmCondominiosUseCase(this._condominioRepository);

  @override
  Future<ResourceData<List<UserAdmEntity>>> call([void entity]) {
    return _condominioRepository.getInforAdmCondominios();
  }
}
