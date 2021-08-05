import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';

extension MovFinanceiroMapper on MovFinanceiroEntity {
  List<MovFinanceiroEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  MovFinanceiroEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return MovFinanceiroEntity(
      datSal: map['DATSAL'] != null ? DateTime.parse(map['DATSAL']) : null,
      mesAno: map['MESANO'],
      codCon: map['CODCON'],
      idConta: map['ID_CONTA'],
      nomSal: map['NOMSAL'],
      codAgencia: map['CODIGO_AGENCIA'],
      codBanco: map['CODIGO_BANCO'],
      nomBan: map['NOMBAN'],
      tipo: map['TIPO'],
      numConta: map['NUMERO_CONTA'],
      ativa: map['ATIVA'],
      conPad: map['CONPAD'],
      saldo: map['SALDO'].toDouble(),
      apelido: map['APELIDO'],
      logo: map['LOGO'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'CODCON': codCon,
      'MESANO': mesAno,
    };
  }
}
