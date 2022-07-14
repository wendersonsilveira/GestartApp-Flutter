import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_comp_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Gestart/domain/utils/status.dart';

part 'lista_boletos_controller.g.dart';

@Injectable()
class ListaBoletosController = _ListaBoletosControllerBase
    with _$ListaBoletosController;

abstract class _ListaBoletosControllerBase with Store {
  final _getBoletos = getIt.get<GetBoletosUseCase>();
  final _getUnidades = getIt.get<GetUnidadesCompUseCase>();

  @observable
  ResourceData<List<BoletoEntity>> boletos =
      ResourceData(status: Status.loading);

  @observable
  ResourceData<List<UnidadeEntity>> unidades =
      ResourceData(status: Status.loading);

  @observable
  List<UnidadeEntity> filteredUnidades = [];

  int codCon = 0;

  init() async {
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');
    await getUnidades();
    filteredUnidades = unidades.data;
  }

  @action
  Future<void> getUnidades() async {
    unidades = await _getUnidades(codCon);
  }

  void searchUnidades(String query) {
    if (query.isEmpty) {
      filteredUnidades = unidades.data;
    } else {
      if (query.length >= 3) {
        filteredUnidades = unidades.data
            .where((e) => (e.nompro.toLowerCase() +                    
                    e.codimo.toLowerCase() +
                    (e.propri != null ? e.propri.toLowerCase() : ''))
                .contains(query.toLowerCase()))
            .toList();
      }
    }
  }

  @action
  Future<void> getBoletos(codCon) async {
    boletos = await _getBoletos({"CODCON": codCon});
  }
}
