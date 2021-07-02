import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/assembleia/assembleia_entity.dart';
import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/usecases/assembleia/get_edital_use_case.dart';

part 'detalhes_assembleia_controller.g.dart';

@Injectable()
class DetalhesAssembleiaController = _DetalhesAssembleiaControllerBase
    with _$DetalhesAssembleiaController;

abstract class _DetalhesAssembleiaControllerBase with Store {
  final _getEdital = getIt.get<GetEditalUseCase>();

  @observable
  ResourceData<List<EditalEntity>> edital;

  @observable
  bool loading = true;

  @action
  void carregado(bool status) => loading = status;

  @action
  init(int id) async {
    edital = await _getEdital(id);
    carregado(false);
  }
}
