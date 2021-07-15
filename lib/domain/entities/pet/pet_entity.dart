import 'package:flutter/foundation.dart';

@immutable
class PetEntity {
  final int id;
  final String tipo;
  final String raca;
  final String porte;
  final String nome;

  const PetEntity({
    this.id,
    this.tipo,
    this.raca,
    this.porte,
    this.nome,
  });

  @override
  String toString() {
    return 'PetEntity(tipo: $tipo, raca: $raca,porte: $porte,nome: $nome)';
  }
}
