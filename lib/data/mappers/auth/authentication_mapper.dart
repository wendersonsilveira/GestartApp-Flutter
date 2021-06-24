import 'package:Gestart/domain/entities/auth/authentication_entity.dart';

extension AuthenticationMapper on AuthenticationEntity {
  AuthenticationEntity copyWith({
    String token,
  }) {
    return AuthenticationEntity(token: token ?? this.token);
  }

  AuthenticationEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthenticationEntity(
      token: map['token'],
    );
  }
}
