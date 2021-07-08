import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'horarios_controller.g.dart';

@Injectable()
class HorariosController = _HorariosControllerBase with _$HorariosController;

abstract class _HorariosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
