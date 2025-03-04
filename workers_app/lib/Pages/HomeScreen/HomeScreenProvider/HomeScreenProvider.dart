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
  late UserBO user;
  List<UserBO> listOfUsers = [];
  String searchText = "";
  bool isLoading = false;
  bool isFileredListEmpty = false;
  ISecureStorageService secureStorageService =
      GetIt.instance.get<ISecureStorageService>();
  List<UserBO> filteredList = [];
  void setUser(UserBO user) {
    try {
      this.user = user;
      print("USER : ${user.fullName}");
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
        listOfUsers
            .clear(); // Ensure the list is cleared before adding new users.

        for (var user in jsonDecode(usersResponse)) {
          List<UserBO> myClients =
              []; // Change from `List<dynamic>` to `List<UserBO>`

          // This loop deserializes the 'clients' list for every user
          for (var data in user['clients']) {
            var client = JsonMapper.deserialize<UserBO>(data);
            if (client != null) {
              myClients.add(client);
            }
          }

          // Add the UserBO instance to the list
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
              clients: myClients, // Assign the correctly typed list
            ),
          );
        }

        filteredList = List.from(listOfUsers);
        print("FILTERED LIST : $filteredList");

        await Future.delayed(const Duration(seconds: 3));

        isLoading = false;
        notifyListeners();
        checkListIsEmpty();
      }
    } catch (ex) {
      print("Error fetching users: $ex");
    }
  }

  void updateSearchText(String value) {
    try {
      searchText = value.trim();

      if (searchText.isEmpty) {
        filteredList =
            List.from(listOfUsers); // Ensure it's a new list reference
      } else {
        filteredList = listOfUsers
            .where((workerData) => workerData.profile.jobTitle
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
      }

      checkListIsEmpty();
      notifyListeners(); // Call notifyListeners() only once
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> hireWorker(
      {required UserBO client, required UserBO worker}) async {
    try {
      for (var workerData in listOfUsers) {
        if (workerData.id == worker.id) {
          workerData.clients.add(client);
          print("Client ${client.fullName} added to worker ${worker.fullName}");
          break;
        }
      }

      // Instead of clearing, just update the list
      filteredList = List.from(listOfUsers);
      notifyListeners();
    } catch (ex, stacktrace) {
      print("Exception: $ex");
      print("Stacktrace: $stacktrace");
    }
  }

  void checkListIsEmpty() {
    try {
      filteredList.isEmpty
          ? isFileredListEmpty = true
          : isFileredListEmpty = false;
      notifyListeners();
    } catch (ex) {
      print(ex);
    }
  }
}
