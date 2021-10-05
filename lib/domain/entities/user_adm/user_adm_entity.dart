import 'package:flutter/foundation.dart';

@immutable
class UserAdmEntity {
  String nomAdm;
  DateTime datIni;
  DateTime datFin;
  int codCar;
  String codImo;
  String nomCar;
  String perfil;
  int codCon;
  String nomCon;
  String endCon;
  String baiCon;
  String cidade;
  String estado;
  String cep;
  String cgcCon;
  String apelido;
  String codImoAdm;
  int codOrdAdm;
  String logo;
  String linkPhoto;
  UserAdmEntity({
    this.nomAdm,
    this.datIni,
    this.datFin,
    this.codCar,
    this.codImo,
    this.nomCar,
    this.perfil,
    this.codCon,
    this.nomCon,
    this.endCon,
    this.baiCon,
    this.cidade,
    this.estado,
    this.cep,
    this.cgcCon,
    this.apelido,
    this.codImoAdm,
    this.codOrdAdm,
    this.logo,
    this.linkPhoto,
  });

  @override
  String toString() {
    return 'UserAdmEntity(nomAdm: $nomAdm, datIni: $datIni, datFin: $datFin, codCar: $codCar, codImo: $codImo, nomCar: $nomCar, perfil: $perfil, codCon: $codCon, nomCon: $nomCon, endCon: $endCon, baiCon: $baiCon, cidade: $cidade, estado: $estado, cep: $cep, cgcCon: $cgcCon, apelido: $apelido, codImoCdm: $codImoAdm, codOrdAdm: $codOrdAdm, logo: $logo, linkPhoto: $linkPhoto)';
  }
}
