import 'package:Gestart/domain/entities/unidade/unidade_infor_entity.dart';

extension UnidadeInforMapper on UnidadeInforEntity {
  UnidadeInforEntity copyWith({
    int condonUserId,
    String codimo,
    int codord,
    String nompro,
    int hasInquilino,
    int hasUser,
    int hasPets,
    int hasVeiculos
    
  }) {
    return UnidadeInforEntity(
      condonUserId: condonUserId ?? this.condonUserId,
      codimo: codimo ?? this.codimo,
      codord: codord ?? this.codord,
      nompro: nompro ?? this.nompro,
      hasInquilino: hasInquilino ?? this.hasInquilino,
      hasUser: hasUser ?? this.hasUser,
      hasPets: hasPets ?? this.hasPets,
      hasVeiculos: hasVeiculos ?? this.hasVeiculos,
    );
  }

  List<UnidadeInforEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  UnidadeInforEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UnidadeInforEntity(      
      condonUserId: map['CONDON_USER_ID'],
      codimo: map['CODIMO'] != null
          ? map['CODIMO']
          : map['unidade'] != null
              ? map['unidade']['CODIMO']
              : null,
      codord: map['CODORD'],
      nompro: map['NOMPRO'] != null
          ? map['NOMPRO']
          : map['unidade'] != null
              ? map['unidade']['NOMPRO']
              : null,
      hasInquilino: map['HAS_INQUILINO'],
      hasUser: map['HAS_USER'],
      hasPets: map['HAS_PET'],
      hasVeiculos: map['HAS_VEICULO'],
    );
  }
}
