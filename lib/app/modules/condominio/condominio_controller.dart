import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'condominio_controller.g.dart';

@Injectable()
class CondominioController = _CondominioControllerBase
    with _$CondominioController;

abstract class _CondominioControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
