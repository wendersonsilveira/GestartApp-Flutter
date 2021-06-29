import 'package:flutter/foundation.dart';

@immutable
class PetEntity {
  final String tipo;
  final String raca;
  final String porte;
  final String nome;

  const PetEntity({
    this.tipo,
    this.raca,
    this.porte,
    this.nome,
  });

  @override
  String toString() {
    return 'PetEntity(tipo: $tipo, raca: $raca,porte: $porte,nome: $nome)';
  }

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return o is AuthEntity && o.email == email && o.password == password;
  // }

  // @override
  // int get hashCode {
  //   return email.hashCode ^ password.hashCode;
  // }
}
