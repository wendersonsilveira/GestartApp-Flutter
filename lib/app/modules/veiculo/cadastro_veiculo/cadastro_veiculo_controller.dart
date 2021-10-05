import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/usecases/veiculo/get_veiculo_use_case.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/usecases/veiculo/create_veiculo_use_case.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

part 'cadastro_veiculo_controller.g.dart';

@Injectable()
class CadastroVeiculoController = _CadastroVeiculoControllerBase with _$CadastroVeiculoController;

abstract class _CadastroVeiculoControllerBase with Store {
  final _createVeiculo = getIt.get<CreateVeiculoUseCase>();
  final _getVeiculo = getIt.get<GetVeiculoUseCase>();

  @observable
  ResourceData<VeiculoEntity> veiculo;

  @observable
  ResourceData loadingVeiculo;

  @observable
  bool loadingForm = false;

  @action
  Future<ResourceData> createVeiculo(VeiculoEntity veiculo) async {
    alteraLoading(false);
    loadingVeiculo = ResourceData(status: Status.loading);
    loadingVeiculo = await _createVeiculo(veiculo);
    return loadingVeiculo;
  }

  @action
  Future<VeiculoEntity> getVeiculo(int id) async {
    veiculo = ResourceData(status: Status.loading);
    veiculo = await _getVeiculo(id);
    alteraLoading(true);
    return veiculo.data;
  }

  @action
  void alteraLoading(bool value) => loadingForm = value;
}
