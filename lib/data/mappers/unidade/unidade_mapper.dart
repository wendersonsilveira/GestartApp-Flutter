import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';

extension UnidadeMapper on UnidadeEntity {
  UnidadeEntity copyWith({
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
    return UnidadeEntity(
      codcon: codcon ?? this.codcon,
      nompro: nompro ?? this.nompro,
      codimo: codimo ?? this.codimo,
      codord: codord ?? this.codord,
      nomcon: nomcon ?? this.nomcon,
      parentCondonUserId: parentCondonUserId ?? this.parentCondonUserId,
      condonUserId: condonUserId ?? this.condonUserId,
      perfil: perfil ?? this.perfil,
      apelido: apelido ?? this.apelido,
      logo: logo ?? this.logo,
      gestartapp: gestartapp ?? this.gestartapp,
      gestartappReserva: gestartappReserva ?? this.gestartappReserva,
    );
  }

  List<UnidadeEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  UnidadeEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UnidadeEntity(
      codcon: map['CODCON'],
      nompro: map['NOMPRO'],
      codimo: map['CODIMO'],
      nomcon: map['NOMCON'],
      parentCondonUserId: map['PARENT_CONDON_USER_ID'],
      condonUserId: map['CONDON_USER_ID'],
      perfil: map['PERFIL'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
      gestartapp: map['GESTARTAPP'],
      gestartappReserva: map['GESTARTAPP_RESERVA'],
    );
  }
}
