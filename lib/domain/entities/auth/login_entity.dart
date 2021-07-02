import 'package:flutter/foundation.dart';

@immutable
class LoginAuthEntity {
  final String usuario;
  final String senha;

  const LoginAuthEntity({
    this.usuario,
    this.senha,
  });

  @override
  String toString() {
    return 'LoginAuthEntity(usuario: $usuario, senha: $senha)';
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
