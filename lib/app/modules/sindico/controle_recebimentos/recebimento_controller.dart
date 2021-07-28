import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_recebimentos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'recebimento_controller.g.dart';

@Injectable()
class RecebimentoController = _RecebimentoControllerBase with _$RecebimentoController;

abstract class _RecebimentoControllerBase with Store {
  final _getRecebimentos = getIt.get<GetRecebimentosUseCase>();

  @observable
  List<RecebimentoEntity> recebimentos = [];

  @action
  getRecebimentos(filtro) async {
    ResourceData r = await _getRecebimentos(filtro);

    recebimentos = r.data;
  }
}
