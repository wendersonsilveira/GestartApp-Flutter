import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'balancete_controller.g.dart';

@Injectable()
class BalanceteController = _BalanceteControllerBase with _$BalanceteController;

abstract class _BalanceteControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
