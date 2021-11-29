import 'package:Gestart/domain/utils/resource_data.dart';

abstract class ParcelamentoBoletoRepository {
  Future<ResourceData<String>> getLinkParcelamento(String identificador);
}
