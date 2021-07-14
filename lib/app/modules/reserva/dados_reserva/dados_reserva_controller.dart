import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dados_reserva_controller.g.dart';

@Injectable()
class DadosReservaController = _DadosReservaControllerBase
    with _$DadosReservaController;

abstract class _DadosReservaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
