import 'package:flutter/foundation.dart';

@immutable
class DocumentoEntity {
  final int codCon;
  final int id;
  final String logo;
  final String apelido;
  final String pasta;
  final String linkDocumento;
  final String descricao;
  final String tipo;

  const DocumentoEntity({
    this.codCon,
    this.logo,
    this.apelido,
    this.pasta,
    this.descricao,
    this.linkDocumento,
    this.tipo,
    this.id,
  });

  @override
  String toString() {
    return 'PautaEntity(codcon: $codCon)';
  }
}
