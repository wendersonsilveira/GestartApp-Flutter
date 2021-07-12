import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'alterar_perfil_controller.g.dart';

@Injectable()
class AlterarPerfilController = _AlterarPerfilControllerBase
    with _$AlterarPerfilController;

abstract class _AlterarPerfilControllerBase with Store {}
