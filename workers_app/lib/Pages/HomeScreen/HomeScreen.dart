import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/BOs/UserBO.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/HomeScreen/HomeScreenProvider.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreen.dart';
import 'package:workers_app/Pages/ThemeProvider/ThemeProvider.dart';

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
      create: (context) => HomeScreenProvider()
        ..setUser(widget.user)
        ..getUsers(),
      child: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff2567E8),
                title: Text(
                  "Welcome ${provider.user!.fullName}",
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                actions: [
                  Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return InkWell(
                        splashColor:
                            Colors.transparent, // Removes ripple effect
                        highlightColor:
                            Colors.transparent, // Removes highlight effect
                        hoverColor: Colors.transparent,
                        onTap: () {
                          themeProvider.updateTheme();
                        },
                        child: themeProvider.isDarkTheme
                            ? const Icon(Icons.dark_mode)
                            : const Icon(Icons.sunny, color: Colors.yellow),
                      );
                    },
                  ),
                  SizedBox(
                    width: 15.h(context),
                  )
                ],
              ),
              drawer: Drawer(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text(provider.user?.fullName ?? "Guest"),
                      accountEmail: Text(provider.user?.emailId ?? "No Email"),
                      currentAccountPicture: ClipOval(
                        child: provider.user!.profile.profileImg.isEmpty
                            ? Image.asset(
                                "${AppConstants.imageBaseURL}man.png",
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              )
                            : Image.file(
                                File(provider.user!.profile.profileImg),
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Profile"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Logout"),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
