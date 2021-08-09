import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/domain/entities/contas/extrato_financeiro_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_meses_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class ContasRepository {
  Future<ResourceData<List<ContasEntity>>> getContas(int codCon);
  Future<ResourceData<List<MovFinanceiroEntity>>> getMovFinanceiro(
      MovFinanceiroEntity entity);
  Future<ResourceData<List<MovFinanceiroMesesEntity>>> getMovFinanceiroMeses(
      int codCon);
  Future<ResourceData<List<ExtratoFinanceiroEntity>>> getExtratoFinanceiro(
      MovFinanceiroEntity entity);
}
