import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/BOs/UserBO.dart';
import 'package:workers_app/Pages/HomeScreen/HomeScreenProvider.dart';

class HomeScreen extends StatefulWidget {
  final UserBO user;
  HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeScreenProvider()..setUser(widget.user), // ✅ Set user here
      child: Scaffold(
        body: Center(
          child: Consumer<HomeScreenProvider>(
            builder: (context, provider, child) {
              return Text(
                  provider.user?.emailId ?? "No Email"); // ✅ Handles null user
            },
          ),
        ),
      ),
    );
  }
}
