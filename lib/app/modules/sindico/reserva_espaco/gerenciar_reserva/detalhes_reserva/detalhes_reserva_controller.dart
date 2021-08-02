import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhes_reserva_controller.g.dart';

@Injectable()
class DetalhesReservaController = _DetalhesReservaControllerBase
    with _$DetalhesReservaController;

abstract class _DetalhesReservaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
