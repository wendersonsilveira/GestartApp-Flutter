import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCondominioPorCpfUseCase
    extends BaseFutureUseCase<void, ResourceData<List<CondominioEntity>>> {
  CondominioRepository _condominioRepository;

  GetCondominioPorCpfUseCase(this._condominioRepository);

  @override
  Future<ResourceData<List<CondominioEntity>>> call([void entity]) {
    return _condominioRepository.getCondominiosPorCpf();
  }
}
