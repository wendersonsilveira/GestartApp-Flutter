import 'package:Gestart/data/datasource/parcelamento/parelamento_boleto_remote_data_source.dart';
import 'package:Gestart/domain/repositories/parcelamento/parcelamento_boleto_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class ParcelamentoBoletoRepositoryImpl implements ParcelamentoBoletoRepository {
  ParcelamentoBoletoRemoteDataSource _parcelamentoboletoRemoteDataSource;

  ParcelamentoBoletoRepositoryImpl(this._parcelamentoboletoRemoteDataSource);

  @override
  Future<ResourceData<String>> getLinkParcelamento(String identificador) async {
    final resource = await _parcelamentoboletoRemoteDataSource
        .getLinkParcelamento(identificador);

    return resource;
  }
}
