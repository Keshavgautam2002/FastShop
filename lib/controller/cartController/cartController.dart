import 'package:e_commarce/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController implements GetxService{

  RxInt itemCount = 0.obs;
  int get count => itemCount.value;

  RxDouble cost = 0.0.obs;
  double get total => cost.value;


  RxList<ProductModel> product = <ProductModel>[].obs;

  List get productList => product.value;


  void addProduct(ProductModel item){
    product.add(item);
    product.refresh();
    cost.value += double.parse(item.price!);
    cost.refresh();
    itemCount.value = product.length;
    itemCount.refresh();
    Get.showSnackbar(const GetSnackBar(message: "Item added successfully",isDismissible: true,duration: Duration(seconds: 1),backgroundColor: Colors.green,));
  }

  void deleteProduct(num itemId){
    int? index;
    String? price;
    for(int a = 0;a < product.length;a++)
    {
      if(product[a].id == itemId)
        {
          index = a;
          price = product[a].price;
          break;
        }
    }
    product.removeAt(index ?? 0);
    product.refresh();
    itemCount.value = product.length;
    itemCount.refresh();
    cost.value -= double.parse(price!);
    cost.refresh();
    update();
    Get.showSnackbar(const GetSnackBar(message: "Item deleted successfully",isDismissible: true,duration: Duration(seconds: 1),backgroundColor: Colors.green,));
  }



}