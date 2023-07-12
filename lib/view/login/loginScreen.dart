import 'dart:math';

import 'package:e_commarce/controller/loginController/loginController.dart';
import 'package:e_commarce/controller/routes/routeHelp.dart';
import 'package:e_commarce/utils/colors.dart';
import 'package:e_commarce/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

  TextEditingController userName = TextEditingController(text: "mor_2314");
  TextEditingController passwordController = TextEditingController(text: "83r5^_");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            LoginController().show ? Center(child: CircularProgressIndicator(),) : SizedBox(),
            Column(
              children: [
                Center(
                  child: Image.asset(
                    logo,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Login to continue",
                  style: TextStyle(
                      fontFamily: primaryFont,
                      fontSize: heading,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      TextField(
                        focusNode: email,
                        controller: userName,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(
                              CupertinoIcons.person,
                              color: Colors.black,
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(
                                fontFamily: primaryFont, color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        focusNode: password,
                        controller: passwordController,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: primaryFont, color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    LoginController().Login(userName.text.trim(), passwordController.text.trim());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: smallHeading),
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  Get.toNamed(PathHelper.signUp);
                }, child: Text("don't have account? Sign Up")),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
