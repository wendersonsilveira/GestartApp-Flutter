import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/assembleia/assembleia_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/usecases/assembleia/get_editais_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'assembleia_controller.g.dart';

@Injectable()
class AssembleiaController = _AssembleiaControllerBase
    with _$AssembleiaController;

abstract class _AssembleiaControllerBase with Store {
  final _getEditais = getIt.get<GetEditaisUseCase>();
  final _getCondominios = getIt.get<GetCondominiosAtivosUseCase>();

  @observable
  ResourceData<List<AssembleiaEntity>> editais;

  @observable
  List<AssembleiaEntity> editaisProximos;

  @observable
  List<AssembleiaEntity> editaisAntigos;

  @observable
  List<AssembleiaEntity> listaView;

  @observable
  List<List<AssembleiaEntity>> allLists = [];

  @observable
  ResourceData<List<CondominiosAtivosEntity>> condominios;

  @observable
  int codCon;

  @action
  init() async {
    editais = ResourceData(status: Status.loading);
    condominios = ResourceData(status: Status.loading);
    await getEditais();
    // listaView = [];
  }

  @action
  changeDropdown(int codCond) {
    listaView = editais.data.where((i) => i.codcon == codCond).toList();
    separarEditais();
  }

  @action
  separarEditais() {
    editaisProximos =
        listaView.where((element) => element.status == 1).toList();
    editaisAntigos = listaView.where((element) => element.status == 0).toList();
    allLists = [editaisProximos, editaisAntigos];
  }

  @action
  getEditais() async {
    editais = await _getEditais();
    condominios = await _getCondominios();
    var storage = await SharedPreferences.getInstance();
    int cod = storage.getInt('codCon');

    if (codCon == null) {
      if (cod != null) {
        codCon = cod;
      } else {
        codCon = condominios.data[0].codcon;
      }
    } else {
      codCon = condominios.data[0].codcon;
    }

    changeDropdown(codCon);

    await filterAssembleias(codCon);
  }

  @action
  filterAssembleias(int id) {
    codCon = id;
    listaView = editais.data.where((assembleia) {
      return assembleia.codcon == id;
    }).toList();

    separarEditais();
  }
}
