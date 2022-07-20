import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';
import 'package:Gestart/domain/repositories/boleto/boleto_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBoletoUnidadeUseCase
    extends BaseFutureUseCase<String, ResourceData<DetalheBoletoEntity>> {
  BoletoRepository _boletoRepository;

  GetBoletoUnidadeUseCase(this._boletoRepository);

  @override
  Future<ResourceData<DetalheBoletoEntity>> call([String conts]) {
    return _boletoRepository.getBoletoUnidade(conts);
  }
}
