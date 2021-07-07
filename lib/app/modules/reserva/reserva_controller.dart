import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'reserva_controller.g.dart';

@Injectable()
class ReservaController = _ReservaControllerBase with _$ReservaController;

abstract class _ReservaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
