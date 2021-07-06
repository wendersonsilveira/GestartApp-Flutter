import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhe_boleto_controller.g.dart';

@Injectable()
class DetalheBoletoController = _DetalheBoletoControllerBase
    with _$DetalheBoletoController;

abstract class _DetalheBoletoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
