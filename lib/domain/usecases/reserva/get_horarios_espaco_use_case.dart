import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/repositories/reserva/horarios_espaco_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHorariosEspacosUseCase
    extends BaseFutureUseCase<int, ResourceData<List<HorarioEspacoEntity>>> {
  HorariosEspacoRepository _horariosEspacoRepository;

  GetHorariosEspacosUseCase(this._horariosEspacoRepository);

  @override
  Future<ResourceData<List<HorarioEspacoEntity>>> call(
      [int espacoId, String data]) {
    return _horariosEspacoRepository.getHorariosEspaco(espacoId, data);
  }
}
