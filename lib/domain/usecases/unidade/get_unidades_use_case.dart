import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_ativo_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/repositories/unidade/unidade_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUnidadesUseCase
    extends BaseFutureUseCase<void, ResourceData<List<UnidadeEntity>>> {
  UnidadeRepository _unidadeRepository;

  GetUnidadesUseCase(this._unidadeRepository);

  @override
  Future<ResourceData<List<UnidadeEntity>>> call([void entity]) {
    return _unidadeRepository.getUnidades();
  }
}
