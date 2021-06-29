import 'package:Gestart/domain/entities/assembleia/editais_entity.dart';
import 'package:Gestart/domain/repositories/assembleia/assembleia_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEditaisUseCase
    extends BaseFutureUseCase<void, ResourceData<List<EditaisEntity>>> {
  AssembleiaRepository _assembleiaRepository;

  GetEditaisUseCase(this._assembleiaRepository);

  @override
  Future<ResourceData<List<EditaisEntity>>> call([void cpfCnpj]) {
    return _assembleiaRepository.getEditais();
  }
}
