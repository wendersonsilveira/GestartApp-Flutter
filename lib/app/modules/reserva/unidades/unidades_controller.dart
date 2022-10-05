import 'package:Gestart/data/local/shared_preferences.dart';
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
  final sharedPreferences = getIt.get<SharedPreferencesManager>();
  // final _getCondominios = condominioController.condominiosAtivos;

  List<String> condominios = [];
  List<String> condominiosInfo = [];

  init() {
    getUnidades();
    // getCondominio();
  }

  @observable
  List<UnidadeEntity> unidades = [];
  List<UnidadeEntity> unidadesReserva = [];

  getUnidades() async {
    final r = await _getUnidades();
    unidades = r.data;
    unidades.forEach((e) {
      if (e.gestartappReserva == 1) unidadesReserva.add(e);
    });
    print(unidadesReserva);
  }
}
