import 'package:Gestart/domain/entities/admin-cadastro/resumo_unidade_entity.dart';

extension ResumoUnidadeMapper on ResumoUnidadeEntity {
  List<ResumoUnidadeEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  ResumoUnidadeEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResumoUnidadeEntity(
      unidade: map['UNIDADE'],
      asInquilino: map['AS_INQUILINO'],
      isUser: map['IS_USER'],
      pets: map['PETS'],
      veiculos: map['VEICULOS'],
      nomcon: map['NOMCON'],
    );
  }
}
