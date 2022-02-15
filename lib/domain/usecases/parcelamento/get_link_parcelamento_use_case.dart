import 'package:Gestart/domain/repositories/parcelamento/parcelamento_boleto_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLinkParcelamentoUseCase
    extends BaseFutureUseCase<String, ResourceData<String>> {
  ParcelamentoBoletoRepository _boletoParcelamentoRepository;

  GetLinkParcelamentoUseCase(this._boletoParcelamentoRepository);

  @override
  Future<ResourceData<String>> call([String entity]) {
    return _boletoParcelamentoRepository.getLinkParcelamento(entity);
  }
}
