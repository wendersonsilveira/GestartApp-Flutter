import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/usecases/assembleia/get_edital_use_case.dart';
import 'package:Gestart/app/utils/ui_helper.dart';

part 'detalhes_assembleia_controller.g.dart';

@Injectable()
class DetalhesAssembleiaController = _DetalhesAssembleiaControllerBase with _$DetalhesAssembleiaController;

abstract class _DetalhesAssembleiaControllerBase with Store {
  final _getEdital = getIt.get<GetEditalUseCase>();

  @observable
  ResourceData<List<EditalEntity>> edital;

  @observable
  int loading = 0;

  @observable
  String fileName;

  @action
  void carregado(int status) => loading = status;

  @action
  init(int id) async {
    edital = await _getEdital(id);
    carregado(1);
    fileName =
        '${edital.data[0].apelido.length > 5 ? edital.data[0].apelido.trim().substring(0, 6).toUpperCase() : edital.data[0].apelido.trim().toUpperCase()}_${UIHelper.formatDate(edital.data[0].datemi, '_')}_COD_$id.${edital.data[0].tipoEdital}';
  }
}
