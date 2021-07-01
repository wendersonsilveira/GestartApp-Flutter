import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhes_assembleia_controller.g.dart';

@Injectable()
class DetalhesAssembleiaController = _DetalhesAssembleiaControllerBase
    with _$DetalhesAssembleiaController;

abstract class _DetalhesAssembleiaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
