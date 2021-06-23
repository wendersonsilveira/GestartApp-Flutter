import 'package:Gestart/domain/utils/resource_data.dart';

abstract class AuthRepository {
  Future<ResourceData<int>> checkUser(cpfCnpj);
}
