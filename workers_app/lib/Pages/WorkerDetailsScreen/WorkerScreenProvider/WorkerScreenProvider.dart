import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/BOs/UserBO.dart';

class WorkerScreenProvider extends ChangeNotifier {
  late UserBO currentWorker;
  void setWorker(UserBO worker) {
    try {
      currentWorker = worker;
    } catch (ex) {
      print(ex);
    }
  }
}
