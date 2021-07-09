import 'package:Gestart/domain/entities/documento/documento_entity.dart';
import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/repositories/feed/feed_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInformacoesUseCase
    extends BaseFutureUseCase<void, ResourceData<List<FeedEntity>>> {
  FeedRepository _feedRepository;

  GetInformacoesUseCase(this._feedRepository);

  @override
  Future<ResourceData<List<FeedEntity>>> call([void entity]) {
    return _feedRepository.getInformacoes();
  }
}
