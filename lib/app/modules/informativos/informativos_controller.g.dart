// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'informativos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InformativosController = BindInject(
  (i) => InformativosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InformativosController on _InformativosControllerBase, Store {
  final _$inforAtom = Atom(name: '_InformativosControllerBase.infor');

  @override
  ResourceData<List<FeedEntity>> get infor {
    _$inforAtom.reportRead();
    return super.infor;
  }

  @override
  set infor(ResourceData<List<FeedEntity>> value) {
    _$inforAtom.reportWrite(value, super.infor, () {
      super.infor = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_InformativosControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
infor: ${infor}
    ''';
  }
}
