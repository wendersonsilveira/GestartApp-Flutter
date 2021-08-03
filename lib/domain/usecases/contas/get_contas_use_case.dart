import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/domain/repositories/contas/contas_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetContasUseCase
    extends BaseFutureUseCase<int, ResourceData<List<ContasEntity>>> {
  ContasRepository _contasRepository;

  GetContasUseCase(this._contasRepository);

  @override
  Future<ResourceData<List<ContasEntity>>> call([int entity]) {
    return _contasRepository.getContas(entity);
  }
}
