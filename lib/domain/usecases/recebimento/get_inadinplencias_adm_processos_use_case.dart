import 'package:Gestart/domain/entities/recebimento/inadimplencia_processos_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInadimplenciasAdmProcessosUseCase extends BaseFutureUseCase<int,
    ResourceData<List<ProcessoInadimplenciasEntity>>> {
  RecebimentoRepository _recebimentoRepository;

  GetInadimplenciasAdmProcessosUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<ProcessoInadimplenciasEntity>>> call([int codOrd]) {
    return _recebimentoRepository.getProcessosInadimplenciasUnidade(codOrd);
  }
}
