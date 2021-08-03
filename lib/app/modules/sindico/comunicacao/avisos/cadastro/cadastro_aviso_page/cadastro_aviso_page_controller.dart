import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastro_aviso_page_controller.g.dart';

@Injectable()
class CadastroAvisoPageController = _CadastroAvisoPageControllerBase
    with _$CadastroAvisoPageController;

abstract class _CadastroAvisoPageControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
