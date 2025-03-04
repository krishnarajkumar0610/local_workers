import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/BOs/UserBO.dart';

class WorkerScreenProvider extends ChangeNotifier {
  UserBO? currentWorker;
  void setWorker(UserBO worker) {
    try {
      currentWorker = worker;
      print("MY CURRENT WORKER : $currentWorker");
      notifyListeners();
    } catch (ex) {
      print(ex);
    }
  }
}
