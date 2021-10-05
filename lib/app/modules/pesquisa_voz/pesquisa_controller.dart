import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'pesquisa_controller.g.dart';

@Injectable()
class PesquisaController = _PesquisaControllerBase with _$PesquisaController;

abstract class _PesquisaControllerBase with Store {}
