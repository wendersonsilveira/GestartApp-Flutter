import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_adm_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';

part 'listar_inadimplencias_controller.g.dart';

@Injectable()
class ListaInadimplenciasController = _ListaInadimplenciasControllerBase
    with _$ListaInadimplenciasController;

abstract class _ListaInadimplenciasControllerBase with Store {
  SendParamsRelInadimplenciaEntity params;

  @observable
  int codCon;

  final _getInadimplencias = getIt.get<GetInadimplenciasAdmUseCase>();
  // final _getInadimplenciasRelatorioPDF = getIt.get<GetInadimplenciasRelatorioUseCase>();

  @observable
  ResourceData<List<InadimplenciaAdmEntity>> inadimplenciasAdm =
      ResourceData(status: Status.loading);

  @action
  Future<void> getInadimplencias(params) async {
    inadimplenciasAdm = await _getInadimplencias(params);
    print(inadimplenciasAdm);
  }

  @action
  Future<void> getInadimplenciasPDF(SendParamsRelReservaEntity params) async {
    // String lastname = perfil.data.sobreNome.replaceAll(' ', '');
    // String url =
    //     "http://condominioonline.gestartcondominios.com.br:8080/gestartapp/get_reservas?CODCON=${params.codCon}&DATINI=${params.dataIni}&DATFIM=${params.dataFim}&TIPO=${params.tipo}&USER_NAME=${params.usr_name}&USER_LASTNAME=${lastname}";
    // _launchURL(url);
  }

  init(params) async {
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');

    await getInadimplencias(params);
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
