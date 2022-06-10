import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/repositories/balancete/balancete_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBalancetesUseCase
    extends BaseFutureUseCase<void, ResourceData<List<BalanceteEntity>>> {
  BalanceteRepository _balanceteRepository;

  GetBalancetesUseCase(this._balanceteRepository);

  @override
  Future<ResourceData<List<BalanceteEntity>>> call([void pet]) {
    return _balanceteRepository.getBalancetes();
  }
}
