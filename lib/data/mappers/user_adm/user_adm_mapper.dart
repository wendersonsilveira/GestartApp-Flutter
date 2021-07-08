import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';

extension UserAdmMapper on UserAdmEntity {
  UserAdmEntity copyWith({
    String nomAdm,
    String datIni,
    String datFin,
    int codCar,
    String codImo,
    String nomCar,
    String perfil,
    int codCon,
    String nomCon,
    String endCon,
    String baiCon,
    String cidade,
    String estado,
    String cep,
    String cgcCon,
    String apelido,
    String codImoCdm,
    int codOrdAdm,
    String logo,
    String linkPhoto,
  }) {
    return UserAdmEntity(
      nomAdm: nomAdm ?? this.nomAdm,
      datIni: datIni ?? this.datIni,
      datFin: datFin ?? this.datFin,
      codCar: codCar ?? this.codCar,
      codImo: codImo ?? this.codImo,
      nomCar: nomCar ?? this.nomCar,
      perfil: perfil ?? this.perfil,
      codCon: codCon ?? this.codCon,
      nomCon: nomCon ?? this.nomCon,
      endCon: endCon ?? this.endCon,
      baiCon: baiCon ?? this.baiCon,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      cep: cep ?? this.cep,
      cgcCon: cgcCon ?? this.cgcCon,
      apelido: apelido ?? this.apelido,
      codImoCdm: codImoCdm ?? this.codImoCdm,
      codOrdAdm: codOrdAdm ?? this.codOrdAdm,
      logo: logo ?? this.logo,
      linkPhoto: linkPhoto ?? this.linkPhoto,
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
      codord: map['CODORD'],
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
