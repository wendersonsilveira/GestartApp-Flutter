import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/admin-cadastro/resumo_unidade_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/adm-cadastros/get_resumo_unidade_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_filtro_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cadastros_controller.g.dart';

@Injectable()
class CadastrosController = _CadastrosControllerBase with _$CadastrosController;

abstract class _CadastrosControllerBase with Store {
  final _getResumoUnidade = getIt.get<GetResumoUnidadeUseCase>();
  final _getUnidade = getIt.get<GetUnidadesFiltroUseCase>();

  @observable
  int codCon;

  @observable
  ResumoUnidadeEntity resumo;

  @observable
  List<UnidadeEntity> unidades;

  @observable
  bool isLoadingNex = false;

  @observable
  bool finalList = false;

  @observable
  bool isLoading = false;

  @action
  getResumo() async {
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');
    ResourceData r = await _getResumoUnidade(codCon);

    resumo = r.data;
  }

  @action
  getUnidades(Map<String, dynamic> filtro) async {
    isLoading = false;
    filtro['CODCON'] = codCon;
    ResourceData r = await _getUnidade(filtro);
    unidades = r.data;
    isLoading = true;
  }

  getNexFilterUnidades(Map<String, dynamic> filtro) async {
    isLoadingNex = true;
    filtro['CODCON'] = codCon;
    ResourceData r = await _getUnidade(filtro);
    if (r.data != null) {
      unidades.addAll(r.data);
    } else {
      finalList = true;
    }
    isLoadingNex = false;
  }
}
