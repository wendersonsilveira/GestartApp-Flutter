import 'package:flutter/foundation.dart';

@immutable
class PautaEntity {
  final String descricao;

  const PautaEntity({
    this.descricao,
  });

  @override
  String toString() {
    return 'PautaEntity(descricao: $descricao)';
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
