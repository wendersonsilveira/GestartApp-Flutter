import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'avisos_page_controller.g.dart';

@Injectable()
class AvisosPageController = _AvisosPageControllerBase
    with _$AvisosPageController;

abstract class _AvisosPageControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
