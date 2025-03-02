import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/BOs/ProfileBO.dart';
import 'package:workers_app/BOs/UserBO.dart';
import 'package:workers_app/Pages/ProfileScreen/ProfileScreen.dart';
import 'package:workers_app/Services/SecureStorageService/ISecureStorageService.dart';
part 'SignInScreenModel.g.dart';

class SignInScreenModel = _SignInScreenModelBase with _$SignInScreenModel;

abstract class _SignInScreenModelBase with Store {
  ISecureStorageService secureStorageService =
      GetIt.instance.get<ISecureStorageService>();
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
  @observable
  late bool isLoading;
  @observable
  late UserBO myUser;

  @action
  void setUser(UserBO value) {
    myUser = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
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
