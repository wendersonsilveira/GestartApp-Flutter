import 'package:Gestart/domain/entities/condominio/condominio_ativo_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';

extension CondominiosAtivosMapper on CondominiosAtivosEntity {
  CondominiosAtivosEntity copyWith({
    int codcon,
    String nompro,
    String codimo,
    int codord,
    String nomcon,
    int parentCondonUserId,
    int condonUserId,
    String perfil,
    String apelido,
    String logo,
    int gestartapp,
    int gestartappReserva,
  }) {
    return CondominiosAtivosEntity(
      codcon: codcon ?? this.codcon,
      nomcon: nomcon ?? this.nomcon,
      apelido: apelido ?? this.apelido,
      logo: logo ?? this.logo,
      gestartapp: gestartapp ?? this.gestartapp,
      gestartappReserva: gestartappReserva ?? this.gestartappReserva,
    );
  }

  List<CondominiosAtivosEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  CondominiosAtivosEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CondominiosAtivosEntity(
      codcon: map['CODCON'],
      nomcon: map['NOMCON'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
      gestartapp: map['GESTARTAPP'],
      gestartappReserva: map['GESTARTAPP_RESERVA'],
    );
  }
}
