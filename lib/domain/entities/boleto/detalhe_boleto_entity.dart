import 'package:flutter/foundation.dart';

@immutable
class DetalheBoletoEntity {
  final int id;
  final DateTime datVen;
  final DateTime datEmi;
  final double valTot;
  final String nomPro;
  final String cgcPro;
  final String nomCon;
  final String codImo;
  final int codOrd;
  final String endPro;
  final String baiPro;
  final String cidPro;
  final String estPro;
  final String cepPro;
  final String apelido;
  final String linhaDigitavel;
  final String codigoBanco;
  final String codigoBarras;
  final String aceite;
  final String especie;
  final String especieDoc;
  final String carteira;
  final String despesa1;
  final double despesa2;
  final double despesa3;
  final double despesa4;
  final double despesa5;
  final double despesa6;
  final double valor1;
  final double valor2;
  final double valor3;
  final double valor4;
  final double valor5;
  final double valor6;
  final String mensagem1;
  final String mensagem2;
  final String mensagem3;
  final String mensagem4;
  final String mensagem5;
  final String locPagBoleto;
  final String nossoNumero;
  final String codCed;
  final String codigoAgencia;
  final String logo;
  final String linkBoleto;

  const DetalheBoletoEntity(
      {this.id,
      this.datVen,
      this.datEmi,
      this.valTot,
      this.nomPro,
      this.cgcPro,
      this.nomCon,
      this.codImo,
      this.codOrd,
      this.endPro,
      this.baiPro,
      this.cidPro,
      this.estPro,
      this.cepPro,
      this.apelido,
      this.linhaDigitavel,
      this.codigoBanco,
      this.codigoBarras,
      this.aceite,
      this.especie,
      this.especieDoc,
      this.carteira,
      this.despesa1,
      this.despesa2,
      this.despesa3,
      this.despesa4,
      this.despesa5,
      this.despesa6,
      this.valor1,
      this.valor2,
      this.valor3,
      this.valor4,
      this.valor5,
      this.valor6,
      this.mensagem1,
      this.mensagem2,
      this.mensagem3,
      this.mensagem4,
      this.mensagem5,
      this.locPagBoleto,
      this.nossoNumero,
      this.codCed,
      this.codigoAgencia,
      this.logo,
      this.linkBoleto});

  // @override
  // String toString() {
  //   return 'PautaEntity(codcon: $codced)';
  // }
}
