import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/repositories/boleto/boleto_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBoletosUnidadeUseCase
    extends BaseFutureUseCase<int, ResourceData<List<BoletoEntity>>> {
  BoletoRepository _boletoRepository;

  GetBoletosUnidadeUseCase(this._boletoRepository);

  @override
  Future<ResourceData<List<BoletoEntity>>> call([int codord]) {
    return _boletoRepository.getBoletosUnidade(codord);
  }
}
