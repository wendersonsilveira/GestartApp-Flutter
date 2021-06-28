import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'ativar_condominio_controller.g.dart';

@Injectable()
class AtivarCondominioController = _AtivarCondominioControllerBase
    with _$AtivarCondominioController;

abstract class _AtivarCondominioControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
