import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_infor_adm_condominios_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'infor_condominio_controller.g.dart';

@Injectable()
class InforCondominioController = _InforCondominioControllerBase
    with _$InforCondominioController;

abstract class _InforCondominioControllerBase with Store {
  final _getCondominios = getIt.get<GetCondominiosAtivosUseCase>();
  final _getInforCondominios = getIt.get<GetInforAdmCondominiosUseCase>();

  @observable
  ResourceData<List<CondominiosAtivosEntity>> condominios;

  @observable
  List<CondominiosAtivosEntity> cond = [];

  @observable
  List<UserAdmEntity> listView = [];

  @observable
  int codCon;

  @observable
  ResourceData<List<UserAdmEntity>> inforAdmCond;

  init() async {
    condominios = ResourceData(status: Status.loading);
    inforAdmCond = ResourceData(status: Status.loading);
    condominios = await _getCondominios();
    inforAdmCond = await _getInforCondominios();

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
    // listView = inforAdmCond.data;
    changeDropdown(codCon);
  }

  @action
  changeDropdown(int codCond) {
    cond =
        condominios.data.where((element) => element.codcon == codCond).toList();

    int count = 0;
    listView = [];
    while (count < inforAdmCond.data.length) {
      int index = listView.indexWhere((element) =>
          element.nomAdm == inforAdmCond.data[count].nomAdm &&
          element.nomCar == inforAdmCond.data[count].nomCar);
      if (index == -1 && inforAdmCond.data[count].codCon == codCond)
        listView.add(inforAdmCond.data[count]);

      count++;
    }
    print(listView);
  }
}
