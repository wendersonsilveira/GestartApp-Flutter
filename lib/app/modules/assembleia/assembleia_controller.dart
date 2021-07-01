import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/assembleia/editais_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/assembleia/get_editais_use_case.dart';
import 'package:Gestart/data/mappers/condominio/condominio_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:Gestart/data/mappers/assembleia/editais_mapper.dart';

part 'assembleia_controller.g.dart';

@Injectable()
class AssembleiaController = _AssembleiaControllerBase
    with _$AssembleiaController;

abstract class _AssembleiaControllerBase with Store {
  final _getEditais = getIt.get<GetEditaisUseCase>();

  ResourceData<List<EditaisEntity>> editais;
  ResourceData<List<EditaisEntity>> listaEditais;

  @observable
  List<CondominioEntity> conds = [];

  @observable
  List<EditaisEntity> listaView;

  @observable
  List<CondominioEntity> condominios = [];

  init() {
    editais = ResourceData(status: Status.loading);
    getEditais();
  }

  @observable
  int loading = 0;

  @action
  void alterarCondicao() => loading = 1;

  @action
  void alterarCond(value) => conds = value;

  @action
  changeDropdown(int codCond) =>
      listaView = editais.data.where((i) => i.codcon == codCond).toList();

  @action
  getEditais() async {
    editais = await _getEditais();
    listaView = editais.data;

    conds = CondominioEntity().fromEditaisList(editais.data);
    ajustarCondominios();
  }

  Future<void> ajustarCondominios() {
    int count = 0;
    while (count < conds.length) {
      int index = condominios
          .indexWhere((element) => element.codcon == conds[count].codcon);
      if (index == -1) condominios.add(conds[count]);

      count++;
    }

    alterarCond(condominios);
    alterarCondicao();
  }

  @action
  convertEditaisToCondominios() async {
    conds = CondominioEntity().fromEditaisList(editais.data);
    int count = 0;
    while (count < conds.length) {
      int index = condominios
          .indexWhere((element) => element.codcon == conds[count].codcon);
      if (index == -1) condominios.add(conds[count]);

      count++;
    }
  }
}
