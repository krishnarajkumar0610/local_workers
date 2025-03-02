import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreen.dart';
import 'package:workers_app/Pages/ThemeProvider/ThemeProvider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Provide ThemeProvider globally
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.isDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(), // Apply the theme dynamically
            home: const SignInScreen(),
          );
        },
      ),
    );
  }
}
