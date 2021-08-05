import 'package:Gestart/domain/entities/contas/mov_financeiro_meses_entity.dart';
import 'package:Gestart/domain/repositories/contas/contas_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovFinanceiroMesesUseCase extends BaseFutureUseCase<int,
    ResourceData<List<MovFinanceiroMesesEntity>>> {
  ContasRepository _contasRepository;

  GetMovFinanceiroMesesUseCase(this._contasRepository);

  @override
  Future<ResourceData<List<MovFinanceiroMesesEntity>>> call([int codCon]) {
    return _contasRepository.getMovFinanceiroMeses(codCon);
  }
}
