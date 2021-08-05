// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avisos_page_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AvisosPageController = BindInject(
  (i) => AvisosPageController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AvisosPageController on _AvisosPageControllerBase, Store {
  final _$avisosAtom = Atom(name: '_AvisosPageControllerBase.avisos');

  @override
  List<AvisoEntity> get avisos {
    _$avisosAtom.reportRead();
    return super.avisos;
  }

  @override
  set avisos(List<AvisoEntity> value) {
    _$avisosAtom.reportWrite(value, super.avisos, () {
      super.avisos = value;
    });
  }

  final _$getAvisosAsyncAction =
      AsyncAction('_AvisosPageControllerBase.getAvisos');

  @override
  Future getAvisos() {
    return _$getAvisosAsyncAction.run(() => super.getAvisos());
  }

  @override
  String toString() {
    return '''
avisos: ${avisos}
    ''';
  }
}
