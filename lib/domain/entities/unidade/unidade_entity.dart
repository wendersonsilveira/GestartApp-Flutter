import 'package:flutter/foundation.dart';

@immutable
class UnidadeEntity {
  final int codcon;
  final String nompro;
  final String codimo;
  final int codord;
  final String nomcon;
  final int parentCondonUserId;
  final int condonUserId;
  final String perfil;
  final String apelido;
  final String logo;
  final int gestartapp;
  final int gestartappReserva;

  final String propri;
  final String cgcpro;
  final int asInquilino;
  final int isUser;
  final int pets;
  final int veiculos;

  const UnidadeEntity({
    this.codcon,
    this.codimo,
    this.codord,
    this.nomcon,
    this.parentCondonUserId,
    this.condonUserId,
    this.perfil,
    this.apelido,
    this.logo,
    this.gestartapp,
    this.gestartappReserva,
    this.nompro,
    this.propri,
    this.cgcpro,
    this.asInquilino,
    this.isUser,
    this.pets,
    this.veiculos,
  });

  @override
  String toString() {
    return 'UnidadeEntity(codcon: $codcon,codimo: $codimo, codord: $codord,nomcon: $nomcon,parentCondonUserId: $parentCondonUserId,condonUserId: $condonUserId,perfil: $perfil,apelido: $apelido,logo: $logo,gestartapp: $gestartapp,gestartappReserva: $gestartappReserva,nompro: $nompro)';
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
