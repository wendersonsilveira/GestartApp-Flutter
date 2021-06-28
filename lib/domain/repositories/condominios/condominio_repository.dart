import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_ativo_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class CondominioRepository {
  Future<ResourceData<List<CondominioEntity>>> getCondominiosPorCpf();
  Future<ResourceData<CondominioAtivoEntity>> getCondominiosAtivos();
}
