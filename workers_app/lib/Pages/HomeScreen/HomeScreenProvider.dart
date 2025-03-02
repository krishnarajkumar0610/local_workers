import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/BOs/ProfileBO.dart';
import 'package:workers_app/BOs/UserBO.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Pages/material.dart';
import 'package:workers_app/Services/SecureStorageService/ISecureStorageService.dart';

class HomeScreenProvider extends ChangeNotifier {
  UserBO? user;
  List listOfUsers = [];
  String searchText = "";
  bool isLoading = false;
  ISecureStorageService secureStorageService =
      GetIt.instance.get<ISecureStorageService>();
  List filteredList = [];
  void setUser(UserBO user) {
    try {
      this.user = user;
      notifyListeners();
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> getUsers() async {
    try {
      isLoading = true;
      notifyListeners();
      String? usersResponse =
          await secureStorageService.retrieveData(AppConstants.listOfUsersKey);
      if (usersResponse != null && usersResponse.isNotEmpty) {
        for (var user in jsonDecode(usersResponse)) {
          listOfUsers.add(
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
            ),
          );
        }
        filteredList = listOfUsers;
        await Future.delayed(const Duration(seconds: 3));
        isLoading = false;
        notifyListeners();
      }
    } catch (ex) {
      print(ex);
    }
  }

  void updateSearchText(String value) {
    try {
      searchText = value;
      notifyListeners();
    } catch (ex) {
      print(ex);
    }
  }
}
