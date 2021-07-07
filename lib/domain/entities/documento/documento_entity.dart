import 'package:flutter/foundation.dart';

@immutable
class DocumentoEntity {
  final int codCon;
  final String logo;
  final String apelido;
  final String pasta;
  final String linkDocumento;

  const DocumentoEntity({
    this.codCon,
    this.logo,
    this.apelido,
    this.pasta,
    this.linkDocumento,
  });

  @override
  String toString() {
    return 'PautaEntity(codcon: $codCon)';
  }
}
