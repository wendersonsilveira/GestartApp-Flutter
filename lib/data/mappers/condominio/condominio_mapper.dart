import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';

extension CondominioMapper on CondominioEntity {
  CondominioEntity copyWith({
    int codcon,
    String apelido,
    String nomcon,
    String cgccon,
    String logo,
  }) {
    return CondominioEntity(
      codcon: codcon ?? this.codcon,
      apelido: apelido ?? this.apelido,
      nomcon: nomcon ?? this.nomcon,
      cgccon: cgccon ?? this.cgccon,
      logo: logo ?? this.logo,
    );
  }

  CondominioEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CondominioEntity(
      codcon: map['CODCON'],
      apelido: map['APELIDO'],
      nomcon: map['NOMCON'],
      cgccon: map['CGCCON'],
      logo: map['LOGO'],
    );
  }
}
