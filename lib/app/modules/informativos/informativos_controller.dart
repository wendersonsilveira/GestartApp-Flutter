import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/usecases/feed/get_informacoes_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'informativos_controller.g.dart';

@Injectable()
class InformativosController = _InformativosControllerBase
    with _$InformativosController;

abstract class _InformativosControllerBase with Store {
  final _getInformacoes = getIt.get<GetInformacoesUseCase>();

  @observable
  ResourceData<List<FeedEntity>> infor;

  @action
  init() async {
    infor = ResourceData(status: Status.loading);
    infor = await _getInformacoes();
  }
}
