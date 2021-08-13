import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class FeedRepository {
  Future<ResourceData<List<FeedEntity>>> getInformacoes();
  Future<ResourceData<FeedEntity>> getAviso(int id);
}
