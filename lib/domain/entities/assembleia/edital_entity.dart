import 'package:flutter/foundation.dart';

@immutable
class EditalEntity {
  final int codcon;
  final int codtip;
  final String nomsol;
  final String loc;
  final bool lido;
  final DateTime datemi;
  final DateTime datreu;
  final DateTime datemi_1;
  final DateTime datemi_2;
  final DateTime datemi_3;
  final DateTime datemi_4;
  final DateTime datemi_5;
  final DateTime datemi_6;
  final DateTime datemi_7;
  final DateTime datemi_8;
  final DateTime datemi_9;
  final String nomusu_1;
  final String nomusu_2;
  final String nomusu_3;
  final String nomusu_4;
  final String nomusu_5;
  final String nomusu_6;
  final String nomusu_7;
  final String nomusu_8;
  final String nomusu_9;
  final String obs_1;
  final String obs_2;
  final String obs_3;
  final String obs_4;
  final String obs_5;
  final String obs_6;
  final String obs_7;
  final String obs_8;
  final String obs_9;
  final int idAta;
  final DateTime horreu_1;
  final DateTime horreu_2;
  final bool alteraAdm;
  final String confirmacao;
  final int views;
  final String urlDigital;
  final String nomUsuPar;
  final int valass;
  final int statusId;
  final int qtdeCopias;
  final int gedFiledId;
  final String identificador;
  final DateTime datpub;
  final String nomUsuPub;
  final int id;
  final int ajuTax;
  final String ajuTaxNomUsu;
  final DateTime ajuTaxData;
  final String ajuTaxObs;
  final int sacId;
  final int tipass;
  final int appassvir;
  final String prazoAntGrupoChat;
  final DateTime dataDisLink;
  final DateTime horaDisLink;
  final DateTime dataTeste;
  final DateTime horaTeste;
  final String textoProcuracao;
  final String envioProcuracao;
  final String nomTip;
  final int status;
  final String apelido;
  final String logo;
  final String assunto;
  final String nompre;
  final String nomsec;
  final String nomsin;
  final String nompreLinkPhoto;
  final String nomsecLinkPhoto;
  final String nomsinLinkPhoto;
  final String nomsolLinkPhoto;
  final String linkAta;
  final String linkEdital;

  const EditalEntity(
      {this.codcon,
      this.codtip,
      this.nomsol,
      this.loc,
      this.lido,
      this.datemi,
      this.datreu,
      this.datemi_1,
      this.datemi_2,
      this.datemi_3,
      this.datemi_4,
      this.datemi_5,
      this.datemi_6,
      this.datemi_7,
      this.datemi_8,
      this.datemi_9,
      this.nomusu_1,
      this.nomusu_2,
      this.nomusu_3,
      this.nomusu_4,
      this.nomusu_5,
      this.nomusu_6,
      this.nomusu_7,
      this.nomusu_8,
      this.nomusu_9,
      this.obs_1,
      this.obs_2,
      this.obs_3,
      this.obs_4,
      this.obs_5,
      this.obs_6,
      this.obs_7,
      this.obs_8,
      this.obs_9,
      this.idAta,
      this.horreu_1,
      this.horreu_2,
      this.alteraAdm,
      this.confirmacao,
      this.views,
      this.urlDigital,
      this.nomUsuPar,
      this.valass,
      this.statusId,
      this.qtdeCopias,
      this.gedFiledId,
      this.identificador,
      this.datpub,
      this.nomUsuPub,
      this.id,
      this.ajuTax,
      this.ajuTaxNomUsu,
      this.ajuTaxData,
      this.ajuTaxObs,
      this.sacId,
      this.tipass,
      this.appassvir,
      this.prazoAntGrupoChat,
      this.dataDisLink,
      this.horaDisLink,
      this.dataTeste,
      this.horaTeste,
      this.textoProcuracao,
      this.envioProcuracao,
      this.nomTip,
      this.status,
      this.apelido,
      this.logo,
      this.assunto,
      this.nompre,
      this.nomsec,
      this.nomsin,
      this.nompreLinkPhoto,
      this.nomsecLinkPhoto,
      this.nomsinLinkPhoto,
      this.nomsolLinkPhoto,
      this.linkAta,
      this.linkEdital});

  @override
  String toString() {
    return 'PautaEntity(codcon: $codcon)';
  }

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return o is AuthEntity && o.email == email && o.password == password;
  // }

  // @override
  // int get hashCode {
  //   return email.hashCode ^ password.hashCode;
  // }
}
