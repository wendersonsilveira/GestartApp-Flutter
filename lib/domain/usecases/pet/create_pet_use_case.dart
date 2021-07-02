import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/repositories/pet/pet_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreatePetUseCase extends BaseFutureUseCase<PetEntity, ResourceData> {
  PetRepository _petRepository;

  CreatePetUseCase(this._petRepository);

  @override
  Future<ResourceData> call([PetEntity pet]) {
    return _petRepository.createPet(pet);
  }
}
