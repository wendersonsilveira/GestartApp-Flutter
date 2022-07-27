import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInadimplenciasAdmIncidenciasUseCase extends BaseFutureUseCase<int,
    ResourceData<List<IncidenciaInadimplenciasEntity>>> {
  RecebimentoRepository _recebimentoRepository;

  GetInadimplenciasAdmIncidenciasUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<IncidenciaInadimplenciasEntity>>> call(
      [int codOrd]) {
    return _recebimentoRepository.getIncidenciasInadimplenciasUnidade(codOrd);
  }
}
