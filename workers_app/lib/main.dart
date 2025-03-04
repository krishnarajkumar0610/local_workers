import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/App.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/HomeScreen/HomeScreenProvider/HomeScreenProvider.dart';
import 'package:workers_app/Pages/ThemeProvider/ThemeProvider.dart';
import 'package:workers_app/Pages/WorkerDetailsScreen/WorkerScreenProvider/WorkerScreenProvider.dart';
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
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WorkerScreenProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}
