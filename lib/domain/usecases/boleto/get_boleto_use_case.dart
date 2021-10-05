import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';
import 'package:Gestart/domain/repositories/boleto/boleto_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBoletoUseCase
    extends BaseFutureUseCase<int, ResourceData<DetalheBoletoEntity>> {
  BoletoRepository _boletoRepository;

  GetBoletoUseCase(this._boletoRepository);

  @override
  Future<ResourceData<DetalheBoletoEntity>> call([int codord]) {
    return _boletoRepository.getBoleto(codord);
  }
}
