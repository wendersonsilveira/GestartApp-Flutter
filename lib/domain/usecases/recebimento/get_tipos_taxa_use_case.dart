import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTiposTaxaUseCase extends BaseFutureUseCase<int, ResourceData> {
  RecebimentoRepository _recebimentoRepository;

  GetTiposTaxaUseCase(this._recebimentoRepository);

  @override
  Future<ResourceData<List<TipoTaxaEntity>>> call([int codCon]) {
    return _recebimentoRepository.getTiposTaxa(codCon);
  }
}
