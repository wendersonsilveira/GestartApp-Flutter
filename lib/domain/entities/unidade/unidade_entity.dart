import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
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

  final String endPro;
  final List<dynamic> petsList;
  final List<dynamic> veiculosList;
  final List<dynamic> telefones;
  final List<dynamic> emails;
  final String endinq;
  final String cidinq;
  final String baiinq;
  final String foninq1;
  final String foninq2;
  final String foninq3;

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
    this.endPro,
    this.petsList,
    this.veiculosList,
    this.telefones,
    this.emails,
    this.endinq,
    this.cidinq,
    this.baiinq,
    this.foninq1,
    this.foninq2,
    this.foninq3,
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
