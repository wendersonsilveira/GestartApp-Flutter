import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/data/datasource/reserva/reserva_remote_data_source.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class ReservaRepositoryImpl implements ReservaRepository {
  ReservaRemoteDataSource _reservaRemoteDataSource;

  ReservaRepositoryImpl(this._reservaRemoteDataSource);

  @override
  Future<ResourceData<List<ReservaEntity>>> getReservas() async {
    final resource = await _reservaRemoteDataSource.getReservas();

    return resource;
  }

  @override
  Future<ResourceData> criarReserva(data) async {
    final resource = await _reservaRemoteDataSource.criarReserva(data);

    return resource;
  }

  @override
  Future<ResourceData<List<HoraEntity>>> getHoras() async {
    final resource = await _reservaRemoteDataSource.getHoras();

    return resource;
  }
}
