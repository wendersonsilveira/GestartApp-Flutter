import 'package:flutter/foundation.dart';

@immutable
class UpdatePasswordEntity {
  final String identificador;

  const UpdatePasswordEntity({
    this.identificador,
  });

  @override
  String toString() {
    return 'CreateUserEntity(identificador: $identificador)';
  }
}
