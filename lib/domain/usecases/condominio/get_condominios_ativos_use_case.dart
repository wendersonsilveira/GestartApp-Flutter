import 'package:Gestart/domain/entities/condominio/condominio_ativo_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCondominiosAtivosUseCase extends BaseFutureUseCase<void,
    ResourceData<List<CondominiosAtivosEntity>>> {
  CondominioRepository _condominioRepository;

  GetCondominiosAtivosUseCase(this._condominioRepository);

  @override
  Future<ResourceData<List<CondominiosAtivosEntity>>> call([void entity]) {
    return _condominioRepository.getAllCondominiosAtivos();
  }
}
