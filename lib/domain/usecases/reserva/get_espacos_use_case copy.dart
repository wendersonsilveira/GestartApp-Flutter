import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/repositories/reserva/espaco_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEspacosUseCase
    extends BaseFutureUseCase<int, ResourceData<List<EspacoEntity>>> {
  EspacoRepository _espacoRepository;

  GetEspacosUseCase(this._espacoRepository);

  @override
  Future<ResourceData<List<EspacoEntity>>> call([int codcon]) {
    return _espacoRepository.getEspacos(codcon);
  }
}
