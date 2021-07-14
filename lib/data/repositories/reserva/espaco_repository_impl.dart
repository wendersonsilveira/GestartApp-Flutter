import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/data/datasource/reserva/espaco_remote_data_source.dart';
import 'package:Gestart/domain/repositories/reserva/espaco_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class EspacoRepositoryImpl implements EspacoRepository {
  EspacoRemoteDataSource _espacoRemoteDataSource;

  EspacoRepositoryImpl(this._espacoRemoteDataSource);

  @override
  Future<ResourceData<List<EspacoEntity>>> getEspacos(int codcon) async {
    final resource = await _espacoRemoteDataSource.getEspacos(codcon);

    return resource;
  }

  @override
  Future<ResourceData<EspacoEntity>> getEspaco(int espacoId) async {
    final resource = await _espacoRemoteDataSource.getEspaco(espacoId);

    return resource;
  }

  @override
  Future<ResourceData> criarEspaco(EspacoEntity espaco) async {
    final resource = await _espacoRemoteDataSource.criarEspaco(espaco);

    return resource;
  }
}
