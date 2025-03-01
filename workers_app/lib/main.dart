import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:workers_app/App.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Services/SecureStorageService/ISecureStorageService.dart';
import 'package:workers_app/Services/SecureStorageService/SecureStorageService.dart';
import 'package:workers_app/main.reflectable.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  initializeReflectable();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ResponsiveUIHelper.setUIBase(uiSize: const Size(375, 812));
  GetIt.instance
      .registerFactory<ISecureStorageService>(() => SecureStorageService());
  runApp(const MyApp());
}
