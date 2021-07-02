// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_pet_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroPetController = BindInject(
  (i) => CadastroPetController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroPetController on _CadastroPetControllerBase, Store {
  final _$loadingFormAtom =
      Atom(name: '_CadastroPetControllerBase.loadingForm');

  @override
  bool get loadingForm {
    _$loadingFormAtom.reportRead();
    return super.loadingForm;
  }

  @override
  set loadingForm(bool value) {
    _$loadingFormAtom.reportWrite(value, super.loadingForm, () {
      super.loadingForm = value;
    });
  }

  final _$createPetAsyncAction =
      AsyncAction('_CadastroPetControllerBase.createPet');

  @override
  Future<ResourceData<dynamic>> createPet(PetEntity pet) {
    return _$createPetAsyncAction.run(() => super.createPet(pet));
  }

  final _$getPetAsyncAction = AsyncAction('_CadastroPetControllerBase.getPet');

  @override
  Future<ResourceData<PetEntity>> getPet(int id) {
    return _$getPetAsyncAction.run(() => super.getPet(id));
  }

  final _$_CadastroPetControllerBaseActionController =
      ActionController(name: '_CadastroPetControllerBase');

  @override
  void alteraLoading(bool value) {
    final _$actionInfo = _$_CadastroPetControllerBaseActionController
        .startAction(name: '_CadastroPetControllerBase.alteraLoading');
    try {
      return super.alteraLoading(value);
    } finally {
      _$_CadastroPetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingForm: ${loadingForm}
    ''';
  }
}
