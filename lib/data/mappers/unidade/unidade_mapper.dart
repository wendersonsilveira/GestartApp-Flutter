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
    String propri
  }) {
    return UnidadeEntity(
      codcon: codcon ?? this.codcon,
      nompro: nompro ?? this.nompro,
      codimo: codimo ?? this.codimo,
      codord: codord ?? this.codord,
      nomcon: nomcon ?? this.nomcon,
      propri: propri ?? this.propri,
      parentCondonUserId: parentCondonUserId ?? this.parentCondonUserId,
      condonUserId: condonUserId ?? this.condonUserId,
      perfil: perfil ?? this.perfil,
      apelido: apelido ?? this.apelido,
      logo: logo ?? this.logo,
      gestartapp: gestartapp ?? this.gestartapp,
      gestartappReserva: gestartappReserva ?? this.gestartappReserva,
    );
  }

  List<UnidadeEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  UnidadeEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UnidadeEntity(
      codcon: map['CODCON'],
      nompro: map['NOMPRO'] != null
          ? map['NOMPRO']
          : map['unidade'] != null
              ? map['unidade']['NOMPRO']
              : null,
      codimo: map['CODIMO'] != null
          ? map['CODIMO']
          : map['unidade'] != null
              ? map['unidade']['CODIMO']
              : null,
      codord: map['CODORD'],
      nomcon: map['NOMCON'],
      parentCondonUserId: map['PARENT_CONDON_USER_ID'],
      condonUserId: map['CONDON_USER_ID'],
      perfil: map['PERFIL'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
      gestartapp: map['GESTARTAPP'],
      gestartappReserva: map['GESTARTAPP_RESERVA'],
      propri: map['PROPRI'] != null
          ? map['PROPRI']
          : map['unidade'] != null
              ? map['unidade']['PROPRI']
              : null,
      cgcpro: map['CGCPRO'],
      asInquilino: map['AS_INQUILINO'],
      isUser: map['IS_USER'],
      veiculos: map['VEICULOS'],
      pets: map['PETS'],
      endPro: map['ENDPRO'] != null
          ? map['ENDPRO']
          : map['unidade'] != null
              ? map['unidade']['ENDPRO']
              : null,
      petsList: map['pets'] != null ? map['pets'] : null,
      veiculosList: map['veiculos'] != null ? map['veiculos'] : null,
      telefones: map['telefones'] != null ? map['telefones'] : null,
      emails: map['emails'] != null ? map['emails'] : null,
      endinq: map['unidade'] != null ? map['unidade']['ENDINQ'] : null,
      cidinq: map['unidade'] != null ? map['unidade']['CIDINQ'] : null,
      baiinq: map['unidade'] != null ? map['unidade']['BAIINQ'] : null,
      foninq1: map['unidade'] != null ? map['unidade']['FONINQ_1'] : null,
      foninq2: map['unidade'] != null ? map['unidade']['FONINQ_2'] : null,
      foninq3: map['unidade'] != null ? map['unidade']['FONINQ_3'] : null,
    );
  }
}
