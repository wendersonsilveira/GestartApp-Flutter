import 'package:flutter/foundation.dart';

@immutable
class CondominioEntity {
  final int codcon;
  final String apelido;
  final String nomcon;
  final String cgccon;
  final String logo;

  const CondominioEntity({
    this.codcon,
    this.apelido,
    this.nomcon,
    this.cgccon,
    this.logo,
  });

  @override
  String toString() {
    return 'CondominioEntity(codcon: $codcon,apelido: $apelido, nomcon: $nomcon,cgccon: $cgccon,logo: $logo)';
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
