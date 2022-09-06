import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/repositories/feed/feed_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCondomComunicadosUseCase
    extends BaseFutureUseCase<int, ResourceData<List<FeedEntity>>> {
  FeedRepository _feedRepository;

  GetCondomComunicadosUseCase(this._feedRepository);

  @override
  Future<ResourceData<List<FeedEntity>>> call([int codcon]) {
    return _feedRepository.getComunicadosCondom(codcon);
  }
}
