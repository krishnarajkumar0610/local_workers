import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/ProfileScreen/ProfileScreenVM.dart';
import 'package:workers_app/Pages/Reusables/CustomButton.dart';
import 'package:workers_app/Pages/Reusables/CustomTextFormField.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreen.dart';

class ProfileScreen extends StatefulWidget {
  String fullName;
  String email;
  String password;
  String role;
  ProfileScreen({
    super.key,
    required this.password,
    required this.email,
    required this.fullName,
    required this.role,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _experienceController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _ageController;
  late TextEditingController _descriptionController;
  late TextEditingController _jobTitleController;
  late FocusNode _descriptionFocusNode;
  late FocusNode _experienceFocusNode;
  late FocusNode _phoneNumberFocusNode;
  late FocusNode _ageFocusNode;
  late FocusNode _jobTitleFocusNode;
  late ProfileScreenVM _profileScreenVM;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _experienceController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _ageController = TextEditingController();
    _descriptionController = TextEditingController();
    _jobTitleController = TextEditingController();
    _experienceFocusNode = FocusNode();
    _phoneNumberFocusNode = FocusNode();
    _ageFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _jobTitleFocusNode = FocusNode();
    _profileScreenVM = ProfileScreenVM(
        widget.email, widget.password, widget.fullName, widget.role);
    _phoneNumberFocusNode.addListener(() {
      if (_phoneNumberFocusNode.hasFocus) {
        _profileScreenVM.removeErrorMessage("phone number");
      }
    });
    _experienceFocusNode.addListener(() {
      if (_experienceFocusNode.hasFocus) {
        _profileScreenVM.removeErrorMessage("experience");
      }
    });
    _ageFocusNode.addListener(() {
      if (_ageFocusNode.hasFocus) {
        _profileScreenVM.removeErrorMessage("age");
      }
    });
    _descriptionFocusNode.addListener(() {
      if (_descriptionFocusNode.hasFocus) {
        _profileScreenVM.removeErrorMessage("description");
      }
    });
    _jobTitleFocusNode.addListener(() {
      if (_jobTitleFocusNode.hasFocus) {
        _profileScreenVM.removeErrorMessage("job");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _experienceController.dispose();
    _phoneNumberController.dispose();
    _ageController.dispose();
    _descriptionController.dispose();
    _experienceFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _ageFocusNode.dispose();
    _descriptionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24.w(context)),
          child: Center(
            child: Observer(builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
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
                            child: _profileScreenVM.imagepath.isEmpty
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
                                      File(_profileScreenVM.imagepath),
                                      fit: BoxFit.cover,
                                      height: 139,
                                      width: 139,
                                    ),
                                  ),
                          ),
                          Positioned(
                            right: 20.w(context),
                            child: InkWell(
                              onTap: () {
                                _profileScreenVM.captureImage();
                              },
                              child: Container(
                                height: 31.h(context),
                                width: 31.w(context),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20.sp(context),
                                ),
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
                      widget.fullName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp(context),
                      ),
                    ),
                    SizedBox(
                      height: 8.h(context),
                    ),
                    Text(
                      _profileScreenVM.selectedRole,
                      style: TextStyle(
                        color: Color(0xffABABAB),
                        fontSize: 18.sp(context),
                      ),
                    ),
                    SizedBox(
                      height: 15.h(context),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Email",
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
                      child: Text(widget.email),
                    ),
                    SizedBox(
                      height: 15.h(context),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Your Phone number ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp(context),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp(context),
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                    SizedBox(
                      height: 10.h(context),
                    ),
                    SizedBox(
                      height: 50.h(context),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        borderColor: const Color(0xffABABAB),
                        borderRadius: 12,
                        hintText: "+91 9xxxxxxxxxx",
                        style: const TextStyle(color: Color(0xffABABAB)),
                        enabledfocusedBorder: const Color(0xffABABAB),
                        controller: _phoneNumberController,
                        node: _phoneNumberFocusNode,
                        errorMessage: "",
                        onChanged: (value) =>
                            _profileScreenVM.updatePhoneNumber(value),
                      ),
                    ),
                    Visibility(
                      visible:
                          _profileScreenVM.phoneNumberErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 5.h(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible:
                            _profileScreenVM.phoneNumberErrorMessage.isNotEmpty,
                        child: Text(
                          _profileScreenVM.phoneNumberErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    // 1111111111111111111111111111111111111111111111111111111
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: SizedBox(
                        height: 15.h(context),
                      ),
                    ),
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Job title ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp(context),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.sp(context),
                                fontWeight: FontWeight.bold),
                          ),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: 10.h(context),
                    ),
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: SizedBox(
                        height: 50.h(context),
                        child: CustomTextFormField(
                          borderColor: const Color(0xffABABAB),
                          borderRadius: 12,
                          hintText: "eg: Driver",
                          style: const TextStyle(color: Color(0xffABABAB)),
                          enabledfocusedBorder: const Color(0xffABABAB),
                          controller: _jobTitleController,
                          node: _jobTitleFocusNode,
                          errorMessage: "",
                          onChanged: (value) =>
                              _profileScreenVM.updateJobTitle(value),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _profileScreenVM.jobTitleErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 5.h(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible:
                            _profileScreenVM.jobTitleErrorMessage.isNotEmpty,
                        child: Text(
                          _profileScreenVM.jobTitleErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    // 22222222222222222222222222222222222222222222
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: SizedBox(
                        height: 15.h(context),
                      ),
                    ),
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Experience ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp(context),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.sp(context),
                                fontWeight: FontWeight.bold),
                          ),
                        ])),
                      ),
                    ),
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: SizedBox(
                        height: 10.h(context),
                      ),
                    ),
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: SizedBox(
                        height: 50.h(context),
                        child: CustomTextFormField(
                          keyboardType: TextInputType.number,
                          borderColor: const Color(0xffABABAB),
                          borderRadius: 12,
                          hintText: "eg: 1",
                          style: const TextStyle(color: Color(0xffABABAB)),
                          enabledfocusedBorder: const Color(0xffABABAB),
                          controller: _experienceController,
                          node: _experienceFocusNode,
                          errorMessage: "",
                          onChanged: (value) =>
                              _profileScreenVM.updateExperience(value),
                        ),
                      ),
                    ),
                    Visibility(
                      visible:
                          _profileScreenVM.experienceErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 5.h(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible:
                            _profileScreenVM.experienceErrorMessage.isNotEmpty,
                        child: Text(
                          _profileScreenVM.experienceErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _profileScreenVM.selectedRole.toLowerCase() ==
                          "worker",
                      child: SizedBox(
                        height: 15.h(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Age ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp(context),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp(context),
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                    SizedBox(
                      height: 10.h(context),
                    ),
                    SizedBox(
                      height: 50.h(context),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        borderColor: const Color(0xffABABAB),
                        borderRadius: 12,
                        hintText: "eg: 30",
                        style: const TextStyle(color: Color(0xffABABAB)),
                        enabledfocusedBorder: const Color(0xffABABAB),
                        controller: _ageController,
                        node: _ageFocusNode,
                        errorMessage: "",
                        onChanged: (value) => _profileScreenVM.updateAge(value),
                      ),
                    ),
                    Visibility(
                      visible: _profileScreenVM.ageErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 5.h(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible: _profileScreenVM.ageErrorMessage.isNotEmpty,
                        child: Text(
                          _profileScreenVM.ageErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ), //**************************************************** */
                    SizedBox(
                      height: 15.h(context),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Description ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp(context),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp(context),
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                    SizedBox(
                      height: 10.h(context),
                    ),
                    SizedBox(
                      height: 100.h(context),
                      child: CustomTextFormField(
                        maxLines: 5,
                        borderColor: const Color(0xffABABAB),
                        borderRadius: 12,
                        hintText: "",
                        style: const TextStyle(color: Color(0xffABABAB)),
                        enabledfocusedBorder: const Color(0xffABABAB),
                        controller: _descriptionController,
                        node: _descriptionFocusNode,
                        errorMessage: "",
                        onChanged: (value) =>
                            _profileScreenVM.updateDescription(value),
                      ),
                    ),
                    Visibility(
                      visible:
                          _profileScreenVM.descriptionErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 5.h(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible:
                            _profileScreenVM.descriptionErrorMessage.isNotEmpty,
                        child: Text(
                          _profileScreenVM.descriptionErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),

                    //**************************************************** */
                    SizedBox(
                      height: 15.h(context),
                    ),
                    InkWell(
                      onTap: () async {
                        await _profileScreenVM.saveDetails();

                        if (_profileScreenVM.isValidUser) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                              (route) => false);
                        }
                      },
                      child: CustomButton(
                          buttonColor: const Color(0xff1D61E7),
                          height: 50,
                          width: double.infinity,
                          buttonText: const Text(
                            "Upload profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          borderRadius: 12),
                    ),
                    SizedBox(
                      height: 15.h(context),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
