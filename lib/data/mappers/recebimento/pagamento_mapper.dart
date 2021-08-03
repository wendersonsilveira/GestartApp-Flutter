import 'package:Gestart/domain/entities/recebimento/pagamento_entity.dart';

extension PagamentoMapper on PagamentoEntity {
  List<PagamentoEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  PagamentoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PagamentoEntity(
      unidade: map['UNIDADE'],
      codOrd: map['CODORD'],
      codCon: map['CODCON'],
      codImo: map['CODIMO'],
      mesAno: map['MESANO'],
      datVen: DateTime.parse(map['DATVEN']),
      datPag: DateTime.parse(map['DATPAG']),
      valPag: map['VALPAG'].toDouble(),
      histor: map['HISTOR'],
      datCre: DateTime.parse(map['DATCRE']),
      nomCon: map['NOMCON'],
      dt1: DateTime.parse(map['DT1']),
      dt2: DateTime.parse(map['DT2']),
      apelido: map['APELIDO'],
      logo: map['LOG'],
      linkPhoto: map['LINK_PHOTO'],
    );
  }
}
