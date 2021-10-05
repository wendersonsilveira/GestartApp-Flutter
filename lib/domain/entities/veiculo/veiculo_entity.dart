import 'package:flutter/foundation.dart';

@immutable
class VeiculoEntity {
  final int id;
  final int codOrd;
  final String modelo;
  final String placa;
  final String ano;
  final String cor;
  final int condonUserId;

  const VeiculoEntity({this.id, this.codOrd, this.modelo, this.placa, this.ano, this.cor, this.condonUserId});

  @override
  String toString() {
    return 'PetEntity(id: $id, codord: $codOrd, modelo: $modelo, placa: $placa, ano: $ano, cor: $cor)';
  }
}
