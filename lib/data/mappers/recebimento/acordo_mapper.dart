import 'package:Gestart/domain/entities/recebimento/acrodo_entity.dart';

extension AcordoMapper on AcordoEntity {
  List<AcordoEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  AcordoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return AcordoEntity(
      numAco: map['NUMACO'],
      unidade: map['UNIDADE'],
      valTax: map['VALTAX'],
      totPar: map['TOTPAR'],
      datAco: DateTime.parse(map['DATACO']),
      tipAco: map['TIPACO'],
      codCon: map['CODCON'],
      valMul: map['VALMUL'].toDouble(),
      valJur: map['VALJUR'].toDouble(),
      valOut: map['VALOUT'].toDouble(),
      valDes: map['VALDES'].toDouble(),
      valEnt: map['VALENT'].toDouble(),
      totAcordo: map['TOT_ACORDO'].toDouble(),
      totAcordoPag: map['TOT_ACORDO_PAG'].toDouble(),
      totAcordoAberto: map['TOT_ACORDO_ABERTO'].toDouble(),
      totAcordoAVencer: map['TOT_ACORDO_A_VENCER'].toDouble(),
      saldoDevedor: map['SALDO_DEVEDOR'].toDouble(),
      apelido: map['APELIDO'],
      nomeCon: map['NOMCON'],
      valRet: map['VALRET'].toDouble(),
      tipAcoDescri: map['TIPACO_DESCRI'],
      codImo: map['CODIMO'],
      codOrd: map['CODORD'],
      nomPro: map['NOMPRO'],
      tipTax: map['TIPTAX'],
      mesAno: map['MESANO'],
      valMen: map['VALMEN'] == null ? map['VALMEN'] : map['VALMEN'].toDouble(),
      valPag: map['VALPAG'] == null ? map['VALPAG'] : map['VALPAG'].toDouble(),
      histor: map['HISTOR'],
      datVen: map['DATVEN'] == null ? map['DATVEN'] : DateTime.parse(map['DATVEN']),
      datPag: map['DATPAG'] == null ? map['DATPAG'] : DateTime.parse(map['DATPAG']),
      datCre: map['DATCRE'] == null ? map['DATCRE'] : DateTime.parse(map['DATCRE']),
      isTaxaOriginal: map['IS_TAXA_ORIGINAL'] == null
          ? null
          : map['IS_TAXA_ORIGINAL'] > 0
              ? true
              : false,
      isTaxaParcela: map['IS_TAXA_PARCELA'] == null
          ? null
          : map['IS_TAXA_PARCELA'] > 0
              ? true
              : false,
      isPago: map['IS_PAGO'] == null
          ? null
          : map['IS_PAGO'] > 0
              ? true
              : false,
    );
  }
}
