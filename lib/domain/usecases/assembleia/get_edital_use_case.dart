import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:Gestart/domain/repositories/assembleia/assembleia_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEditalUseCase
    extends BaseFutureUseCase<int, ResourceData<List<EditalEntity>>> {
  AssembleiaRepository _assembleiaRepository;

  GetEditalUseCase(this._assembleiaRepository);

  @override
  Future<ResourceData<List<EditalEntity>>> call([int id]) {
    return _assembleiaRepository.getEdital(id);
  }
}
