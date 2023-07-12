import 'package:e_commarce/controller/routes/routeHelp.dart';
import 'package:e_commarce/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      getPages: PathHelper.routes,
      home: const SplashScreen(),
    );
  }
}
