// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoleSelectingScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RoleSelectingScreenModel on _RoleSelectingScreenModelBase, Store {
  late final _$selectedRoleAtom = Atom(
      name: '_RoleSelectingScreenModelBase.selectedRole', context: context);

  @override
  String get selectedRole {
    _$selectedRoleAtom.reportRead();
    return super.selectedRole;
  }

  bool _selectedRoleIsInitialized = false;

  @override
  set selectedRole(String value) {
    _$selectedRoleAtom.reportWrite(
        value, _selectedRoleIsInitialized ? super.selectedRole : null, () {
      super.selectedRole = value;
      _selectedRoleIsInitialized = true;
    });
  }

  late final _$isRoleSelectedAtom = Atom(
      name: '_RoleSelectingScreenModelBase.isRoleSelected', context: context);

  @override
  bool get isRoleSelected {
    _$isRoleSelectedAtom.reportRead();
    return super.isRoleSelected;
  }

  bool _isRoleSelectedIsInitialized = false;

  @override
  set isRoleSelected(bool value) {
    _$isRoleSelectedAtom.reportWrite(
        value, _isRoleSelectedIsInitialized ? super.isRoleSelected : null, () {
      super.isRoleSelected = value;
      _isRoleSelectedIsInitialized = true;
    });
  }

  late final _$_RoleSelectingScreenModelBaseActionController =
      ActionController(name: '_RoleSelectingScreenModelBase', context: context);

  @override
  void setIsRoleSelected(bool value) {
    final _$actionInfo = _$_RoleSelectingScreenModelBaseActionController
        .startAction(name: '_RoleSelectingScreenModelBase.setIsRoleSelected');
    try {
      return super.setIsRoleSelected(value);
    } finally {
      _$_RoleSelectingScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRole(String value) {
    final _$actionInfo = _$_RoleSelectingScreenModelBaseActionController
        .startAction(name: '_RoleSelectingScreenModelBase.setRole');
    try {
      return super.setRole(value);
    } finally {
      _$_RoleSelectingScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedRole: ${selectedRole},
isRoleSelected: ${isRoleSelected}
    ''';
  }
}
