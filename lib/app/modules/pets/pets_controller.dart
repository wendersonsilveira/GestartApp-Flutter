import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/usecases/pet/get_all_pets_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

part 'pets_controller.g.dart';

@Injectable()
class PetsController = _PetsControllerBase with _$PetsController;

abstract class _PetsControllerBase with Store {
  final _getAllPets = getIt.get<GetAllPetsUseCase>();

  @observable
  ResourceData<List<PetEntity>> pets;

  @action
  void increment() {}

  @action
  getPets() async {
    pets = await _getAllPets();
  }
}
