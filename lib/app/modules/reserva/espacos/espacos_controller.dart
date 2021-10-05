import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_espacos_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'espacos_controller.g.dart';

@Injectable()
class EspacosController = _EspacosControllerBase with _$EspacosController;

abstract class _EspacosControllerBase with Store {
  final _getEspacos = getIt.get<GetEspacosUseCase>();

  @observable
  List<EspacoEntity> espacos = [];

  @action
  getEspacos(int codcon) async {
    final r = await _getEspacos(codcon);
    espacos = r.data;
  }
}
