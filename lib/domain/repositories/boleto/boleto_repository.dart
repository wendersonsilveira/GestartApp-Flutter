import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class BoletoRepository {
  Future<ResourceData<List<BoletoEntity>>> getBoletos();
  Future<ResourceData<List<BoletoEntity>>> getBoletosUnidade(int codord);
  Future<ResourceData<DetalheBoletoEntity>> getBoletoUnidade(String conts);
  Future<ResourceData<DetalheBoletoEntity>> getBoleto(int codord);
  Future<ResourceData<String>> getLinkParcelamento(String identificador);
}
