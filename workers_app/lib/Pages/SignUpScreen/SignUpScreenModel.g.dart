// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignUpScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpScreenModel on _SignUpScreenModelBase, Store {
  late final _$emailAtom =
      Atom(name: '_SignUpScreenModelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  bool _emailIsInitialized = false;

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, _emailIsInitialized ? super.email : null,
        () {
      super.email = value;
      _emailIsInitialized = true;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignUpScreenModelBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  bool _passwordIsInitialized = false;

  @override
  set password(String value) {
    _$passwordAtom
        .reportWrite(value, _passwordIsInitialized ? super.password : null, () {
      super.password = value;
      _passwordIsInitialized = true;
    });
  }

  late final _$fullNameAtom =
      Atom(name: '_SignUpScreenModelBase.fullName', context: context);

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  bool _fullNameIsInitialized = false;

  @override
  set fullName(String value) {
    _$fullNameAtom
        .reportWrite(value, _fullNameIsInitialized ? super.fullName : null, () {
      super.fullName = value;
      _fullNameIsInitialized = true;
    });
  }

  late final _$emailErrorMessageAtom =
      Atom(name: '_SignUpScreenModelBase.emailErrorMessage', context: context);

  @override
  String get emailErrorMessage {
    _$emailErrorMessageAtom.reportRead();
    return super.emailErrorMessage;
  }

  bool _emailErrorMessageIsInitialized = false;

  @override
  set emailErrorMessage(String value) {
    _$emailErrorMessageAtom.reportWrite(
        value, _emailErrorMessageIsInitialized ? super.emailErrorMessage : null,
        () {
      super.emailErrorMessage = value;
      _emailErrorMessageIsInitialized = true;
    });
  }

  late final _$passwordErrorMessageAtom = Atom(
      name: '_SignUpScreenModelBase.passwordErrorMessage', context: context);

  @override
  String get passwordErrorMessage {
    _$passwordErrorMessageAtom.reportRead();
    return super.passwordErrorMessage;
  }

  bool _passwordErrorMessageIsInitialized = false;

  @override
  set passwordErrorMessage(String value) {
    _$passwordErrorMessageAtom.reportWrite(value,
        _passwordErrorMessageIsInitialized ? super.passwordErrorMessage : null,
        () {
      super.passwordErrorMessage = value;
      _passwordErrorMessageIsInitialized = true;
    });
  }

  late final _$fullNameErrorMessageAtom = Atom(
      name: '_SignUpScreenModelBase.fullNameErrorMessage', context: context);

  @override
  String get fullNameErrorMessage {
    _$fullNameErrorMessageAtom.reportRead();
    return super.fullNameErrorMessage;
  }

  bool _fullNameErrorMessageIsInitialized = false;

  @override
  set fullNameErrorMessage(String value) {
    _$fullNameErrorMessageAtom.reportWrite(value,
        _fullNameErrorMessageIsInitialized ? super.fullNameErrorMessage : null,
        () {
      super.fullNameErrorMessage = value;
      _fullNameErrorMessageIsInitialized = true;
    });
  }

  late final _$isVisibleAtom =
      Atom(name: '_SignUpScreenModelBase.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  bool _isVisibleIsInitialized = false;

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(
        value, _isVisibleIsInitialized ? super.isVisible : null, () {
      super.isVisible = value;
      _isVisibleIsInitialized = true;
    });
  }

  late final _$isExistingUserAtom =
      Atom(name: '_SignUpScreenModelBase.isExistingUser', context: context);

  @override
  bool get isExistingUser {
    _$isExistingUserAtom.reportRead();
    return super.isExistingUser;
  }

  bool _isExistingUserIsInitialized = false;

  @override
  set isExistingUser(bool value) {
    _$isExistingUserAtom.reportWrite(
        value, _isExistingUserIsInitialized ? super.isExistingUser : null, () {
      super.isExistingUser = value;
      _isExistingUserIsInitialized = true;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SignUpScreenModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  bool _isLoadingIsInitialized = false;

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(
        value, _isLoadingIsInitialized ? super.isLoading : null, () {
      super.isLoading = value;
      _isLoadingIsInitialized = true;
    });
  }

  late final _$isValidUserAtom =
      Atom(name: '_SignUpScreenModelBase.isValidUser', context: context);

  @override
  bool get isValidUser {
    _$isValidUserAtom.reportRead();
    return super.isValidUser;
  }

  bool _isValidUserIsInitialized = false;

  @override
  set isValidUser(bool value) {
    _$isValidUserAtom.reportWrite(
        value, _isValidUserIsInitialized ? super.isValidUser : null, () {
      super.isValidUser = value;
      _isValidUserIsInitialized = true;
    });
  }

  late final _$_SignUpScreenModelBaseActionController =
      ActionController(name: '_SignUpScreenModelBase', context: context);

  @override
  void setValidUser(bool value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setValidUser');
    try {
      return super.setValidUser(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsExistingUser(bool value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setIsExistingUser');
    try {
      return super.setIsExistingUser(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsVisible(bool value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setIsVisible');
    try {
      return super.setIsVisible(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullName(String value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setFullName');
    try {
      return super.setFullName(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailErrorMessage(String value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setEmailErrorMessage');
    try {
      return super.setEmailErrorMessage(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordErrorMessage(String value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setPasswordErrorMessage');
    try {
      return super.setPasswordErrorMessage(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullNameErrorMessage(String value) {
    final _$actionInfo = _$_SignUpScreenModelBaseActionController.startAction(
        name: '_SignUpScreenModelBase.setFullNameErrorMessage');
    try {
      return super.setFullNameErrorMessage(value);
    } finally {
      _$_SignUpScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
fullName: ${fullName},
emailErrorMessage: ${emailErrorMessage},
passwordErrorMessage: ${passwordErrorMessage},
fullNameErrorMessage: ${fullNameErrorMessage},
isVisible: ${isVisible},
isExistingUser: ${isExistingUser},
isLoading: ${isLoading},
isValidUser: ${isValidUser}
    ''';
  }
}
