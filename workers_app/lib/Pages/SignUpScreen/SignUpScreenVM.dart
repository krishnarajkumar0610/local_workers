import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:workers_app/BOs/UserBO/UserBO.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Pages/SignUpScreen/SignUpScreenModel.dart';

class SignUpScreenVM extends SignUpScreenModel {
  SignUpScreenVM() {
    try {
      setEmail("");
      setPassword("");
      setFullName("");
      setEmailErrorMessage("");
      setPasswordErrorMessage("");
      setFullNameErrorMessage("");
      setIsVisible(false);
      setIsExistingUser(false);
      setLoading(false);
      setValidUser(false);
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

  void updateFullName(String value) {
    try {
      setFullName(value);
    } catch (ex) {
      print(ex);
    }
  }

  void validateEmail() {
    try {
      if (email.isEmpty) {
        setEmailErrorMessage("Please enter email ID");
      } else if (!AppConstants.emailRegEx.hasMatch(email)) {
        setEmailErrorMessage("Please enter valid email ID");
      } else {
        setEmailErrorMessage("");
      }
    } catch (ex) {
      print("Email is Error: $ex");
    }
  }

  void validatePassword() {
    try {
      if (password.isEmpty) {
        setPasswordErrorMessage("Please enter Password");
      } else if (!AppConstants.passwordRegEx.hasMatch(password)) {
        setPasswordErrorMessage("Please enter valid Password");
      } else {
        setPasswordErrorMessage("");
      }
    } catch (ex) {
      print("Password is Error: $ex");
    }
  }

  void validateFullName() {
    try {
      if (fullName.isEmpty) {
        setFullNameErrorMessage("Please enter Full name");
      } else {
        setFullNameErrorMessage("");
      }
    } catch (ex) {
      print("Full name is Error: $ex");
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
      validateFullName();
      validateEmail();
      validatePassword();
    } catch (ex) {
      print(ex);
    }
  }

  void removeErrorMessage(String fieldName) {
    try {
      switch (fieldName) {
        case "full name":
          setFullNameErrorMessage("");
          break;
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

  Future<void> signUp() async {
    try {
      validateDetails();
      if (emailErrorMessage.isEmpty &&
          passwordErrorMessage.isEmpty &&
          fullNameErrorMessage.isEmpty) {
        // Retrieve existing users from storage
        String? usersResponse = await secureStorageService
            .retrieveData(AppConstants.listOfUsersKey);
        List<dynamic> usersList = [];

        if (usersResponse != null && usersResponse.isNotEmpty) {
          try {
            usersList = jsonDecode(usersResponse); // Parse JSON string to list
            print("EXISTING USERS BEFORE ADDING: $usersList");
          } catch (e) {
            print("Error decoding existing users: $e");
            usersList = [];
          }
        }

        // Convert userJson to a valid JSON object before adding

        // Check if the user already exists (optional)
        bool userExists = usersList.any((user) => user['emailId'] == email);
        if (userExists) {
          setIsExistingUser(true);
          print("User with email ${email} already exists!");
          print("SETTED : $isExistingUser");
          setValidUser(false);
          return;
        }
        setValidUser(true);
        setLoading(true);
        await Future.delayed(const Duration(seconds: 3));
        setLoading(false);
      } else {
        setValidUser(false);
      }
      print("LOADING STATE: $isLoading");
    } catch (ex) {
      print("Error in signUp: $ex");
    }
  }

  void updateAlreadyExistingErrorMessage() {
    try {
      setIsExistingUser(false);
    } catch (ex) {
      print(ex);
    }
  }

  void updateLoading(bool value) {
    try {
      setLoading(value);
    } catch (ex) {
      print(ex);
    }
  }
}
