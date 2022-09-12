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
  final String linkMalaDireta;
  final String fileName;
  final String fileUrl;

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
      this.linkMalaDireta,
      this.fileName,
      this.fileUrl,
      this.logo});

  @override
  String toString() {
    return 'FeedEntity(codCon: $codCon, datEmi: $datEmi, att: $att, descricao: $descricao, atensiosamente: $atensiosamente, urlDigital: $urlDigital, linkMalaDireta: $linkMalaDireta, condonUserId: $condonUserId, id: $id, apelido: $apelido, logo: $logo, filename: $fileName, fileUrl: $fileUrl)';
  }
}
