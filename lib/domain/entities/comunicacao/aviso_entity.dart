import 'package:flutter/foundation.dart';

@immutable
class AvisoEntity {
  final int id;
  final int codCon;
  final DateTime datEmi;
  final String att;
  final String descri;
  final String atenciosamente;
  final String urlDigital;
  final int condonUserId;
  final String apelido;
  final String logo;

  const AvisoEntity({
    this.id,
    this.codCon,
    this.datEmi,
    this.att,
    this.descri,
    this.atenciosamente,
    this.urlDigital,
    this.condonUserId,
    this.apelido,
    this.logo,
  });
}
