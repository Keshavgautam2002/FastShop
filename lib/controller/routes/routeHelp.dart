import 'package:e_commarce/view/cart/cartScreen.dart';
import 'package:e_commarce/view/home/homeScreen.dart';
import 'package:e_commarce/view/login/loginScreen.dart';
import 'package:e_commarce/view/login/signUpScreen.dart';
import 'package:e_commarce/view/placeOrder/placeOrder.dart';
import 'package:e_commarce/view/productDetails/ProductDetails.dart';
import 'package:get/get.dart';

import '../../view/splashScreen.dart';

class PathHelper{

  //routes Strings
  static String login = "/login";
  static String splash = "/splash";
  static String home = "/home";
  static String cart = "/cart";
  static String profile = "/profile";
  static String signUp = "/signUp";
  static String placeOrder = "/placeOrder";
  static String productDetails = "/productDetails";

  //function that return the string path

  static String Login() => login;
  static String Splash() => splash;
  static String Home() => home;
  static String CartScreen() => cart;
  static String Profile() => profile;
  static String SignUp() => signUp;
  static String PlaceOrder() => placeOrder;
  static String ProductDetails() => productDetails;



  //routes list
  static List<GetPage> routes = [
    GetPage(name: login, page: ()=>LoginScreen()),
    GetPage(name: splash, page: ()=>SplashScreen()),
    GetPage(name: signUp, page: ()=>SignUpScreen()),
    GetPage(name: home, page: ()=>HomeScreen()),
    GetPage(name: cart, page: ()=>Cart()),
    GetPage(name: placeOrder, page: ()=>PlaceOrderScreen()),
    GetPage(name: productDetails, page: ()=>ProductDetailScreen()),
  ];



}