import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastros_controller.g.dart';

@Injectable()
class CadastrosController = _CadastrosControllerBase with _$CadastrosController;

abstract class _CadastrosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
