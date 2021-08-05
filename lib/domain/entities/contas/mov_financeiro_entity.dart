import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class MovFinanceiroEntity {
  final DateTime datSal;
  final String mesAno;
  final int codCon;
  final int idConta;
  final String nomSal;
  final String codAgencia;
  final String codBanco;
  final String nomBan;
  final String tipo;
  final String numConta;
  final bool ativa;
  final String conPad;
  final double saldo;
  final String apelido;
  final String logo;

  MovFinanceiroEntity(
      {this.datSal,
      this.mesAno,
      this.codCon,
      this.idConta,
      this.nomSal,
      this.codAgencia,
      this.codBanco,
      this.nomBan,
      this.tipo,
      this.numConta,
      this.ativa,
      this.conPad,
      this.saldo,
      this.apelido,
      this.logo});

  @override
  String toString() {
    return 'MovFinanceiroEntity(datSal: $datSal, mesAno: $mesAno, codCon: $codCon, idConta: $idConta, nomSal: $nomSal, codAgencia: $codAgencia, codBanco: $codBanco, nomBan: $nomBan, tipo: $tipo, numConta: $numConta, ativa: $ativa, conPad: $conPad, saldo: $saldo, apelido: $apelido, logo: $logo)';
  }
}
