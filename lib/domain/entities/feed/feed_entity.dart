import 'package:flutter/foundation.dart';

@immutable
class FeedEntity {
  final int codCon;
  final DateTime datEmi;
  final String att;
  final String descricao;
  final String atensiosamente;
  final String urlDigital;
  final int condonUserId;
  final int id;
  final String apelido;
  final String logo;

  const FeedEntity(
      {this.codCon,
      this.datEmi,
      this.att,
      this.descricao,
      this.atensiosamente,
      this.urlDigital,
      this.condonUserId,
      this.id,
      this.apelido,
      this.logo});

  @override
  String toString() {
    return 'FeedEntity(codCon: $codCon, datEmi: $datEmi, att: $att, descricao: $descricao, atensiosamente: $atensiosamente, urlDigital: $urlDigital, condonUserId: $condonUserId, id: $id, apelido: $apelido, logo: $logo)';
  }
}
