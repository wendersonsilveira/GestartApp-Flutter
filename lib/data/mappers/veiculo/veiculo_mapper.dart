import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';

extension VeiculoMapper on VeiculoEntity {
  VeiculoEntity copyWith({
    int id,
    int codOrd,
    String modelo,
    String placa,
    String ano,
    String cor,
    int condonUserId,
  }) {
    return VeiculoEntity(
      id: id ?? this.id,
      codOrd: codOrd ?? this.codOrd,
      modelo: modelo ?? this.modelo,
      placa: placa ?? this.placa,
      ano: ano ?? this.ano,
      cor: cor ?? this.cor,
      condonUserId: condonUserId ?? this.condonUserId,
    );
  }

  List<VeiculoEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  VeiculoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return VeiculoEntity(
      id: map['ID'],
      codOrd: map['CODORD'],
      modelo: map['MODELO'],
      placa: map['PLACA'],
      ano: map['ANO'],
      cor: map['COR'],
      condonUserId: map['CONDON_USER_ID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': id != null ? id : 0,
      'CODORD': codOrd,
      'MODELO': modelo,
      'PLACA': placa,
      'ANO': ano,
      'COR': cor,
    };
  }
}
