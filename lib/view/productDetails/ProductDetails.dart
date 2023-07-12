import 'package:e_commarce/controller/cartController/cartController.dart';
import 'package:e_commarce/utils/colors.dart';
import 'package:e_commarce/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commarce/model/productModel.dart';
import 'package:get/get.dart';


class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}


class _ProductDetailScreenState extends State<ProductDetailScreen> {

  ProductModel? item;

  @override
  void initState() {
    item = Get.arguments;
    setState(() {

    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){Get.back();},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
            ),
            child: Icon(Icons.arrow_back,color: Colors.black,),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(item!.image.toString(),height: 300,)),
              SizedBox(height: 20,),
              Text("${item!.title}",style: TextStyle(
                fontFamily: primaryFont,fontWeight: FontWeight.bold,fontSize: 22
              ),),
              SizedBox(height: 7,),
              Row(
                children: [
                  Expanded(
                    child: Text("₹${item!.price}/-",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,fontFamily: primaryFont,color: Colors.blue
                    ),),
                  ),
                  Expanded(
                    child: Text("${item!.category}",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,fontFamily: primaryFont,color: Colors.red
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("${item!.description}",style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold,fontFamily: primaryFont
              ),),
              SizedBox(height: 20,),
              Container(

                child: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cartController) {
                      return InkWell(
                          onTap: (){
                            cartController.addProduct(item!);
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
      ),
    );
  }
}
