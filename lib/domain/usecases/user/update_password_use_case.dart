import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePasswordUseCase
    extends BaseFutureUseCase<UpdatePasswordEntity, ResourceData> {
  UserRepository _userRepository;

  UpdatePasswordUseCase(this._userRepository);

  @override
  Future<ResourceData> call([UpdatePasswordEntity id]) {
    return _userRepository.updatePassword(id);
  }
}
