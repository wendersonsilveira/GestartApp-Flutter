import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class CondominioRepository {
  Future<ResourceData<List<CondominioEntity>>> getCondominiosPorCpf();
  Future<ResourceData<UnidadeAtivaEntity>> getCondominiosAtivos();
  Future<ResourceData<List<CondominiosAtivosEntity>>> getAllCondominiosAtivos();
  Future<ResourceData<List<UserAdmEntity>>> getInforAdmCondominios();
}
