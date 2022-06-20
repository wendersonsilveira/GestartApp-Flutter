import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:Gestart/di/di.dart';

part 'unidades_controller.g.dart';

@Injectable()
class UnidadesController = _UnidadesControllerBase with _$UnidadesController;

abstract class _UnidadesControllerBase with Store {
  final _getUnidades = getIt.get<GetUnidadesUseCase>();

  @observable
  List<UnidadeEntity> unidades = [];

  getUnidades() async {
    final r = await _getUnidades(1);
    unidades = r.data;
  }
}
