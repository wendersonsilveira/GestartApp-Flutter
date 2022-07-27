import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_unidade_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boleto_unidade_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/utils/status.dart';

part 'boletos_detalhes_controller.g.dart';

@Injectable()
class BoletosDetalhesController = _BoletosDetalhesControllerBase
    with _$BoletosDetalhesController;

abstract class _BoletosDetalhesControllerBase with Store {
  String params;
  final _getBoleto = getIt.get<GetBoletoUnidadeUseCase>();

  @observable
  ResourceData<List<DetalheBoletoUnidadeEntity>> boleto =
      ResourceData(status: Status.loading);

  init(String params) async {
    await getBoleto(params);
  }

  Future<void> getBoleto(String conts) async {
    boleto = await _getBoleto(conts);
    print(boleto);
  }
}
