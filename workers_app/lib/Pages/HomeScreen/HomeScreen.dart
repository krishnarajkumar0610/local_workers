import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/BOs/UserBO.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/HomeScreen/HomeScreenProvider.dart';
import 'package:workers_app/Pages/Reusables/CustomTextFormField.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreen.dart';
import 'package:workers_app/Pages/ThemeProvider/ThemeProvider.dart';

class HomeScreen extends StatefulWidget {
  final UserBO user;
  HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  late FocusNode _searchFocusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          themeProvider.updateTheme();
                        },
                        child: themeProvider.isDarkTheme
                            ? const Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
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
                      decoration: const BoxDecoration(color: Colors.grey),
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
              body: provider.user!.profile.role.toLowerCase() == "owner"
                  ? provider.isLoading
                      ? const CircularProgressIndicator()
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w(context),
                              vertical: 15.h(context)),
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50.h(context),
                                child: CustomTextFormField(
                                  borderColor: Colors.black,
                                  onChanged: (value) =>
                                      provider.updateSearchText(value),
                                  borderRadius: 12,
                                  hintText: "Search worker",
                                  style: const TextStyle(),
                                  enabledfocusedBorder: Colors.black,
                                  node: _searchFocusNode,
                                ),
                              ),
                              Container(
                                height: 620,
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                  top: 10.h(context),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w(context),
                                ),
                                decoration:
                                    const BoxDecoration(color: Colors.red),
                                child: ListView.separated(
                                  itemBuilder: (context, index) => Container(
                                    margin: EdgeInsets.only(
                                        top: index == 0 ? 5.h(context) : 0),
                                    height: 150.h(context),
                                    width: 200.w(context),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius:
                                          BorderRadius.circular(12.r(context)),
                                    ),
                                    child: Row(
                                      children: [
                                        provider.filteredList[index].profile
                                                    .profileImg !=
                                                null
                                            ? Image.file(
                                                File(provider
                                                    .filteredList[index]
                                                    .profile
                                                    .profileImg),
                                                fit: BoxFit.cover,
                                                height: 80,
                                                width: 80,
                                              )
                                            : Image.asset(
                                                "${AppConstants.imageBaseURL}worker.png")
                                      ],
                                    ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 20.h(context),
                                  ),
                                  itemCount: provider.filteredList.length,
                                ),
                              )
                            ],
                          ),
                        )
                  : const Text("WORKER"),
            ),
          );
        },
      ),
    );
  }
}
