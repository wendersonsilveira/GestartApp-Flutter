import 'package:Gestart/domain/repositories/boleto/boleto_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLinkParcelamentoUseCase
    extends BaseFutureUseCase<String, ResourceData<String>> {
  BoletoRepository _boletoRepository;

  GetLinkParcelamentoUseCase(this._boletoRepository);

  @override
  Future<ResourceData<String>> call([String entity]) {
    return _boletoRepository.getLinkParcelamento(entity);
  }
}
