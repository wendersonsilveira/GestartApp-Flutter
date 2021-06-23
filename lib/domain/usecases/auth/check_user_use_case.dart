import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckUserUseCase extends BaseFutureUseCase<String, ResourceData<int>> {
  AuthRepository _authRepository;

  CheckUserUseCase(this._authRepository);

  @override
  Future<ResourceData<int>> call([String cpfCnpj]) {
    return _authRepository.checkUser(cpfCnpj);
  }
}
