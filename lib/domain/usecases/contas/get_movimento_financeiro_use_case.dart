import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/repositories/contas/contas_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovFinanceiroUseCase extends BaseFutureUseCase<MovFinanceiroEntity,
    ResourceData<List<MovFinanceiroEntity>>> {
  ContasRepository _contasRepository;

  GetMovFinanceiroUseCase(this._contasRepository);

  @override
  Future<ResourceData<List<MovFinanceiroEntity>>> call(
      [MovFinanceiroEntity entity]) {
    return _contasRepository.getMovFinanceiro(entity);
  }
}
