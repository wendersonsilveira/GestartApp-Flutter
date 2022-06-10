import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/usecases/balancete/get_balancete_use_case.dart';
import 'package:Gestart/domain/usecases/balancete/get_balancetes_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhe_balancete_controller.g.dart';

@Injectable()
class DetalheBalanceteController = _DetalheBalanceteControllerBase
    with _$DetalheBalanceteController;

abstract class _DetalheBalanceteControllerBase with Store {
  final _getBalancete = getIt.get<GetBalanceteUseCase>();

  @observable
  ResourceData<BalanceteEntity> balancete;

  @action
  init({idBalancete}) async {
    balancete = ResourceData(status: Status.loading);
    balancete = await _getBalancete(idBalancete);
    print(balancete);
  }
}
