// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<HomeScreenProvider>()
        ..setUser(widget.user)
        ..getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                  color: Colors.white), // Change drawer icon color
              backgroundColor: Colors.blueAccent,
              title: Text(
                "Welcome, ${provider.user.fullName}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              actions: [
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return IconButton(
                      onPressed: () => themeProvider.updateTheme(),
                      icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: themeProvider.isDarkTheme
                              ? const Icon(
                                  Icons.sunny,
                                  color: Colors.yellow,
                                )
                              : const Icon(
                                  Icons.dark_mode,
                                  color: Colors.black,
                                )),
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
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.lightBlue
                        ], // Smooth gradient
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    accountName: Text(
                      provider.user.fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    accountEmail: Text(
                      provider.user.emailId,
                      style: const TextStyle(
                        color: Colors.white, // Softer contrast for the email
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white, // Subtle border effect
                      child: CircleAvatar(
                        radius: 33,
                        backgroundImage: _getUserProfileImage(
                            provider.user.profile.profileImg),
                      ),
                    ),
                  ),
                  // ListTile(
                  //   leading: Consumer<ThemeProvider>(
                  //       builder: (context, themeProvider, child) {
                  //     return Icon(Icons.person,
                  //         color: themeProvider.isDarkTheme
                  //             ? Colors.white
                  //             : Colors.black);
                  //   }),
                  //   title: const Text("Profile",
                  //       style: TextStyle(
                  //           fontSize: 16, fontWeight: FontWeight.w500)),
                  //   onTap: () => Navigator.pop(context),
                  // ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text("Logout",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        )),
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                    ),
                  )
                ],
              ),
            ),
            body: provider.user.profile.role.toLowerCase() == "owner"
                ? provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: EdgeInsets.all(15.w(context)),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              borderColor: Colors.grey,
                              onChanged: (value) =>
                                  provider.updateSearchText(value),
                              borderRadius: 12,
                              hintText: "Search worker (eg: Driver)",
                              style: const TextStyle(fontSize: 16),
                              enabledfocusedBorder: Colors.grey,
                              node: FocusNode(),
                            ),
                            provider.isFileredListEmpty
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 150.h(context),
                                      ),
                                      SizedBox(
                                        height: 100.h(context),
                                        child: Image.asset(
                                          "${AppConstants.imageBaseURL}worker.png",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50.h(context),
                                      ),
                                      Text(
                                        "No workers found",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.sp(context),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  )
                                : Expanded(
                                    child: ListView.separated(
                                      padding:
                                          EdgeInsets.only(top: 10.h(context)),
                                      itemCount: provider.filteredList
                                          .where((worker) =>
                                              worker.profile.role
                                                  .toLowerCase() ==
                                              "worker")
                                          .length, // Show only workers
                                      itemBuilder: (context, index) {
                                        final worker = provider.filteredList
                                                .where((worker) =>
                                                    worker.profile.role
                                                        .toLowerCase() ==
                                                    "worker")
                                                .toList()[
                                            index]; // Get worker details
                                        return InkWell(
                                          splashColor: Colors
                                              .transparent, // Removes ripple effect
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WorkerDetailsScreen(
                                                        worker: worker),
                                              ),
                                            );
                                          },
                                          child: Consumer<ThemeProvider>(
                                              builder: (context, themeProvider,
                                                  child) {
                                            return Card(
                                              surfaceTintColor: Colors.white,
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 10.w(context),
                                                vertical: 8.h(context),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  children: [
                                                    // Profile Image
                                                    CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage:
                                                          _getUserProfileImage(
                                                              worker.profile
                                                                  .profileImg),
                                                    ),
                                                    const SizedBox(width: 15),

                                                    // Worker Details
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            worker.fullName,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: themeProvider
                                                                      .isDarkTheme
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black87,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Text(
                                                            worker.profile.role
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: themeProvider
                                                                      .isDarkTheme
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black87,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Text(
                                                            "Tap to view details",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: themeProvider
                                                                      .isDarkTheme
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    // Action Icon
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: themeProvider
                                                              .isDarkTheme
                                                          ? Colors.white
                                                          : Colors.black,
                                                      size: 18,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
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
