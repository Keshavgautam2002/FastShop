import 'package:e_commarce/controller/cartController/cartController.dart';
import 'package:e_commarce/utils/colors.dart';
import 'package:e_commarce/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            child: GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your order details", style: TextStyle(fontWeight: FontWeight.bold,fontFamily: primaryFont,fontSize: 18),),
                    ListView.builder(
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
                                      child: Text("Remove from List",style: TextStyle(fontFamily: primaryFont,fontWeight: FontWeight.bold,color: Colors.white),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) ,),
                    const SizedBox(height: 10,),
                    const Divider(endIndent: 5,indent: 5,),
                    Row(
                      children: [
                        Expanded(flex:8,child: Text("Total sum ",style: TextStyle(fontSize: 16,fontFamily: primaryFont),)),
                        Expanded(flex:2,child: Text("₹${controller.total.toStringAsFixed(2)}/-",style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: primaryFont),)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(flex:8,child: Text("GST ",style: TextStyle(fontSize: 16,fontFamily: primaryFont),)),
                        Expanded(flex:2,child: Text("₹${(controller.total * 0.15).toStringAsFixed(2)}/-",style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: primaryFont),)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(flex:8,child: Text("Shipping charges",style: TextStyle(fontSize: 16,fontFamily: primaryFont),)),
                        Expanded(flex:2,child: Text("₹${(controller.total * 0.10).toStringAsFixed(2)}/-",style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: primaryFont),)),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(thickness: 1.5,color: Colors.black,),
                    Row(
                      children: [
                        Expanded(flex:8,child: Text("Total Price",style: TextStyle(fontSize: 16,fontFamily: primaryFont),)),
                        Expanded(flex:2,child: Text("₹${(controller.total * 0.10 + controller.total * 0.15 + controller.total ).toStringAsFixed(2)}/-",style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: primaryFont),)),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Choose a payment option",style: TextStyle(fontFamily: primaryFont,fontSize: 18,fontWeight: FontWeight.bold),),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 7),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.currency_rupee,size: 20,),
                                  Text("Cash on delivery",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: primaryFont),),
                                  Expanded(child: SizedBox()),
                                  Icon(Icons.radio_button_off)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 7),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.book_online_outlined,size: 20,),
                                  Text("Net banking",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: primaryFont),),
                                  Expanded(child: SizedBox()),
                                  Icon(Icons.radio_button_off)
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Text("Place order",style: TextStyle(
                        fontWeight: FontWeight.bold,fontFamily: primaryFont,color: Colors.white,fontSize: 14,
                      ),),
                    ),
                  ],
                );

              },
            ),
          ),
        ),
      ),
    );
  }
}
