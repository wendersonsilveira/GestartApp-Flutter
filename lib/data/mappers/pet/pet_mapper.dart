import 'package:Gestart/domain/entities/pet/pet_entity.dart';

extension PetMapper on PetEntity {
  PetEntity copyWith({
    String tipo,
    String raca,
    String porte,
    String nome,
  }) {
    return PetEntity(
      tipo: tipo ?? this.tipo,
      raca: raca ?? this.raca,
      porte: porte ?? this.porte,
      nome: nome ?? this.nome,
    );
  }

  List<PetEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  PetEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PetEntity(
      id: map['ID'],
      tipo: map['TIPO'],
      raca: map['RACA'],
      porte: map['PORTE'],
      nome: map['NOME'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': id != null ? id : 0,
      'TIPO': tipo,
      'RACA': raca,
      'PORTE': porte,
      'NOME': nome,
    };
  }
}
