import 'package:flutter/foundation.dart';

@immutable
class EditaisEntity {
  final int id;
  final int codcon;
  final int codtip;
  final String datreu;
  final String horreu_1;
  final String horreu_2;
  final String loc;
  final int idAta;
  final String nomtip;
  final int status;
  final String apelido;
  final String logo;

  const EditaisEntity(
      {this.id,
      this.codcon,
      this.codtip,
      this.datreu,
      this.horreu_1,
      this.horreu_2,
      this.loc,
      this.idAta,
      this.nomtip,
      this.status,
      this.apelido,
      this.logo});

  @override
  String toString() {
    return 'EditaisEntity(id: $id,codcon: $codcon,codtip: $codtip,datreu: $datreu,horreu_1: $horreu_1,horreu_2: $horreu_2,loc: $loc,idAta: $idAta,nomtip: $nomtip,status: $status,apelido: $apelido,logo: $logo, )';
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
