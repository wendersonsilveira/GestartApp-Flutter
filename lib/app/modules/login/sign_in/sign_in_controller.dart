import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/auth/check_user_use_case.dart';
import 'package:Gestart/domain/usecases/auth/login_use_case.dart';
import 'package:Gestart/domain/usecases/user/create_user_use_case.dart';
import 'package:Gestart/domain/usecases/user/update_password_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/di/di.dart';

part 'sign_in_controller.g.dart';

@Injectable()
class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  final _checkUser = getIt.get<CheckUserUseCase>();
  final _login = getIt.get<LoginUseCase>();

  ResourceData<int> loadingCheck;
  ResourceData<UserEntity> userLogin;

  // TODO: REMOVER DEPOIS
  testsUseCases() async {
    //   var result =
    //       await _login(LoginAuthEntity(usuario: '04008224319', senha: '090815'));

    //   print("Result Check: \n ${result.data.toString()}");
  }

  @action
  Future<ResourceData<int>> checkUser(String cpfCnpj) async {
    loadingCheck = ResourceData(status: Status.loading);
    loadingCheck = await _checkUser(cpfCnpj);

    return loadingCheck;
  }

  @action
  Future<ResourceData<UserEntity>> login(LoginAuthEntity entity) async {
    userLogin = ResourceData(status: Status.loading);
    userLogin = await _login(entity);

    return userLogin;
  }

  @observable
  bool usuarioCadastrado = false;

  @action
  void mudarStatusUsuario(value) => usuarioCadastrado = value;
}
