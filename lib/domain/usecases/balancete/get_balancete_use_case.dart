import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/repositories/balancete/balancete_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBalanceteUseCase
    extends BaseFutureUseCase<int, ResourceData<BalanceteEntity>> {
  BalanceteRepository _balanceteRepository;

  GetBalanceteUseCase(this._balanceteRepository);

  @override
  Future<ResourceData<BalanceteEntity>> call([int id]) {
    return _balanceteRepository.getBalancete(id);
  }
}
