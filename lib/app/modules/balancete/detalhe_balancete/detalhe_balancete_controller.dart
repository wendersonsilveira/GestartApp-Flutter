import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhe_balancete_controller.g.dart';

@Injectable()
class DetalheBalanceteController = _DetalheBalanceteControllerBase
    with _$DetalheBalanceteController;

abstract class _DetalheBalanceteControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
