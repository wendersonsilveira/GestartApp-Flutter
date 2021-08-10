import 'package:flutter/foundation.dart';

@immutable
class ResumoUnidadeEntity {
  final int unidade;
  final int asInquilino;
  final int isUser;
  final int pets;
  final int veiculos;
  final String nomcon;

  const ResumoUnidadeEntity({
    this.unidade,
    this.asInquilino,
    this.isUser,
    this.pets,
    this.veiculos,
    this.nomcon,
  });
}
