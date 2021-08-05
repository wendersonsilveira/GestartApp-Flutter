import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class ComunicacaoRepository {
  Future<ResourceData<List<AvisoEntity>>> getAvisos(int codCon);
  Future<ResourceData> createAviso(AvisoEntity aviso);
  Future<ResourceData<AvisoEntity>> getAviso(int avisoId);
}
