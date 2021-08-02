import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'gerenciar_reserva_controller.g.dart';

@Injectable()
class GerenciarReservaController = _GerenciarReservaControllerBase
    with _$GerenciarReservaController;

abstract class _GerenciarReservaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
