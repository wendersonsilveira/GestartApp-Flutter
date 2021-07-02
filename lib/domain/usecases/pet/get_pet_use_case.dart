import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/repositories/pet/pet_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPetUseCase extends BaseFutureUseCase<int, ResourceData<PetEntity>> {
  PetRepository _petRepository;

  GetPetUseCase(this._petRepository);

  @override
  Future<ResourceData<PetEntity>> call([int id]) {
    return _petRepository.getPet(id);
  }
}
