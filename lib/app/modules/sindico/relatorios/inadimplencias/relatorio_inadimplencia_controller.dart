import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'relatorio_inadimplencia_controller.g.dart';

@Injectable()
class RelatorioInadimplenciaController = _RelatorioInadimplenciaControllerBase
    with _$RelatorioInadimplenciaController;

abstract class _RelatorioInadimplenciaControllerBase with Store {
  init() async {
    print('filtros');
  }
}
