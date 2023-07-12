import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commarce/controller/routes/routeHelp.dart';
import 'package:e_commarce/model/userModel.dart';
import 'package:e_commarce/utils/Api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController implements GetxService{
  UserModel? _user;
  bool isLoading = false;
  SharedPreferences? pref;

  bool get show => isLoading;
  UserModel? get user => _user;



  Future<void> Login(String username, String password)
  async {
    pref = await SharedPreferences.getInstance();
    isLoading = true;
    update();
    final response = await http.post(Uri.parse(login),body: {
      "username":username,
      "password":password
    });
    isLoading =false;
    update();
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200)
      {
        _user = UserModel.fromJson(json.decode(response.body));
        update();
        print(_user!.id);
        pref?.setString("user", json.encode(_user));
        Get.offAllNamed(PathHelper.home);
        Get.showSnackbar(const GetSnackBar(message: "Logged in successfully",isDismissible: true,duration: Duration(seconds: 3),backgroundColor: Colors.green,));
      }
    else{
      Get.showSnackbar(const GetSnackBar(message: "Something went wrong",isDismissible: true,duration: Duration(seconds: 3),backgroundColor: Colors.red,));
    }
  }

  Future<void> Register(String username,String email,String password,String firstName, String lastName,String phone,String city,String street,String house_no,String zipcode)
  async{
    isLoading = true;
    update();

    Map add = {
      "city" : city,
      "street":street,
      "number" : house_no,
      "zipcode" : zipcode,
    };
    Map name = {
      "firstname":firstName,
      "lastname" : lastName,
    };
    
    final response = await http.post(Uri.parse(signUp),body: {
      "username" : username,
      "password" : password,
      "email" : email,
      "name" : name.toString() ,
      "address" :add.toString(),
      "phone" : phone,
    });
    print(response.statusCode);
    if(response.statusCode == 200)
      {
        print(response.body);
        Get.back();
        Get.showSnackbar(const GetSnackBar(message: "your have registered successfully",isDismissible: true,duration: Duration(seconds: 3),backgroundColor: Colors.green,));
      }
    else{
      Get.back();
      Get.showSnackbar(const GetSnackBar(message: "Something went wrong",isDismissible: true,duration: Duration(seconds: 3),backgroundColor: Colors.red,));
    }
    
  }

  Future<void> Logout()
  async{
    pref = await SharedPreferences.getInstance();
    await pref!.clear() ? Get.offAllNamed(PathHelper.login) : {
      Get.showSnackbar(const GetSnackBar(message: "Something went wrong",isDismissible: true,duration: Duration(seconds: 3),backgroundColor: Colors.red,)),
      Get.back(),
    };
  }

}