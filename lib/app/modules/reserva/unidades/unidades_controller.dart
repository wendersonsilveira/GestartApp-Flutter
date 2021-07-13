import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'unidades_controller.g.dart';

@Injectable()
class UnidadesController = _UnidadesControllerBase with _$UnidadesController;

abstract class _UnidadesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
