import 'package:flutter/foundation.dart';

@immutable
class CondominiosAtivosEntity {
  final int codcon;
  final String nomcon;
  final String apelido;
  final String logo;
  final int gestartapp;
  final int gestartappReserva;

  const CondominiosAtivosEntity({
    this.codcon,
    this.nomcon,
    this.apelido,
    this.logo,
    this.gestartapp,
    this.gestartappReserva,
  });

  @override
  String toString() {
    return 'CondominiosAtivosEntity(codcon: $codcon,,nomcon: $nomcon,apelido: $apelido,logo: $logo,gestartapp: $gestartapp,gestartappReserva: $gestartappReserva)';
  }
}
