import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/usecases/pet/get_pet_use_case.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/usecases/pet/create_pet_use_case.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

part 'cadastro_pet_controller.g.dart';

@Injectable()
class CadastroPetController = _CadastroPetControllerBase
    with _$CadastroPetController;

abstract class _CadastroPetControllerBase with Store {
  final _createPet = getIt.get<CreatePetUseCase>();
  final _getPet = getIt.get<GetPetUseCase>();
  ResourceData<PetEntity> pet;
  ResourceData loadingPet;

  @observable
  bool loadingForm = false;

  @action
  Future<ResourceData> createPet(PetEntity pet) async {
    alteraLoading(false);
    loadingPet = ResourceData(status: Status.loading);
    loadingPet = await _createPet(pet);
    return loadingPet;
  }

  @action
  Future<ResourceData<PetEntity>> getPet(int id) async {
    pet = ResourceData(status: Status.loading);
    pet = await _getPet(id);
    alteraLoading(true);
    return pet;
  }

  @action
  void alteraLoading(bool value) => loadingForm = value;
}
