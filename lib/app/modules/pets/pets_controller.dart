import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'pets_controller.g.dart';

@Injectable()
class PetsController = _PetsControllerBase with _$PetsController;

abstract class _PetsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
