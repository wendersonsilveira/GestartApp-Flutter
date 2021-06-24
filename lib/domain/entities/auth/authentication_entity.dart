import 'package:flutter/foundation.dart';

@immutable
class AuthenticationEntity {
  final String token;

  const AuthenticationEntity({
    this.token,
  });

  @override
  String toString() {
    return 'AuthEntity(token: $token)';
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
