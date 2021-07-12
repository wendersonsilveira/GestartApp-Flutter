import 'package:Gestart/domain/entities/user/password_entity.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class AlterarSenhaUseCase
    extends BaseFutureUseCase<PasswordEntity, ResourceData<bool>> {
  UserRepository _userRepository;

  AlterarSenhaUseCase(this._userRepository);

  @override
  Future<ResourceData<bool>> call([PasswordEntity pass]) {
    return _userRepository.alterarSenha(pass);
  }
}
