// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elephant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ElephantStore on _ElephantStoreBase, Store {
  Computed<Elephant> _$elephantComputed;

  @override
  Elephant get elephant =>
      (_$elephantComputed ??= Computed<Elephant>(() => super.elephant,
              name: '_ElephantStoreBase.elephant'))
          .value;

  final _$_elephantAtom = Atom(name: '_ElephantStoreBase._elephant');

  @override
  Elephant get _elephant {
    _$_elephantAtom.reportRead();
    return super._elephant;
  }

  @override
  set _elephant(Elephant value) {
    _$_elephantAtom.reportWrite(value, super._elephant, () {
      super._elephant = value;
    });
  }

  final _$_ElephantStoreBaseActionController =
      ActionController(name: '_ElephantStoreBase');

  @override
  dynamic getNewElephant() {
    final _$actionInfo = _$_ElephantStoreBaseActionController.startAction(
        name: '_ElephantStoreBase.getNewElephant');
    try {
      return super.getNewElephant();
    } finally {
      _$_ElephantStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
elephant: ${elephant}
    ''';
  }
}
