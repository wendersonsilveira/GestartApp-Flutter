import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'assembleia_controller.g.dart';

@Injectable()
class AssembleiaController = _AssembleiaControllerBase
    with _$AssembleiaController;

abstract class _AssembleiaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
