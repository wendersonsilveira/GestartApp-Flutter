import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPerfilUseCase
    extends BaseFutureUseCase<void, ResourceData<UserEntity>> {
  UserRepository _userRepository;

  GetPerfilUseCase(this._userRepository);

  @override
  Future<ResourceData<UserEntity>> call([void user]) {
    return _userRepository.getPerfil();
  }
}
