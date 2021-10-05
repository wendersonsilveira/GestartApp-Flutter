import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/user/editar_usuario.dart';
import 'package:Gestart/domain/usecases/user/get_perfil_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'alterar_perfil_controller.g.dart';

@Injectable()
class AlterarPerfilController = _AlterarPerfilControllerBase
    with _$AlterarPerfilController;

abstract class _AlterarPerfilControllerBase with Store {
  final _alterarUsuario = getIt.get<EditarUsuarioUseCase>();
  final _getPerfil = getIt.get<GetPerfilUseCase>();

  @observable
  ResourceData<bool> usuario;

  @observable
  ResourceData<UserEntity> perfil;

  TextEditingController nomeController = TextEditingController();
  TextEditingController sobreNomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cpfCnpjController = TextEditingController();
  init() async {
    perfil = ResourceData(status: Status.loading);
    perfil = await _getPerfil();
    inserirValoresIniciais();
  }

  inserirValoresIniciais() {
    nomeController.text = perfil.data.nome;
    sobreNomeController.text = perfil.data.sobreNome;
    emailController.text = perfil.data.email;
    telefoneController.text = perfil.data.telefone;
    cpfCnpjController.text = perfil.data.cpfCnpj;
  }

  @action
  Future<bool> alterar() async {
    usuario = ResourceData(status: Status.loading);
    usuario = await _alterarUsuario(CreateUserEntity(
        nome: nomeController.text,
        sobreNome: sobreNomeController.text,
        email: emailController.text,
        telefone: telefoneController.text,
        cpfCnpj: cpfCnpjController.text));
    if (usuario.status == Status.success)
      return true;
    else
      return false;
  }
}
