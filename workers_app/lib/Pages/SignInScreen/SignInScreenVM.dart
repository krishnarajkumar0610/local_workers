import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreenModel.dart';

class SignInScreenVM extends SignInScreenModel {
  SignInScreenVM() {
    try {
      setEmail("");
      setPassword("");
      setEmailErrorMessage("");
      setPasswordErrorMessage("");
      setIsVisible(false);
      setIsUserCanLogIn(true);
    } catch (ex) {
      print(ex);
    }
  }

  void updateEmail(String value) {
    try {
      setEmail(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updatePassword(String value) {
    try {
      setPassword(value);
      print(password);
    } catch (ex) {
      print(ex);
    }
  }

  void updateEmailErrorMessage(String value) {
    try {
      setEmailErrorMessage(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updatePasswordErrorMessage(String value) {
    try {
      setPasswordErrorMessage(value);
    } catch (ex) {
      print(ex);
    }
  }

  void validateEmail() {
    try {
      if (email.isEmpty) {
        setEmailErrorMessage("Please enter email ID");
        setIsUserCanLogIn(false);
      } else if (!AppConstants.emailRegEx.hasMatch(email)) {
        setEmailErrorMessage("Please enter valid email ID");
        setIsUserCanLogIn(false);
      } else {
        setEmailErrorMessage("");
        setIsUserCanLogIn(true);
      }
    } catch (ex) {
      print("Email is Error: $ex");
    }
  }

  void validatePassword() {
    try {
      if (password.isEmpty) {
        setPasswordErrorMessage("Please enter Password");
        setIsUserCanLogIn(false);
      } else if (!AppConstants.passwordRegEx.hasMatch(password)) {
        setPasswordErrorMessage("Please enter valid Password");
        setIsUserCanLogIn(false);
      } else {
        setPasswordErrorMessage("");
        setIsUserCanLogIn(true);
      }
    } catch (ex) {
      print("Password is Error: $ex");
    }
  }

  void updateVisibility() {
    try {
      print(!isVisible);
      setIsVisible(!isVisible);
    } catch (ex) {
      print(ex);
    }
  }

  void validateDetails() {
    try {
      validateEmail();
      validatePassword();
    } catch (ex) {
      print(ex);
    }
  }

  void removeErrorMessage(String fieldName) {
    try {
      switch (fieldName) {
        case "email":
          setEmailErrorMessage("");
          break;
        case "password":
          setPasswordErrorMessage("");
          break;
      }
    } catch (ex) {
      print(ex);
    }
  }
}
