import 'package:Gestart/domain/entities/recebimento/inadimplencia_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInadimplenciaUseCase extends BaseFutureUseCase<Map<String, dynamic>, ResourceData> {
  RecebimentoRepository _recebimentoRepository;

  GetInadimplenciaUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<InadimplenciaEntity>>> call([Map<String, dynamic> filtro]) {
    return _recebimentoRepository.getInadimplencia(filtro);
  }
}
