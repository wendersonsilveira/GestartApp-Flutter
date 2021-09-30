import 'package:Gestart/domain/entities/condominio/emails_ativacao_entity.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEmailAtivacaoUseCase
    extends BaseFutureUseCase<void, ResourceData<List<EmailAtivacaoEntity>>> {
  CondominioRepository _condominioRepository;

  GetEmailAtivacaoUseCase(this._condominioRepository);

  @override
  Future<ResourceData<List<EmailAtivacaoEntity>>> call([void entity]) {
    return _condominioRepository.getEmailsAtivacao();
  }
}
