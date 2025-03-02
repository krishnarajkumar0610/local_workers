import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/BOs/UserBO.dart';

class HomeScreenProvider extends ChangeNotifier {
  UserBO? user;
  void setUser(UserBO user) {
    try {
      this.user = user;
      notifyListeners();
    } catch (ex) {
      print(ex);
    }
  }
}
