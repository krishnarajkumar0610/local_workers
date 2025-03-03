import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/BOs/UserBO.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/HomeScreen/HomeScreenProvider/HomeScreenProvider.dart';
import 'package:workers_app/Pages/Reusables/CustomButton.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreen.dart';
import 'package:workers_app/Pages/WorkerDetailsScreen/WorkerScreenProvider/WorkerScreenProvider.dart';

class WorkerDetailsScreen extends StatefulWidget {
  UserBO worker;
  WorkerDetailsScreen({super.key, required this.worker});

  @override
  State<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkerScreenProvider()..setWorker(widget.worker),
      child: Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          child: Consumer<WorkerScreenProvider>(
              builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w(context)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        splashColor:
                            Colors.transparent, // Removes ripple effect
                        highlightColor:
                            Colors.transparent, // Removes highlight effect
                        hoverColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 145.h(context),
                    width: 139.w(context),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 139.h(context),
                          width: 139.w(context),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child:
                              provider.currentWorker.profile.profileImg.isEmpty
                                  ? ClipOval(
                                      child: Image.asset(
                                        "${AppConstants.imageBaseURL}man.png",
                                        fit: BoxFit.cover,
                                        height: 139,
                                        width: 139,
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.file(
                                        File(provider
                                            .currentWorker.profile.profileImg),
                                        fit: BoxFit.cover,
                                        height: 139,
                                        width: 139,
                                      ),
                                    ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h(context),
                  ),
                  Text(
                    provider.currentWorker.fullName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp(context),
                    ),
                  ),
                  SizedBox(
                    height: 8.h(context),
                  ),
                  Text(
                    provider.currentWorker.profile.role,
                    style: TextStyle(
                      color: const Color(0xffABABAB),
                      fontSize: 18.sp(context),
                    ),
                  ),
                  SizedBox(
                    height: 15.h(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Worker Email",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.h(context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.w(context)),
                    height: 50.h(context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r(context)),
                      // border: Border.all(color: Colors.bla)
                    ),
                    child: Text(provider.currentWorker.emailId),
                  ),
                  SizedBox(
                    height: 15.h(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Worker Age",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.h(context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.w(context)),
                    height: 50.h(context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r(context)),
                      // border: Border.all(color: Colors.bla)
                    ),
                    child: Text(provider.currentWorker.profile.age),
                  ),
                  SizedBox(
                    height: 15.h(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Worker Job title",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.h(context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.w(context)),
                    height: 50.h(context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r(context)),
                      // border: Border.all(color: Colors.bla)
                    ),
                    child: Text(provider.currentWorker.profile.role),
                  ),
                  SizedBox(
                    height: 15.h(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Worker Job Experience",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.h(context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.w(context)),
                    height: 50.h(context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r(context)),
                      // border: Border.all(color: Colors.bla)
                    ),
                    child: Text(provider.currentWorker.profile.experience),
                  ),
                  SizedBox(
                    height: 15.h(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Worker phone number",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.h(context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.w(context)),
                    height: 50.h(context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r(context)),
                      // border: Border.all(color: Colors.bla)
                    ),
                    child: Text(
                        "+91 ${provider.currentWorker.profile.phoneNumber}"),
                  ),
                  SizedBox(
                    height: 15.h(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Worker description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.h(context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.w(context)),
                    height: 150.h(context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r(context)),
                      // border: Border.all(color: Colors.bla)
                    ),
                    child: Text(provider.currentWorker.profile.description),
                  ),
                  SizedBox(
                    height: 30.h(context),
                  ),
                  Consumer<HomeScreenProvider>(
                      builder: (context, homeScreeenProvider, child) {
                    return InkWell(
                      onTap: () {
                        homeScreeenProvider.hireWorker(
                            provider.currentWorker, homeScreeenProvider.user!);

                          /// Done until Hire worker
                      },
                      child: CustomButton(
                        height: 50,
                        width: 300,
                        buttonText: Text(
                          "Hire ${provider.currentWorker.fullName}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp(context),
                          ),
                        ),
                        borderRadius: 12,
                        buttonColor: const Color(0xff1D61E7),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20.h(context),
                  )
                ],
              ),
            );
          }),
        )),
      ),
    );
  }
}
