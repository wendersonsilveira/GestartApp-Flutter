import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckUserUseCase
    extends BaseFutureUseCase<IdUserEntity, ResourceData<int>> {
  AuthRepository _authRepository;

  CheckUserUseCase(this._authRepository);

  @override
  Future<ResourceData<int>> call([IdUserEntity cpfCnpj]) {
    return _authRepository.checkUser(cpfCnpj);
  }
}
