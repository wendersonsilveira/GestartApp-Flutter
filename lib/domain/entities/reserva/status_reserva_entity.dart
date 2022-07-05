import 'package:flutter/foundation.dart';

@immutable
class StatusDescricao {
  final int id;
  final String descricao;

  const StatusDescricao({
    this.id,
    this.descricao,
  });

  String statusAsString() {
    return '${this.descricao}';
  }
}
