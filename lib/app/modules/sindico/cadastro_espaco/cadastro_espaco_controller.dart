import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastro_espaco_controller.g.dart';

@Injectable()
class CadastroEspacoController = _CadastroEspacoControllerBase
    with _$CadastroEspacoController;

abstract class _CadastroEspacoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
