// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignInScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInScreenModel on _SignInScreenModelBase, Store {
  late final _$emailAtom =
      Atom(name: '_SignInScreenModelBase.email', context: context);

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
      Atom(name: '_SignInScreenModelBase.password', context: context);

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

  late final _$emailErrorMessageAtom =
      Atom(name: '_SignInScreenModelBase.emailErrorMessage', context: context);

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
      name: '_SignInScreenModelBase.passwordErrorMessage', context: context);

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

  late final _$isVisibleAtom =
      Atom(name: '_SignInScreenModelBase.isVisible', context: context);

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

  late final _$isUserCanLogInAtom =
      Atom(name: '_SignInScreenModelBase.isUserCanLogIn', context: context);

  @override
  bool get isUserCanLogIn {
    _$isUserCanLogInAtom.reportRead();
    return super.isUserCanLogIn;
  }

  bool _isUserCanLogInIsInitialized = false;

  @override
  set isUserCanLogIn(bool value) {
    _$isUserCanLogInAtom.reportWrite(
        value, _isUserCanLogInIsInitialized ? super.isUserCanLogIn : null, () {
      super.isUserCanLogIn = value;
      _isUserCanLogInIsInitialized = true;
    });
  }

  late final _$_SignInScreenModelBaseActionController =
      ActionController(name: '_SignInScreenModelBase', context: context);

  @override
  void setIsVisible(bool value) {
    final _$actionInfo = _$_SignInScreenModelBaseActionController.startAction(
        name: '_SignInScreenModelBase.setIsVisible');
    try {
      return super.setIsVisible(value);
    } finally {
      _$_SignInScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignInScreenModelBaseActionController.startAction(
        name: '_SignInScreenModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignInScreenModelBaseActionController.startAction(
        name: '_SignInScreenModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailErrorMessage(String value) {
    final _$actionInfo = _$_SignInScreenModelBaseActionController.startAction(
        name: '_SignInScreenModelBase.setEmailErrorMessage');
    try {
      return super.setEmailErrorMessage(value);
    } finally {
      _$_SignInScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordErrorMessage(String value) {
    final _$actionInfo = _$_SignInScreenModelBaseActionController.startAction(
        name: '_SignInScreenModelBase.setPasswordErrorMessage');
    try {
      return super.setPasswordErrorMessage(value);
    } finally {
      _$_SignInScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsUserCanLogIn(bool value) {
    final _$actionInfo = _$_SignInScreenModelBaseActionController.startAction(
        name: '_SignInScreenModelBase.setIsUserCanLogIn');
    try {
      return super.setIsUserCanLogIn(value);
    } finally {
      _$_SignInScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
emailErrorMessage: ${emailErrorMessage},
passwordErrorMessage: ${passwordErrorMessage},
isVisible: ${isVisible},
isUserCanLogIn: ${isUserCanLogIn}
    ''';
  }
}
