import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHistoricoInadimUseCase extends BaseFutureUseCase<int, ResourceData> {
  RecebimentoRepository _recebimentoRepository;

  GetHistoricoInadimUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<HistoricoInadimEntity>>> call([int codOrd]) {
    return _recebimentoRepository.getHistoricoInadim(codOrd);
  }
}
