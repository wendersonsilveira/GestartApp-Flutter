import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'condominio_online_controller.g.dart';

@Injectable()
class CondominioOnlineController = _CondominioOnlineControllerBase
    with _$CondominioOnlineController;

abstract class _CondominioOnlineControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
