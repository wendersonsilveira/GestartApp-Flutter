import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';
import 'package:Gestart/domain/usecases/boleto/get_boleto_use_case.dart';
import 'package:Gestart/domain/usecases/parcelamento/get_link_parcelamento_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhe_boleto_controller.g.dart';

@Injectable()
class DetalheBoletoController = _DetalheBoletoControllerBase
    with _$DetalheBoletoController;

abstract class _DetalheBoletoControllerBase with Store {
  final _getBoleto = getIt.get<GetBoletoUseCase>();
  final _getLinkParcelamento = getIt.get<GetLinkParcelamentoUseCase>();

  @observable
  ResourceData<DetalheBoletoEntity> boleto;

  @observable
  ResourceData<String> urlConsulta = ResourceData(status: Status.success);

  List<dynamic> inforBoletos = [];

  @action
  init({idBoleto}) async {
    boleto = ResourceData(status: Status.loading);
    boleto = await _getBoleto(idBoleto);
    checarDetalhamento(boleto.data);
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  checarDetalhamento(DetalheBoletoEntity boleto) {
    if (boleto.despesa1 != null)
      inforBoletos.add({'descricao': boleto.despesa1, 'valor': boleto.valor1});
    if (boleto.despesa2 != null)
      inforBoletos.add({'descricao': boleto.despesa2, 'valor': boleto.valor2});
    if (boleto.despesa3 != null)
      inforBoletos.add({'descricao': boleto.despesa3, 'valor': boleto.valor3});
    if (boleto.despesa4 != null)
      inforBoletos.add({'descricao': boleto.despesa4, 'valor': boleto.valor4});
    if (boleto.despesa5 != null)
      inforBoletos.add({'descricao': boleto.despesa5, 'valor': boleto.valor5});
    if (boleto.despesa6 != null)
      inforBoletos.add({'descricao': boleto.despesa6, 'valor': boleto.valor6});
    print('************');
    print(inforBoletos);
  }

  @action
  Future buscarLinkParcelamento(String identificador) async {
    urlConsulta = ResourceData(status: Status.loading);
    urlConsulta = await _getLinkParcelamento(identificador);
    print(urlConsulta);
    return urlConsulta;
  }
}
