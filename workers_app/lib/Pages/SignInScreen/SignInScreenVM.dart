import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:workers_app/BOs/ProfileBO.dart';
import 'package:workers_app/BOs/UserBO.dart';
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
      setIsUserCanLogIn(false);
      setLoading(false);
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

  void updateVisibility() {
    try {
      print(!isVisible);
      setIsVisible(!isVisible);
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> validateDetails() async {
    try {
      validateEmail();
      validatePassword();
      if (email.isNotEmpty && password.isNotEmpty) {
        String? listOfUserResponse = await secureStorageService
            .retrieveData(AppConstants.listOfUsersKey);
        List<dynamic> userData = [];

        if (listOfUserResponse != null && listOfUserResponse.isNotEmpty) {
          print("IF DA");
          userData = jsonDecode(listOfUserResponse);

          for (var user in userData) {
            print(user['emailId']);

            if (user['emailId'] == email && user['password'] == password) {
              print("IRUKU DA ${user['profile']['role']}");

              List<UserBO> myClients = []; // Explicitly define as List<UserBO>

              // Deserialize 'clients' and ensure proper type
              for (var data in user['clients']) {
                var client = JsonMapper.deserialize<UserBO>(data);
                if (client != null) {
                  myClients.add(client);
                }
              }

              setUser(
                UserBO(
                  emailId: user['emailId'],
                  fullName: user['fullName'],
                  id: user['id'].toString(),
                  password: user['password'],
                  profile: ProfileBO(
                    age: user['profile']['age'].toString(),
                    description: user['profile']['description'],
                    experience: user['profile']['experience'].toString(),
                    jobTitle: user['profile']['jobTitle'],
                    phoneNumber: user['profile']['phoneNumber'].toString(),
                    profileImg: user['profile']['profileImg'],
                    role: user['profile']['role'],
                  ),
                  clients: myClients, // Assign properly typed list
                ),
              );

              print("MY USER IMAGE: ${myUser.profile.profileImg}");
              setIsUserCanLogIn(true);
              return;
            }
          }

          setEmailErrorMessage("Email or password is incorrect");
        } else {
          setEmailErrorMessage("Email not found");
        }
      }
    } catch (ex) {
      print("Error in validateDetails: $ex");
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
