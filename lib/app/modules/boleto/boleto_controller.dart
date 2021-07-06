import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'boleto_controller.g.dart';

@Injectable()
class BoletoController = _BoletoControllerBase with _$BoletoController;

abstract class _BoletoControllerBase with Store {
  final _getCondominios = getIt.get<GetCondominiosAtivosUseCase>();

  @observable
  ResourceData<List<CondominiosAtivosEntity>> condominios;

  init() {
    condominios = ResourceData(status: Status.loading);
    getCondominios();
  }

  @action
  getCondominios() async {
    condominios = await _getCondominios();
  }
}
