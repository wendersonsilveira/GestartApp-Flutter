import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastro_pet_controller.g.dart';

@Injectable()
class CadastroPetController = _CadastroPetControllerBase
    with _$CadastroPetController;

abstract class _CadastroPetControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
