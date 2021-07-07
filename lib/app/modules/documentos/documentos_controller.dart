import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/entities/documento/documento_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
import 'package:Gestart/domain/usecases/documento/get_documento_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'documentos_controller.g.dart';

@Injectable()
class DocumentosController = _DocumentosControllerBase
    with _$DocumentosController;

abstract class _DocumentosControllerBase with Store {
  final _getDocumentos = getIt.get<GetDocumentoUseCase>();
  final _getCondominios = getIt.get<GetCondominiosAtivosUseCase>();

  @observable
  ResourceData<List<DocumentoEntity>> documentos;

  @observable
  ResourceData<List<CondominiosAtivosEntity>> condominios;

  @observable
  List<DocumentoEntity> listaView;

  init() async {
    documentos = ResourceData(status: Status.loading);
    condominios = await _getCondominios();
    documentos = await _getDocumentos();
    listaView = documentos.data;
  }

  @action
  changeDropdown(int codCond) {
    listaView = documentos.data.where((i) => i.codCon == codCond).toList();
  }
}
