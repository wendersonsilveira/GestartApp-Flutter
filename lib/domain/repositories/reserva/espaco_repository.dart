import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class EspacoRepository {
  Future<ResourceData<List<EspacoEntity>>> getEspacos(int espacoId);
  Future<ResourceData<EspacoEntity>> getEspaco(int espacoId);
  Future<ResourceData> excluirEspaco(int espacoId);
  Future<ResourceData> criarEspaco(EspacoEntity espaco);
}
