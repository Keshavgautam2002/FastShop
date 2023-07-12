import 'package:e_commarce/controller/routes/routeHelp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences? pref;
  bool isLoggedIn = false;


  instanceFun()
  async{
    pref = await SharedPreferences.getInstance();
    setState(() {
      if(pref?.getString("user") != null) isLoggedIn = true;
    });
    print(pref!.getString("user"));
  }
  @override
  void initState() {
    instanceFun();
    Future.delayed(const Duration(seconds: 2),() => isLoggedIn ? Get.offAllNamed(PathHelper.home) : Get.offAllNamed(PathHelper.login));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Image.asset(logo_gif,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
