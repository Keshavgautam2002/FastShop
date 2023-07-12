import 'dart:math';

import 'package:e_commarce/controller/loginController/loginController.dart';
import 'package:e_commarce/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController house = TextEditingController();
  TextEditingController pinCode = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(logo,height: 250,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      color: Colors.black,
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: username,
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
              SizedBox(height: 7,),
              TextField(
                controller: password,
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
              SizedBox(height: 7,),
              TextField(
                controller: firstName,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                      color: Colors.black,
                    ),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: lastName,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                      color: Colors.black,
                    ),
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: phone,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                      color: Colors.black,
                    ),
                    hintText: "Phone Number",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: city,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      CupertinoIcons.building_2_fill,
                      color: Colors.black,
                    ),
                    hintText: "City",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: street,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.map,
                      color: Colors.black,
                    ),
                    hintText: "Street",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: house,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      CupertinoIcons.house,
                      color: Colors.black,
                    ),
                    hintText: "house number",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: pinCode,
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.pin_outlined,
                      color: Colors.black,
                    ),
                    hintText: "Pin code",
                    hintStyle: TextStyle(
                        fontFamily: primaryFont, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),


              SizedBox(height: 15,),
              InkWell(
                onTap: (){

                  LoginController().Register(
                      username.text.trim(),
                      email.text.trim(),
                      password.text.trim(),
                      firstName.text.trim(),
                      lastName.text.trim(),
                      phone.text.trim(),
                      city.text.trim(),
                      street.text.trim(),
                      house.text.trim(),
                      pinCode.text.trim());

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
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: primaryFont,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: smallHeading),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
