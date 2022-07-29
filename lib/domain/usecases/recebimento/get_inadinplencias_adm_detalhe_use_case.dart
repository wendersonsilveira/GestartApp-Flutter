import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_detalhe_entity.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInadimplenciasAdmUseDetalheUseCase extends BaseFutureUseCase<
    SendParamsRelInadimplenciaEntity,
    ResourceData<List<InadimplenciaAdmDetalheEntity>>> {
  RecebimentoRepository _recebimentoRepository;

  GetInadimplenciasAdmUseDetalheUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<InadimplenciaAdmDetalheEntity>>> call(
      [SendParamsRelInadimplenciaEntity filtro]) {
    return _recebimentoRepository.getInadimplenciasUnidade(filtro);
  }
}
