import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/repositories/feed/feed_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAvisoUseCase extends BaseFutureUseCase<int, ResourceData<FeedEntity>> {
  FeedRepository _feedRepository;

  GetAvisoUseCase(this._feedRepository);

  @override
  Future<ResourceData<FeedEntity>> call([int entity]) {
    return _feedRepository.getAviso(entity);
  }
}
