import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/entities/user/password_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
import 'package:Gestart/domain/usecases/user/alterar_senha_use_case.dart';
import 'package:Gestart/domain/usecases/user/checar_senha_use_case.dart';
import 'package:Gestart/domain/usecases/user/excluir_conta_use_case.dart';
import 'package:Gestart/domain/usecases/user/get_perfil_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'perfil_controller.g.dart';

@Injectable()
class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  final _getPerfil = getIt.get<GetPerfilUseCase>();
  final _alterarSenha = getIt.get<AlterarSenhaUseCase>();
  final sharedPreferences = getIt.get<SharedPreferencesManager>();
  final _checarSenha = getIt.get<ChecarSenhaUseCase>();
  final _excluirConta = getIt.get<ExcluirContaUseCase>();
  final _getUnidades = getIt.get<GetUnidadesUseCase>();

  @observable
  ResourceData<UserEntity> perfil;

  @observable
  ResourceData statusAlterarSenha = ResourceData(status: Status.success);

  @observable
  ResourceData<bool> checarSenhaStatus;

  @observable
  ResourceData<int> excluirContaStatus;

  @observable
  ResourceData<List<UnidadeEntity>> unidades;

  init() async {
    perfil = ResourceData(status: Status.loading);
    unidades = await _getUnidades();

    perfil = await _getPerfil();
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<void> logout() async {
    sharedPreferences.removeAll();
    destruirKeyFB();
    Modular.navigator.popAndPushNamed(RouteName.login);
  }

  destruirKeyFB() async {
    await _firebaseMessaging.deleteInstanceID();
  }

  Future<dynamic> alterarSenha(PasswordEntity pass) async {
    statusAlterarSenha = ResourceData(status: Status.loading);
    statusAlterarSenha = await _alterarSenha(pass);
    return {
      'id': statusAlterarSenha.data,
      'message': statusAlterarSenha.message
    };
  }

  Future<bool> checarSenha(String senha) async {
    checarSenhaStatus = await _checarSenha(senha);
    return checarSenhaStatus.data;
  }

  Future<void> excluirConta() async {
    excluirContaStatus = await _excluirConta();
    if (excluirContaStatus.data == 1) logout();
  }
}
