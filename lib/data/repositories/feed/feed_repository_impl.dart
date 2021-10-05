import 'package:Gestart/data/datasource/feed/feed_data_source.dart';
import 'package:Gestart/domain/entities/feed/feed_entity.dart';
import 'package:Gestart/domain/repositories/feed/feed_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class FeedRepositoryImpl implements FeedRepository {
  FeedRemoteDataSource _feedRemoteDataSource;

  FeedRepositoryImpl(this._feedRemoteDataSource);

  @override
  Future<ResourceData<List<FeedEntity>>> getInformacoes() async {
    final resource = await _feedRemoteDataSource.getInformacoes();

    return resource;
  }

  @override
  Future<ResourceData<FeedEntity>> getAviso(int id) async {
    final resource = await _feedRemoteDataSource.getAviso(id);

    return resource;
  }
}
