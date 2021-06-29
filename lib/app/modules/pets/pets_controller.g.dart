// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PetsController = BindInject(
  (i) => PetsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetsController on _PetsControllerBase, Store {
  final _$petsAtom = Atom(name: '_PetsControllerBase.pets');

  @override
  ResourceData<List<PetEntity>> get pets {
    _$petsAtom.reportRead();
    return super.pets;
  }

  @override
  set pets(ResourceData<List<PetEntity>> value) {
    _$petsAtom.reportWrite(value, super.pets, () {
      super.pets = value;
    });
  }

  final _$getPetsAsyncAction = AsyncAction('_PetsControllerBase.getPets');

  @override
  Future getPets() {
    return _$getPetsAsyncAction.run(() => super.getPets());
  }

  final _$_PetsControllerBaseActionController =
      ActionController(name: '_PetsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_PetsControllerBaseActionController.startAction(
        name: '_PetsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PetsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pets: ${pets}
    ''';
  }
}
