import 'package:flutter/foundation.dart';

@immutable
class SetupReservaEntity {
  final int maxIntRes;

  const SetupReservaEntity({this.maxIntRes});

  @override
  String toString() {
    return 'SetupReservaEntity(maxIntRes: $maxIntRes)';
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
