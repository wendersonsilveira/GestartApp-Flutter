import 'package:Gestart/data/datasource/pet/pet_remote_data_source.dart';
import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/repositories/pet/pet_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class PetRepositoryImpl implements PetRepository {
  PetRemoteDataSource _petRemoteDataSource;

  PetRepositoryImpl(this._petRemoteDataSource);

  @override
  Future<ResourceData> createPet(PetEntity pet) async {
    final resource = await _petRemoteDataSource.createPet(pet);

    return resource;
  }

  @override
  Future<ResourceData<List<PetEntity>>> getPets() async {
    final resource = await _petRemoteDataSource.getPets();

    return resource;
  }

  @override
  Future<ResourceData<PetEntity>> getPet(int id) async {
    final resource = await _petRemoteDataSource.getPet(id);

    return resource;
  }
}
