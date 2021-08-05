import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhe_movimento_controller.g.dart';

@Injectable()
class DetalheMovimentoController = _DetalheMovimentoControllerBase
    with _$DetalheMovimentoController;

abstract class _DetalheMovimentoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
