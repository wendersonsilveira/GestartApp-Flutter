import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/feed/get_informacoes_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'informativos_controller.g.dart';

@Injectable()
class InformativosController = _InformativosControllerBase
    with _$InformativosController;

abstract class _InformativosControllerBase with Store {
  final _getInformacoes = getIt.get<GetInformacoesUseCase>();
  final _getCondominios = getIt.get<GetCondominioAtivoUseCase>();

  @observable
  ResourceData<List<UnidadeAtivaEntity>> condominios;

  @observable
  int codCon;

  @observable
  ResourceData<List<FeedEntity>> infor;

  @action
  init() async {
    infor = ResourceData(status: Status.loading);
    infor = await _getInformacoes();
    await getCondominios();
    var storage = await SharedPreferences.getInstance();
    int cod = storage.getInt('codCon');

    if (codCon == null) {
      if (cod != null) {
        codCon = cod;
        storage.setInt('codCon', codCon);
      } else {
        codCon = condominios.data[0].codcon;
        storage.setInt('codCon', codCon);
      }
    } else {
      codCon = condominios.data[0].codcon;
    }

    print(condominios);
  }

  @action
  Future<void> getCondominios() async {
    condominios = await _getCondominios();
  }

  @action
  changeDropdown(int codOrd) {
    this.infor = ResourceData<List<FeedEntity>>(
      data: [],
      status: Status.loading,
    );
    // getComunicados(codOrd);
  }

  // @action
  // Future<void> getComunicados(int codOrd) async {
  //   infor = await _getBoletos(codOrd);
  // }
}
