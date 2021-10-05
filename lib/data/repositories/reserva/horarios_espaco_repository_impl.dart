import 'package:Gestart/data/datasource/reserva/horarios_espaco_remote_data_source.dart';
import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/repositories/reserva/horarios_espaco_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class HorariosEspacoRepositoryImpl implements HorariosEspacoRepository {
  HorariosEspacoRemoteDataSource _horariosEspacoRemoteDataSource;

  HorariosEspacoRepositoryImpl(this._horariosEspacoRemoteDataSource);

  @override
  Future<ResourceData<List<HorarioEspacoEntity>>> getHorariosEspaco(
      int espacoId, String data) async {
    final resource =
        await _horariosEspacoRemoteDataSource.getHorariosEspaco(espacoId, data);

    return resource;
  }
}
