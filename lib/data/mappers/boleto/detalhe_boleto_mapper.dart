import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';

extension DetalheBoletoMapper on DetalheBoletoEntity {
  // DetalheBoletoEntity copyWith() {
  //   return DetalheBoletoEntity(
  //     id: id ?? this.id,
  //     datven: datven ?? this.datven,
  //     datemi: datemi ?? this.datemi,
  //     valtot: valtot ?? this.valtot,
  //     nompro: nompro ?? this.nompro,
  //     codcon: codcon ?? this.codcon,
  //     nomcon: nomcon ?? this.nomcon,
  //     codord: codord ?? this.codord,
  //     codimo: codimo ?? this.codimo,
  //     titcob: titcob ?? this.titcob,
  //     endcob: endcob ?? this.endcob,
  //     apelido: apelido ?? this.apelido,
  //     logo: logo ?? this.logo,
  //   ),
  // }

  List<DetalheBoletoEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();


  DetalheBoletoEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return DetalheBoletoEntity(
      id: map['ID'],
      identificador: map['IDENTIFICADOR'],
      datVen: DateTime.parse(map['DATVEN']),
      datEmi: DateTime.parse(map['DATEMI']),
      valTot: (map['VALTOT']).toDouble(),
      nomPro: map['NOMPRO'],
      cgcPro: map['CGCPRO'],
      nomCon: map['NOMCON'],
      codImo: map['CODIMO'],
      codOrd: map['CODORD'],
      endPro: map['ENDPRO'],
      baiPro: map['BAIPRO'],
      cidPro: map['CIDPRO'],
      estPro: map['ESTPRO'],
      cepPro: map['CEPPRO'],
      apelido: map['APELIDO'],
      linhaDigitavel: map['LINHA_DIGITAVEL'],
      codigoBanco: map['CODIGO_BANCO'],
      codigoBarras: map['CODIGO_BARRAS'],
      aceite: map['ACEITE'],
      especie: map['ESPECIE'],
      especieDoc: map['ESPECIE_DOC'],
      carteira: map['CARTEIRA'],
      despesa1: map['DESPESA_1'],
      despesa2: map['DESPESA_2'],
      despesa3: map['DESPESA_3'],
      despesa4: map['DESPESA_4'],
      despesa5: map['DESPESA_5'],
      despesa6: map['DESPESA_6'],
      valor1: map['VALOR_1'] != null ? (map['VALOR_1']).toDouble() : null,
      valor2: map['VALOR_2'] != null ? (map['VALOR_2']).toDouble() : null,
      valor3: map['VALOR_3'] != null ? (map['VALOR_3']).toDouble() : null,
      valor4: map['VALOR_4'] != null ? (map['VALOR_4']).toDouble() : null,
      valor5: map['VALOR_5'] != null ? (map['VALOR_5']).toDouble() : null,
      valor6: map['VALOR_6'] != null ? (map['VALOR_6']).toDouble() : null,
      mensagem1: map['MENSAGEM_1'],
      mensagem2: map['MENSAGEM_2'],
      mensagem3: map['MENSAGEM_3'],
      mensagem4: map['MENSAGEM_4'],
      mensagem5: map['MENSAGEM_5'],
      locPagBoleto: map['LOCPAG_BOLETO'],
      nossoNumero: map['NOSSO_NUMERO'],
      codCed: map['CODCED'],
      codigoAgencia: map['CODIGO_AGENCIA'],
      logo: map['LOGO'],
      conts: map['CONTS'],
      linkBoleto: map['LINK_BOLETO'],
    );
  }

  /* final int id,
  final DateTime datven,
  final DateTime datemi,
  final double nompro,
  final int codcon,
  final String nomcon,
  final int codord,
  final String codimo,
  final String titcob,
  final String endcob,
  final String apelido,
  final String logo,
*/
}
