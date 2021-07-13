import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'espacos_controller.g.dart';

@Injectable()
class EspacosController = _EspacosControllerBase with _$EspacosController;

abstract class _EspacosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
