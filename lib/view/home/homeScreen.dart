import 'package:e_commarce/controller/cartController/cartController.dart';
import 'package:e_commarce/controller/loginController/loginController.dart';
import 'package:e_commarce/controller/loginController/productController.dart';
import 'package:e_commarce/controller/routes/routeHelp.dart';
import 'package:e_commarce/utils/colors.dart';
import 'package:e_commarce/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            GetBuilder<CartController>(
              init: CartController(),
              initState: (state){},
              builder: (cartController) {
                return InkWell(
                  onTap: (){
                    Get.toNamed(PathHelper.cart);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                    child: badges.Badge(
                      badgeContent: Padding(
                          padding: const EdgeInsets.all(1.2),
                          child: Text("${cartController.count}",style: TextStyle(color: Colors.white),),
                        ),
                      showBadge: cartController.count > 0 ? true : false,
                      child: Icon(CupertinoIcons.shopping_cart,size: 30,),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
        drawer: Drawer(
          child: SafeArea(
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (controller) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        controller.Logout();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Text("Logout",style: TextStyle(
                          fontFamily: primaryFont,color: Colors.white,fontWeight: FontWeight.bold,
                        ),),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: GetBuilder<ProductController>(
                  init: ProductController(),
                  builder: (controller) {
                return controller.loading ? const Center(child: CircularProgressIndicator(),) : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(7),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey)
                          ),
                          prefixIcon: Icon(Icons.search,size: 25,),
                          hintText: "Search for product and category",
                          hintStyle: TextStyle(
                            fontFamily: primaryFont,color: Colors.grey
                          ),
                          suffixIcon: IconButton(
                            onPressed: (){
                              controller.SortProduct();
                              controller.update();
                            },
                            icon: Icon(Icons.sort,size: 25,),
                          )
                        ),
                        onSubmitted: (value){
                          controller.SearchCategory(searchController.text.trim());
                          controller.update();
                        },
                      ),
                    ),
                    Text(
                      "Find your product",
                      style: TextStyle(
                          fontFamily: primaryFont,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      "Grab our super deals and save upto 30%",
                      style: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: normalText),
                    ),
                    controller.productList.length == 0 ? Center(child: Text("No results found"),) :  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Get.toNamed(PathHelper.productDetails,arguments: controller.productList[index]);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network("${controller.productList[index].image}",),
                                    ),
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(controller.productList[index].title,style: TextStyle(
                                          fontSize: 16,fontFamily: primaryFont,fontWeight: FontWeight.bold
                                      ),),
                                      Text("₹${controller.productList[index].price}/-",style: TextStyle(
                                          fontSize: 15,fontFamily: primaryFont,fontWeight: FontWeight.bold,color: Colors.blue
                                      ),),
                                      SizedBox(height: 5,),
                                      Container(

                                        child: GetBuilder<CartController>(
                                          init: CartController(),
                                          builder: (cartController) {
                                            return InkWell(
                                                onTap: (){
                                                  cartController.addProduct(controller.productList[index]);
                                                  cartController.update();
                                                },
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Text("add to cart",style: TextStyle(fontFamily: primaryFont,fontWeight: FontWeight.bold,color: Colors.white),)));
                                          }
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),)
                  ],
                );
              }),
            ),
          ),
        ));
  }
}
