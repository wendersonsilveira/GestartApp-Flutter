import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/usecases/veiculo/delete_veiculo_use_case.dart';
import 'package:Gestart/domain/usecases/veiculo/get_veiculos_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

part 'veiculos_controller.g.dart';

@Injectable()
class VeiculosController = _VeiculosControllerBase with _$VeiculosController;

abstract class _VeiculosControllerBase with Store {
  final _getVeiculos = getIt.get<GetVeiculosUseCase>();
  final _deleteVeiculo = getIt.get<DeleteVeiculoUseCase>();

  @observable
  ResourceData<List<VeiculoEntity>> veiculos;

  @action
  getVeiculos() async {
    veiculos = await _getVeiculos();
  }

  @action
  Future deleteVeiculo(int id) async {
    return await _deleteVeiculo(id);
  }

  @action
  removeVeiculo(int index) {
    veiculos.data.removeAt(index);
  }
}
