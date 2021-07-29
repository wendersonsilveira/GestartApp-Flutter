// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sindico_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SindicoController = BindInject(
  (i) => SindicoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SindicoController on _SindicoControllerBase, Store {
  final _$unidadesAtom = Atom(name: '_SindicoControllerBase.unidades');

  @override
  ResourceData<List<UnidadeEntity>> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(ResourceData<List<UnidadeEntity>> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  final _$codConAtom = Atom(name: '_SindicoControllerBase.codCon');

  @override
  int get codCon {
    _$codConAtom.reportRead();
    return super.codCon;
  }

  @override
  set codCon(int value) {
    _$codConAtom.reportWrite(value, super.codCon, () {
      super.codCon = value;
    });
  }

  final _$unidadeSelecionadaAtom =
      Atom(name: '_SindicoControllerBase.unidadeSelecionada');

  @override
  UnidadeEntity get unidadeSelecionada {
    _$unidadeSelecionadaAtom.reportRead();
    return super.unidadeSelecionada;
  }

  @override
  set unidadeSelecionada(UnidadeEntity value) {
    _$unidadeSelecionadaAtom.reportWrite(value, super.unidadeSelecionada, () {
      super.unidadeSelecionada = value;
    });
  }

  @override
  String toString() {
    return '''
unidades: ${unidades},
codCon: ${codCon},
unidadeSelecionada: ${unidadeSelecionada}
    ''';
  }
}
