import 'package:flutter/foundation.dart';

@immutable
class CondominioAtivoEntity {
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

  const CondominioAtivoEntity({
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
  });

  @override
  String toString() {
    return 'CondominioAtivoEntity(codcon: $codcon,codimo: $codimo, codord: $codord,nomcon: $nomcon,parentCondonUserId: $parentCondonUserId,condonUserId: $condonUserId,perfil: $perfil,apelido: $apelido,logo: $logo,gestartapp: $gestartapp,gestartappReserva: $gestartappReserva,nompro: $nompro)';
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
