import 'package:Gestart/domain/entities/admin-cadastro/resumo_unidade_entity.dart';
import 'package:Gestart/domain/repositories/adm-cadastros/resumo_unidade_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetResumoUnidadeUseCase extends BaseFutureUseCase<int, ResourceData<ResumoUnidadeEntity>> {
  ResumoUnidadeRepository _unidadeRepository;

  GetResumoUnidadeUseCase(this._unidadeRepository);

  @override
  Future<ResourceData<ResumoUnidadeEntity>> call([int codCon]) {
    return _unidadeRepository.getResumoUnidade(codCon);
  }
}
