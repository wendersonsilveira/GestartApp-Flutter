import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'erro_controller.g.dart';

@Injectable()
class ErroController = _ErroControllerBase with _$ErroController;

abstract class _ErroControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
