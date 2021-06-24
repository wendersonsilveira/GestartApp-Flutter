import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase
    extends BaseFutureUseCase<LoginAuthEntity, ResourceData<UserEntity>> {
  AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<ResourceData<UserEntity>> call([LoginAuthEntity entity]) {
    return _authRepository.login(entity);
  }
}
