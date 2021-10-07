import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class ReservaRepository {
  Future<ResourceData<List<ReservaEntity>>> getReservas();
  Future<ResourceData<ReservaEntity>> getReserva(int idReserva);
  Future<ResourceData<List<HoraEntity>>> getHoras();
  Future<ResourceData> criarReserva(var data);
  Future<ResourceData> cancelarReserva(int id);
  Future<ResourceData<List<ReservaEntity>>> getReservasAdm(int codCon);
  Future<ResourceData<ReservaEntity>> getReservaAdm(int idReserva);
  Future<ResourceData> aprovarReserva(int reservaId);
  Future<ResourceData> rejeitarReserva(int reservaId);
}
