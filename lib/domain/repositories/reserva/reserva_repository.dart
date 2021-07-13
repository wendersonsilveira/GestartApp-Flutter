import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class ReservaRepository {
  Future<ResourceData<List<ReservaEntity>>> getReservas();
  Future<ResourceData<List<HoraEntity>>> getHoras();
}
