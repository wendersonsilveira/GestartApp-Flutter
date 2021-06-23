import 'package:flutter/foundation.dart';

@immutable
class CheckAuthEntity {
  final String cpfCnpj;

  const CheckAuthEntity({
    this.cpfCnpj,
  });

  @override
  String toString() {
    return 'AuthEntity(cpf: $cpfCnpj)';
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
