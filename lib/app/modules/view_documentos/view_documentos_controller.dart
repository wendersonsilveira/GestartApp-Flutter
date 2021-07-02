import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'view_documentos_controller.g.dart';

@Injectable()
class ViewDocumentosController = _ViewDocumentosControllerBase
    with _$ViewDocumentosController;

abstract class _ViewDocumentosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
