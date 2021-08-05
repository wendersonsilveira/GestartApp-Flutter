import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/domain/usecases/cominicacao/get_avisos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'avisos_page_controller.g.dart';

@Injectable()
class AvisosPageController = _AvisosPageControllerBase with _$AvisosPageController;

abstract class _AvisosPageControllerBase with Store {
  final _getAvisos = getIt.get<GetAvisosUseCase>();

  @observable
  List<AvisoEntity> avisos;

  int codCon;

  @action
  getAvisos() async {
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');
    ResourceData r = await _getAvisos(codCon);
    avisos = r.data;
  }
}
