import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';
import 'package:workers_app/Pages/HomeScreen/HomeScreen.dart';
import 'package:workers_app/Pages/Reusables/CustomButton.dart';
import 'package:workers_app/Pages/Reusables/CustomTextFormField.dart';
import 'package:workers_app/Pages/SignInScreen/SignInScreenVM.dart';
import 'package:workers_app/Pages/SignUpScreen/SignUpScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final SignInScreenVM _signInScreenVM = SignInScreenVM();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailNode.addListener(() {
      if (_emailNode.hasFocus) {
        _signInScreenVM.removeErrorMessage("email");
      }
    });
    _passwordNode.addListener(() {
      if (_passwordNode.hasFocus) {
        _signInScreenVM.removeErrorMessage("password");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
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
              height: _signInScreenVM.emailErrorMessage.isNotEmpty ||
                      _signInScreenVM.passwordErrorMessage.isNotEmpty
                  ? 625.h(context)
                  : 581.h(context),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12.r(context)),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Login",
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
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const SignUpScreen();
                              },
                            ));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xff4D81E7),
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
                        errorMessage: _signInScreenVM.emailErrorMessage,
                        onChanged: (value) =>
                            _signInScreenVM.updateEmail(value),
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
                      visible: _signInScreenVM.emailErrorMessage.isNotEmpty,
                      child: SizedBox(
                        height: 2.h(context),
                        child: Visibility(
                          visible: _signInScreenVM.emailErrorMessage.isNotEmpty,
                          child: Text(
                            _signInScreenVM.emailErrorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible: _signInScreenVM.emailErrorMessage.isNotEmpty,
                        child: Text(
                          _signInScreenVM.emailErrorMessage,
                          style: TextStyle(color: Colors.red),
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
                        errorMessage: _signInScreenVM.passwordErrorMessage,
                        onChanged: (value) =>
                            _signInScreenVM.updatePassword(value),
                        controller: _passwordController,
                        node: _passwordNode,
                        visibility: _signInScreenVM.isVisible,
                        borderColor: Colors.grey,
                        borderRadius: 10,
                        hintText: "",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledfocusedBorder: Colors.grey,
                        suffixIcon: InkWell(
                          onTap: () {
                            _signInScreenVM.updateVisibility();
                          },
                          child: _signInScreenVM.isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible:
                            _signInScreenVM.passwordErrorMessage.isNotEmpty,
                        child: Text(
                          _signInScreenVM.passwordErrorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h(context),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Color(0xff4D81E7),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    Observer(builder: (context) {
                      return InkWell(
                        onTap: () async {
                          !_signInScreenVM.isLoading
                              ? await _signInScreenVM.validateDetails()
                              : null; // Wait for signUp to complete
                          if (_signInScreenVM.isUserCanLogIn) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                    user: _signInScreenVM.myUser,
                                  ),
                                ));
                          }
                        },
                        child: CustomButton(
                          height: 48,
                          width: 295,
                          buttonText: _signInScreenVM.isLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Log In",
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
