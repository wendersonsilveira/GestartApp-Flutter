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
      codImoAdm: codImoCdm ?? this.codImoAdm,
      codOrdAdm: codOrdAdm ?? this.codOrdAdm,
      logo: logo ?? this.logo,
      linkPhoto: linkPhoto ?? this.linkPhoto,
    );
  }

  List<UserAdmEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  UserAdmEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserAdmEntity(
      nomAdm: map['NOMADM'],
      datIni: DateTime.parse(map['DATINI']),
      datFin: DateTime.parse(map['DATFIN']),
      codCar: map['CODCAR'],
      codImo: map['CODIMO'],
      nomCar: map['NOMCAR'],
      perfil: map['PERFIL'],
      codCon: map['CODCON'],
      nomCon: map['NOMCON'],
      endCon: map['ENDCON'],
      baiCon: map['BAICON'],
      cidade: map['CIDADE'],
      estado: map['ESTADO'],
      cep: map['CEP'],
      cgcCon: map['CGCCON'],
      apelido: map['APELIDO'],
      codImoAdm: map['CODIMO_ADM'],
      codOrdAdm: map['CODORD_ADM'],
      logo: map['LOGO'],
      linkPhoto: map['LINK_PHOTO'],
    );
  }
}
