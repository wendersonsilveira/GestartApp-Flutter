import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';
import 'package:Gestart/domain/repositories/taxa/taxa_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTaxasUseCase
    extends BaseFutureUseCase<int, ResourceData<List<TaxaEntity>>> {
  TaxaRepository _taxaRepository;

  GetTaxasUseCase(this._taxaRepository);

  @override
  Future<ResourceData<List<TaxaEntity>>> call([int entity]) {
    return _taxaRepository.getTaxa(entity);
  }
}
