import 'package:Gestart/domain/repositories/pet/pet_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeletePetUseCase extends BaseFutureUseCase<int, ResourceData> {
  PetRepository _petRepository;

  DeletePetUseCase(this._petRepository);

  @override
  Future<ResourceData> call([int id]) {
    return _petRepository.deletePet(id);
  }
}
