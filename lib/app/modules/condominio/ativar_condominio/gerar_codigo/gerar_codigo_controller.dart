import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'gerar_codigo_controller.g.dart';

@Injectable()
class GerarCodigoController = _GerarCodigoControllerBase
    with _$GerarCodigoController;

abstract class _GerarCodigoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
