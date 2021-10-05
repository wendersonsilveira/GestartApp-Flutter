import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExcluirContaUseCase extends BaseFutureUseCase<void, ResourceData<int>> {
  UserRepository _userRepository;

  ExcluirContaUseCase(this._userRepository);

  @override
  Future<ResourceData<int>> call([void entity]) {
    return _userRepository.excluirConta();
  }
}
