import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/Services/SecureStorageService/ISecureStorageService.dart';
part 'SignUpScreenModel.g.dart';

class SignUpScreenModel = _SignUpScreenModelBase with _$SignUpScreenModel;

abstract class _SignUpScreenModelBase with Store {
  ISecureStorageService secureStorageService =
      GetIt.instance.get<ISecureStorageService>();
  @observable
  late String email;
  @observable
  late String password;
  @observable
  late String fullName;

  @observable
  late String emailErrorMessage;
  @observable
  late String passwordErrorMessage;
  @observable
  late String fullNameErrorMessage;

  @observable
  late bool isVisible;

  @observable
  late bool isExistingUser;

  @observable
  late bool isLoading;

  @observable
  late bool isValidUser;

  @action
  void setValidUser(bool value) {
    isValidUser = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setIsExistingUser(bool value) {
    isExistingUser = value;
  }

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
  void setFullName(String value) {
    fullName = value;
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
  void setFullNameErrorMessage(String value) {
    fullNameErrorMessage = value;
  }
}
