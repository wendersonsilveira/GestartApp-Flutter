import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class PetRepository {
  Future<ResourceData> createPet(PetEntity pet);
  Future<ResourceData<List<PetEntity>>> getPets();
  Future<ResourceData<PetEntity>> getPet(int id);
  Future<ResourceData> deletePet(int id);
}
