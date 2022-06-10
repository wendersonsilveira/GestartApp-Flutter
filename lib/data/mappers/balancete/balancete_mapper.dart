import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';

extension BalanceteMapper on BalanceteEntity {
  BalanceteEntity copyWith({
    String tipo,
    String raca,
    String porte,
    String nome,
  }) {
    return BalanceteEntity(
        id: id ?? this.id,
        codcon: codcon ?? this.codcon,
        mesAno: mesAno ?? this.mesAno,
        mesAnoAnterior: mesAnoAnterior ?? this.mesAnoAnterior,
        dt1: dt1 ?? this.dt1,
        mesTxt: mesTxt ?? this.mesTxt,
        dt2: dt2 ?? this.dt2,
        linkBalanceteAna: linkBalanceteAna ?? this.linkBalanceteAna,
        linkBalanceteSin: linkBalanceteSin ?? this.linkBalanceteSin,
        apelido: apelido ?? this.apelido,
        logo: logo ?? this.logo,
        datEmi6: datEmi6 ?? this.datEmi6,
        datEmi8: datEmi8 ?? this.datEmi8,
        contasPagar: contasPagar ?? this.contasPagar,
        linkBalanceteDigital: linkBalanceteDigital ?? this.linkBalanceteDigital,
        balanceteDigital: balanceteDigital ?? this.balanceteDigital,
        balancete: balancete ?? this.balancete,
        balanceteDigitalArquivo:
            balanceteDigitalArquivo ?? this.balanceteDigitalArquivo);
  }

  List<BalanceteEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  BalanceteEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return BalanceteEntity(
      id: int.parse(map['ID']),
      codcon: map['CODCON'],
      mesAno: map['MESANO'],
      mesAnoAnterior: map['MESANO_ANTERIOR'],
      dt1: DateTime.parse(map['DT1']),
      mesTxt: map['MES_TXT'],
      dt2: DateTime.parse(map['DT2']),
      linkBalanceteAna: map['LINK_BALANCETE_ANA'],
      linkBalanceteSin: map['LINK_BALANCETE_SIN'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
      datEmi6: map['DATEMI_6'] != null ? DateTime.parse(map['DATEMI_6']) : null,
      datEmi8: map['DATEMI_8'] != null ? DateTime.parse(map['DATEMI_8']) : null,
      contasPagar: map['CONTASPAGAR'],
      linkBalanceteDigital: map['LINK_BALANCETE_DIGITAL'],
      balanceteDigital: map['BALANCETE_DIGITAL'],
      balancete: map['BALANCETE'],
      balanceteDigitalArquivo: map['BALANCETE_DIGITAL_ARQUIVO'],
      versao: map['VERSAO'],
      tipo: map['TIPO'],
    );
  }
}
