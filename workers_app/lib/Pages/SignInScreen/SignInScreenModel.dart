import 'package:mobx/mobx.dart';
part 'SignInScreenModel.g.dart';

class SignInScreenModel = _SignInScreenModelBase with _$SignInScreenModel;

abstract class _SignInScreenModelBase with Store {
  @observable
  late String email;
  @observable
  late String password;
  @observable
  late String emailErrorMessage;
  @observable
  late String passwordErrorMessage;
  @observable
  late bool isVisible;
  @observable
  late bool isUserCanLogIn;
  @action
  void setIsVisible(bool value) {
    isVisible = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setEmailErrorMessage(String value) {
    emailErrorMessage = value;
  }

  @action
  void setPasswordErrorMessage(String value) {
    passwordErrorMessage = value;
  }

  @action
  void setIsUserCanLogIn(bool value) {
    isUserCanLogIn = value;
  }
}
