// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recebimento_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RecebimentoController = BindInject(
  (i) => RecebimentoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecebimentoController on _RecebimentoControllerBase, Store {
  final _$recebimentosAtom =
      Atom(name: '_RecebimentoControllerBase.recebimentos');

  @override
  List<RecebimentoEntity> get recebimentos {
    _$recebimentosAtom.reportRead();
    return super.recebimentos;
  }

  @override
  set recebimentos(List<RecebimentoEntity> value) {
    _$recebimentosAtom.reportWrite(value, super.recebimentos, () {
      super.recebimentos = value;
    });
  }

  final _$getRecebimentosAsyncAction =
      AsyncAction('_RecebimentoControllerBase.getRecebimentos');

  @override
  Future getRecebimentos(dynamic filtro) {
    return _$getRecebimentosAsyncAction
        .run(() => super.getRecebimentos(filtro));
  }

  @override
  String toString() {
    return '''
recebimentos: ${recebimentos}
    ''';
  }
}
