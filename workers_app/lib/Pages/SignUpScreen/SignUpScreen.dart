import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/ProfileScreen/ProfileScreen.dart';
import 'package:workers_app/Pages/Reusables/CustomButton.dart';
import 'package:workers_app/Pages/Reusables/CustomTextFormField.dart';
import 'package:workers_app/Pages/RoleSelectingScreen/RoleSelectingScreen.dart';
import 'package:workers_app/Pages/SignUpScreen/SignUpScreenVM.dart';
import 'package:mobx/mobx.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _fullNameNode = FocusNode();
  final SignUpScreenVM _signUpScreenVM = SignUpScreenVM();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailNode.addListener(() {
      if (_emailNode.hasFocus) {
        _signUpScreenVM.removeErrorMessage("email");
      }
    });
    _passwordNode.addListener(() {
      if (_passwordNode.hasFocus) {
        _signUpScreenVM.removeErrorMessage("password");
      }
    });
    _fullNameNode.addListener(() {
      if (_fullNameNode.hasFocus) {
        _signUpScreenVM.removeErrorMessage("full name");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _fullNameNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff2567E8),
                Color(0xff1CE6DA),
              ],
            ),
          ),
          child: Observer(builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 24.w(context), vertical: 24.h(context)),
              width: 343.w(context),
              height: _signUpScreenVM.emailErrorMessage.isNotEmpty ||
                      _signUpScreenVM.passwordErrorMessage.isNotEmpty
                  ? 700.h(context)
                  : 650.h(context),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12.r(context)),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.sp(context),
                      ),
                    ),
                    SizedBox(
                      height: 12.h(context),
                    ),
                    // Wrap the Row with Center widget or use MainAxisAlignment.center
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the children horizontally
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xff4D81E7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Full name",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h(context),
                    ),
                    SizedBox(
                      height: 46.h(context),
                      child: CustomTextFormField(
                        onChanged: (value) =>
                            _signUpScreenVM.updateFullName(value),
                        controller: _fullNameController,
                        node: _fullNameNode,
                        borderColor: Colors.grey,
                        borderRadius: 10,
                        hintText: "",
                        style: const TextStyle(color: Colors.grey),
                        enabledfocusedBorder: Colors.grey,
                      ),
                    ),
                    Visibility(
                      visible: _signUpScreenVM.fullNameErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 2.h(context),
                        child: Visibility(
                          visible:
                              _signUpScreenVM.fullNameErrorMessage.isNotEmpty,
                          child: Text(
                            _signUpScreenVM.fullNameErrorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible:
                            _signUpScreenVM.fullNameErrorMessage.isNotEmpty,
                        child: Text(
                          _signUpScreenVM.fullNameErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h(context),
                    ),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h(context),
                    ),
                    SizedBox(
                      height: 46.h(context),
                      child: CustomTextFormField(
                        onChanged: (value) =>
                            _signUpScreenVM.updateEmail(value),
                        controller: _emailController,
                        node: _emailNode,
                        borderColor: Colors.grey,
                        borderRadius: 10,
                        hintText: "abc@gmail.com",
                        style: const TextStyle(color: Colors.grey),
                        enabledfocusedBorder: Colors.grey,
                      ),
                    ),
                    Visibility(
                      visible: _signUpScreenVM.emailErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 2.h(context),
                        child: Visibility(
                          visible: _signUpScreenVM.emailErrorMessage.isNotEmpty,
                          child: Text(
                            _signUpScreenVM.emailErrorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible: _signUpScreenVM.emailErrorMessage.isNotEmpty,
                        child: Text(
                          _signUpScreenVM.emailErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h(context),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h(context),
                    ),
                    SizedBox(
                      height: 46.h(context),
                      child: CustomTextFormField(
                        onChanged: (value) =>
                            _signUpScreenVM.updatePassword(value),
                        controller: _passwordController,
                        node: _passwordNode,
                        visibility: _signUpScreenVM.isVisible,
                        borderColor: Colors.grey,
                        borderRadius: 10,
                        hintText: "",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledfocusedBorder: Colors.grey,
                        suffixIcon: InkWell(
                          onTap: () {
                            _signUpScreenVM.updateVisibility();
                          },
                          child: _signUpScreenVM.isVisible
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible:
                            _signUpScreenVM.passwordErrorMessage.isNotEmpty,
                        child: Text(
                          _signUpScreenVM.passwordErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 24.h(context),
                    ),
                    Observer(builder: (context) {
                      return InkWell(
                        onTap: () async {
                          !_signUpScreenVM.isLoading
                              ? await _signUpScreenVM.signUp()
                              : null; // Wait for signUp to complete
                          if (_signUpScreenVM.isExistingUser) {
                            // ignore: use_build_cjontext_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("User already exists")),
                            );
                            _signUpScreenVM.updateAlreadyExistingErrorMessage();
                          }

                          if (_signUpScreenVM.isValidUser) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RoleSelectingScreen(
                                    password: _signUpScreenVM.password,
                                    email: _signUpScreenVM.email,
                                    fullName: _signUpScreenVM.fullName,
                                  );
                                },
                              ),
                            );
                          }
                        },
                        child: CustomButton(
                          height: 48,
                          width: 295,
                          buttonText: _signUpScreenVM.isLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Create account",
                                  style: TextStyle(color: Colors.white),
                                ),
                          buttonColor: const Color(0xff1D61E7),
                          borderRadius: 10,
                        ),
                      );
                    }),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    SizedBox(
                      width: 295.w(context),
                      height: 18.h(context),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 124.w(context),
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10.w(context),
                          ),
                          const Text("Or"),
                          SizedBox(
                            width: 10.w(context),
                          ),
                          SizedBox(
                            width: 124.w(context),
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 22.h(context),
                    ),
                    Image.asset("${AppConstants.imageBaseURL}google login.png"),
                    SizedBox(
                      height: 15.h(context),
                    ),
                    Image.asset(
                        "${AppConstants.imageBaseURL}face book login.png")
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
