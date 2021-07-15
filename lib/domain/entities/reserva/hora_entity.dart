import 'package:flutter/foundation.dart';

@immutable
class HoraEntity {
  final int id;
  final String descricao;
  final int valor;
  final String tipo;
  final int ordem;

  const HoraEntity({this.id, this.descricao, this.valor, this.tipo, this.ordem});
}
