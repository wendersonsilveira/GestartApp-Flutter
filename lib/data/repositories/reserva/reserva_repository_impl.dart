import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/data/datasource/reserva/reserva_remote_data_source.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ReservaRepositoryImpl implements ReservaRepository {
  ReservaRemoteDataSource _reservaRemoteDataSource;

  ReservaRepositoryImpl(this._reservaRemoteDataSource);

  @override
  Future<ResourceData<List<ReservaEntity>>> getReservas() async {
    final resource = await _reservaRemoteDataSource.getReservas();

    return resource;
  }

  @override
  Future<ResourceData<List<ReservaEntity>>> getReservasRelatorio(
      SendParamsRelReservaEntity params) async {
    final resource =
        await _reservaRemoteDataSource.getReservasRelatorio(params);

    return resource;
  }

  @override
  Future<ResourceData<dynamic>> getReservasRelatorioPDF(
      SendParamsRelReservaEntity params) async {
    final resource =
        await _reservaRemoteDataSource.getReservasRelatorioPDF(params);
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

  @override
  Future<ResourceData> cancelarReserva(int id) async {
    final resource = await _reservaRemoteDataSource.cancelarReserva(id);

    return resource;
  }

  @override
  Future<ResourceData<List<ReservaEntity>>> getReservasAdm(int codCon) async {
    final resource = await _reservaRemoteDataSource.getReservasAdm(codCon);

    return resource;
  }

  @override
  Future<ResourceData> aprovarReserva(int reservaId) async {
    final resource = await _reservaRemoteDataSource.aprovarReservar(reservaId);

    return resource;
  }

  @override
  Future<ResourceData> rejeitarReserva(int reservaId) async {
    final resource = await _reservaRemoteDataSource.rejeitarReservar(reservaId);

    return resource;
  }

  @override
  Future<ResourceData<ReservaEntity>> getReservaAdm(int idReserva) async {
    final resource = await _reservaRemoteDataSource.getReservaAdm(idReserva);

    return resource;
  }

  @override
  Future<ResourceData<ReservaEntity>> getReserva(int idReserva) async {
    final resource = await _reservaRemoteDataSource.getReserva(idReserva);

    return resource;
  }
}
