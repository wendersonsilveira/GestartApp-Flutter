import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/usecases/user/create_user_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sign_up_controller.g.dart';

@Injectable()
class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final _createUser = getIt.get<CreateUserUseCase>();
  ResourceData loadingUser = ResourceData(status: Status.success);

  @action
  Future<ResourceData> createUser(CreateUserEntity user) async {
    loadingUser = ResourceData(status: Status.loading);
    loadingUser = await _createUser(user);

    return loadingUser;
  }
}
