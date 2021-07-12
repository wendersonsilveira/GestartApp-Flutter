import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChecarSenhaUseCase extends BaseFutureUseCase<String, ResourceData<bool>> {
  UserRepository _userRepository;

  ChecarSenhaUseCase(this._userRepository);

  @override
  Future<ResourceData<bool>> call([String entity]) {
    return _userRepository.checarSenha(entity);
  }
}
