import 'package:flutter/foundation.dart';

@immutable
class EmailAtivacaoEntity {
  final int id;
  final String email;

  const EmailAtivacaoEntity({this.id, this.email});

  @override
  String toString() {
    return 'CondominioEntity(id: $id,email: $email)';
  }
}
