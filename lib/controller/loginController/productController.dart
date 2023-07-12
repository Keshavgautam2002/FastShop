import 'dart:convert';

import 'package:e_commarce/utils/Api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:e_commarce/model/productModel.dart';


class ProductController extends GetxController implements GetxService{

  RxList<ProductModel> product = <ProductModel>[].obs;
  RxBool isLoading = false.obs;


  List get productList => product.value;
  bool get loading => isLoading.value;


  Future<void> FetchProduct() async {
    isLoading.value = true;
    isLoading.refresh();
    final response = await http.get(Uri.parse(productUrl));
    print(response.statusCode);
    if(response.statusCode == 200)
      {
        List ls = json.decode(response.body);
        for(int a = 0;a < ls.length;a++)
          {
           //print(json.decode(ls[a]));
            ProductModel p = ProductModel.fromJson(ls[a]);
            //print(p.id);
            product.value.add(p);
            product.refresh();
          }
        print(product.length);
      }
    isLoading.value = false;
    isLoading.refresh();
    update();
  }
  
  Future<void> SortProduct()async{
    isLoading.value = true;
    isLoading.refresh();
    final response = await http.get(Uri.parse(sortItems));
    print(response.statusCode);
    if(response.statusCode == 200)
      {
        List ls = json.decode(response.body);
        for(int a = 0;a < ls.length;a++)
          {
            ProductModel p = ProductModel.fromJson(ls[a]);
            product.value.add(p);
            product.refresh();
          }

      }
    isLoading.value = false;
    isLoading.refresh();
    update();
  }


  Future<void> SearchCategory(String quary)async{
    isLoading.value = true;
    isLoading.refresh();
    final response = await http.get(Uri.parse("$searchCategory$quary"));
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200)
    {
      List ls = json.decode(response.body);
      for(int a = 0;a < ls.length;a++)
      {
        ProductModel p = ProductModel.fromJson(ls[a]);
        product.value.add(p);
        product.refresh();
      }

    }
    isLoading.value = false;
    isLoading.refresh();
    update();
  }
  @override
  void onInit() {
    FetchProduct();
    super.onInit();
  }

}