import 'package:e_commarce/controller/cartController/cartController.dart';
import 'package:e_commarce/controller/routes/routeHelp.dart';
import 'package:e_commarce/utils/colors.dart';
import 'package:e_commarce/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text("My cart",style: TextStyle(
          fontWeight: FontWeight.bold,fontFamily: primaryFont,color: Colors.white
        ),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) => controller.productList.isEmpty ? Center(
              child: Text("Your cart is empty.Add some products",style: TextStyle(
                fontFamily: primaryFont,fontWeight: FontWeight.bold
              ),),
            ) :
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) => Card(
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
                                InkWell(
                                  onTap: (){
                                    controller.deleteProduct(controller.productList[index].id);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("Remove from cart",style: TextStyle(fontFamily: primaryFont,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
                  SizedBox(height: 20,),
                  Text("your cart total is : ₹${controller.total.toStringAsFixed(2)}/-",style:TextStyle(
                    fontSize: 20,fontFamily: primaryFont,color: Colors.blue,fontWeight: FontWeight.bold
                  ),),
                  InkWell(
                    onTap: (){
                      Get.toNamed(PathHelper.placeOrder);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor,
                      ),
                      child: Text("Proceed to place order",style: TextStyle(
                        fontWeight: FontWeight.bold,fontFamily: primaryFont,color: Colors.white,fontSize: 14,
                      ),),
                    ),
                  )
                ],
              ),
            ),),
        ),
      ),
    );
  }
}
