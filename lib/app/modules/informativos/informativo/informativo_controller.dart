import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/usecases/feed/get_aviso_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'informativo_controller.g.dart';

@Injectable()
class InformativoController = _InformativoControllerBase
    with _$InformativoController;

abstract class _InformativoControllerBase with Store {
  final _getAviso = getIt.get<GetAvisoUseCase>();

  @observable
  ResourceData<FeedEntity> aviso;

  @action
  init(int id) async {
    aviso = ResourceData(status: Status.loading);
    aviso = await _getAviso(id);
  }
}
