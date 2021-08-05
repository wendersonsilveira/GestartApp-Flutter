import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/domain/usecases/cominicacao/create_aviso_use_case.dart';
import 'package:Gestart/domain/usecases/cominicacao/get_aviso_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/data/mappers/comunicacao/aviso_mapper.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastro_aviso_page_controller.g.dart';

@Injectable()
class CadastroAvisoPageController = _CadastroAvisoPageControllerBase with _$CadastroAvisoPageController;

abstract class _CadastroAvisoPageControllerBase with Store {
  final _createAviso = getIt.get<CreateAvisoUseCase>();
  final _getAviso = getIt.get<GetAvisoAdmUseCase>();
  AvisoEntity aviso;
  @action
  Future<ResourceData> createAviso({codCon, title, descri, id = 0}) async {
    AvisoEntity aviso = new AvisoEntity(codCon: codCon, att: title, descri: descri, id: id);

    return await _createAviso(aviso);
  }

  @action
  Future<AvisoEntity> getAviso(int avisoId) async {
    ResourceData r = await _getAviso(avisoId);
    aviso = r.data;

    return aviso;
  }
}
