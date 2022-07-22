// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'espacos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EspacosController = BindInject(
  (i) => EspacosController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EspacosController on _EspacosControllerBase, Store {
  final _$espacosAtom = Atom(name: '_EspacosControllerBase.espacos');

  @override
  List<EspacoEntity> get espacos {
    _$espacosAtom.reportRead();
    return super.espacos;
  }

  @override
  set espacos(List<EspacoEntity> value) {
    _$espacosAtom.reportWrite(value, super.espacos, () {
      super.espacos = value;
    });
  }

  final _$getEspacosAsyncAction =
      AsyncAction('_EspacosControllerBase.getEspacos');

  @override
  Future getEspacos(int codcon) {
    return _$getEspacosAsyncAction.run(() => super.getEspacos(codcon));
  }

  @override
  String toString() {
    return '''
espacos: ${espacos}
    ''';
  }
}
