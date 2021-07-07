import 'package:Gestart/domain/entities/documento/documento_entity.dart';

extension DocumentoMapper on DocumentoEntity {
  List<DocumentoEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  DocumentoEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return DocumentoEntity(
      codCon: map['CODCON'],
      pasta: map['PASTA'],
      linkDocumento: map['LINK_DOCUMENTO'],
      apelido: map['APELIDO'],
      descricao: map['DESCRICAO'],
      logo: map['LOGO'],
    );
  }
}
