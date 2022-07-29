import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_infor_entity.dart';
import 'package:Gestart/domain/repositories/unidade/unidade_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUnidadesFiltroUseCase extends BaseFutureUseCase<int, ResourceData<List<UnidadeInforEntity>>> {
  UnidadeRepository _unidadeRepository;

  GetUnidadesFiltroUseCase(this._unidadeRepository);

  @override
  Future<ResourceData<List<UnidadeInforEntity>>> call([int filtro]) {
    return _unidadeRepository.getUnidadesFiltro(filtro);
  }
}
