import 'package:Gestart/domain/entities/setup/setup_entity.dart';
import 'package:Gestart/domain/repositories/setup/setup_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSetupUseCase
    extends BaseFutureUseCase<int, ResourceData<SetupEntity>> {
  SetupRepository _setupRepository;

  GetSetupUseCase(this._setupRepository);

  @override
  Future<ResourceData<SetupEntity>> call([int codCon]) {
    return _setupRepository.getSetup(codCon);
  }
}
