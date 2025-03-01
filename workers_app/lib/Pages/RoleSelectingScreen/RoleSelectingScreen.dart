import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/ProfileScreen/ProfileScreen.dart';
import 'package:workers_app/Pages/Reusables/CustomButton.dart';
import 'package:workers_app/Pages/RoleSelectingScreen/RoleSelectingScreenVM.dart';

// ignore: must_be_immutable
class RoleSelectingScreen extends StatefulWidget {
  String fullName;
  String email;
  String password;
  RoleSelectingScreen({
    super.key,
    required this.email,
    required this.fullName,
    required this.password,
  });

  @override
  State<RoleSelectingScreen> createState() => _RoleSelectingScreenState();
}

class _RoleSelectingScreenState extends State<RoleSelectingScreen> {
  late RoleSelectingScreenVM _roleSelectingScreeenVM;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _roleSelectingScreeenVM = RoleSelectingScreenVM();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        automaticallyImplyLeading: false,
        title: const Text(
          "Select Role",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h(context),
            ),
            Observer(builder: (context) {
              return InkWell(
                onTap: () {
                  _roleSelectingScreeenVM.updateUserRole("Worker");
                },
                child: Container(
                  height: 250.h(context),
                  width: 300.w(context),
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.r(context),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12.r(context))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 15.w(context),
                            top: 15.h(context),
                          ),
                          height: 20.h(context),
                          width: 20.w(context),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: _roleSelectingScreeenVM.selectedRole ==
                                      "Worker"
                                  ? const Color(0xff1D61E7)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h(context),
                      ),
                      Image.asset(
                        "${AppConstants.imageBaseURL}worker.png",
                        height: 100.h(context),
                        width: 100.w(context),
                      ),
                      SizedBox(
                        height: 15.h(context),
                      ),
                      Text(
                        "Worker",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp(context),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 50.h(context),
            ),
            Observer(builder: (context) {
              return InkWell(
                onTap: () {
                  _roleSelectingScreeenVM.updateUserRole("Owner");
                },
                child: Container(
                  height: 250.h(context),
                  width: 300.w(context),
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.r(context),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12.r(context))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 15.w(context),
                            top: 15.h(context),
                          ),
                          height: 20.h(context),
                          width: 20.w(context),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: _roleSelectingScreeenVM.selectedRole ==
                                      "Owner"
                                  ? const Color(0xff1D61E7)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h(context),
                      ),
                      Image.asset(
                        "${AppConstants.imageBaseURL}man.png",
                        height: 100.h(context),
                        width: 100.w(context),
                      ),
                      SizedBox(
                        height: 15.h(context),
                      ),
                      Text(
                        "Owner",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp(context),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 50.h(context),
            ),
            Observer(builder: (context) {
              return _roleSelectingScreeenVM.isRoleSelected
                  ? InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProfileScreen(
                              password: widget.password,
                              email: widget.email,
                              fullName: widget.fullName,
                              role: _roleSelectingScreeenVM.selectedRole,
                            );
                          },
                        ));
                      },
                      child: CustomButton(
                          buttonColor: const Color(0xff1D61E7),
                          height: 50.h(context),
                          width: 100.w(context),
                          buttonText: const Text("Next",
                              style: TextStyle(color: Colors.white)),
                          borderRadius: 12.r(context)),
                    )
                  : const SizedBox.shrink();
            })
          ],
        ),
      ),
    );
  }
}
