import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateUserUseCase
    extends BaseFutureUseCase<CreateUserEntity, ResourceData> {
  UserRepository _userRepository;

  CreateUserUseCase(this._userRepository);

  @override
  Future<ResourceData> call([CreateUserEntity user]) {
    return _userRepository.createUser(user);
  }
}
