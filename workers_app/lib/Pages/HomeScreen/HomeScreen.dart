// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/BOs/UserBO.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/HomeScreen/HomeScreenProvider/HomeScreenProvider.dart';
import 'package:workers_app/Pages/Reusables/CustomTextFormField.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreen.dart';
import 'package:workers_app/Pages/ThemeProvider/ThemeProvider.dart';
import 'package:workers_app/Pages/WorkerDetailsScreen/WorkerDetailsScreen.dart';

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
                backgroundColor: Colors.blueAccent,
                title: Text(
                  "Welcome, ${provider.user?.fullName ?? "User"}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: [
                  Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return IconButton(
                        onPressed: () => themeProvider.updateTheme(),
                        icon: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Icon(
                            themeProvider.isDarkTheme
                                ? Icons.dark_mode
                                : Icons.sunny,
                            key: ValueKey<bool>(themeProvider.isDarkTheme),
                            color: themeProvider.isDarkTheme
                                ? Colors.white
                                : Colors.yellow,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 15.h(context)),
                ],
              ),
              drawer: Drawer(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      accountName: Text(provider.user?.fullName ?? "Guest"),
                      accountEmail: Text(provider.user?.emailId ?? "No Email"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: _getUserProfileImage(
                            provider.user?.profile.profileImg),
                      ),
                    ),
                    _buildDrawerItem(
                        Icons.person, "Profile", () => Navigator.pop(context)),
                    _buildDrawerItem(Icons.logout, "Logout", () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    }),
                  ],
                ),
              ),
              body: provider.user?.profile.role.toLowerCase() == "owner"
                  ? provider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: EdgeInsets.all(15.w(context)),
                          child: Column(
                            children: [
                              CustomTextFormField(
                                borderColor: Colors.grey,
                                onChanged: provider.updateSearchText,
                                borderRadius: 12,
                                hintText: "Search worker (eg: Driver)",
                                style: const TextStyle(fontSize: 16),
                                enabledfocusedBorder: Colors.grey,
                                node: FocusNode(),
                              ),
                              Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.only(top: 10.h(context)),
                                  itemCount: provider.filteredList
                                      .where((worker) =>
                                          worker.profile.role.toLowerCase() ==
                                          "worker")
                                      .length, // Show only workers
                                  itemBuilder: (context, index) {
                                    final worker = provider.filteredList
                                        .where((worker) =>
                                            worker.profile.role.toLowerCase() ==
                                            "worker")
                                        .toList()[index]; // Get worker details
                                    return Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: _getUserProfileImage(
                                              worker.profile.profileImg),
                                        ),
                                        title: Text(worker.fullName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        subtitle:
                                            const Text("Tap to view details"),
                                        trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WorkerDetailsScreen(
                                                  worker: worker,
                                                ),
                                              ));
                                        },
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 15.h(context)),
                                ),
                              )
                            ],
                          ),
                        )
                  : _buildWorkerView(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWorkerView() {
    return const Center(
      child: Text(
        "WORKER VIEW",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

// Profile image showing status
  ImageProvider _getUserProfileImage(String? imagePath) {
    if (imagePath != null && imagePath.isNotEmpty) {
      final File imageFile = File(imagePath);
      if (imageFile.existsSync()) {
        return FileImage(imageFile);
      }
    }
    return const AssetImage("${AppConstants.imageBaseURL}man.png");
  }

// Drawer items
  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }
}
