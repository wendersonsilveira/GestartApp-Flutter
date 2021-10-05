import 'package:Gestart/domain/entities/recebimento/pagamento_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPagamentosUseCase extends BaseFutureUseCase<Map<String, dynamic>, ResourceData> {
  RecebimentoRepository _recebimentoRepository;

  GetPagamentosUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<PagamentoEntity>>> call([Map<String, dynamic> filtro]) {
    return _recebimentoRepository.getPagamentos(filtro);
  }
}
