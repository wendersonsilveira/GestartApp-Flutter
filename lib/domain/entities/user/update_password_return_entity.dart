import 'package:flutter/foundation.dart';

@immutable
class UpdatePasswordReturnEntity {
  final int status;
  final String email;

  const UpdatePasswordReturnEntity({
    this.status,
    this.email,
  });

  @override
  String toString() {
    return 'CreateUserEntity(email: $email, status: $status)';
  }
}
