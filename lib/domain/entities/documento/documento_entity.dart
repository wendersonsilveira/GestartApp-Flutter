import 'package:flutter/foundation.dart';

@immutable
class DocumentoEntity {
  final int codCon;
  final String logo;
  final String apelido;
  final String pasta;
  final String linkDocumento;
  final String descricao;

  const DocumentoEntity({
    this.codCon,
    this.logo,
    this.apelido,
    this.pasta,
    this.descricao,
    this.linkDocumento,
  });

  @override
  String toString() {
    return 'PautaEntity(codcon: $codCon)';
  }
}
