import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class HorariosEspacoRepository {
  Future<ResourceData<List<HorarioEspacoEntity>>> getHorariosEspaco(
      int espacoId, String data);
}
