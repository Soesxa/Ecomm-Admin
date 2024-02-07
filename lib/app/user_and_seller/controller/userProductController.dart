import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/apiEndPoints.dart';
import '../../../constants/AppStrings.dart';
import '../../../helper/ApiHandler.dart';
import '../model/UserSoldProducts.dart';
import '../model/getExtraCharges.dart';
import '../model/products.dart';
class UserProductController{

  static Future sellItemNow({required String email, required postData}) async {
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.baseURL+ApiEndPoints.sell_product_user, data: formData);
      return jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }
  static Future addToCart({required String email, required String productId}) async {
    var postData = {'email': email, 'product_id': productId};
    var formData = FormData.fromMap(postData);
    try{

      var response = await GetDio.getDio()
          .post(ApiEndPoints.baseURL+ApiEndPoints.add_to_cart, data: formData);
      return jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }


  // //Placed order 
  //   static Future placedOrder({required String email, required String productId}) async {
  //   var postData = {'email': email,};
  //   var formData = FormData.fromMap(postData);
  //   try{

  //     var response = await GetDio.getDio()
  //         .post(ApiEndPoints.add_to_cart, data: formData);
  //     return jsonDecode(response.data);
  //   }
  //   catch(e){
  //     EasyLoading.showError(AppStrings.ApiErrorMessage);
  //   }

  // }



 static Future confirmAppointment(
    postData) async {
   var formData = FormData.fromMap(postData);
   try{
     var response = await GetDio.getDio()
         .post(ApiEndPoints.baseURL+ApiEndPoints.confirm_appointment, data: formData);
     return jsonDecode(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
   }

  }

  static Future<List<ProductsUser>> productListApi() async {
    try{
      var response = await GetDio.getDio()
          .get(ApiEndPoints.baseURL+ApiEndPoints.user_products_list);
      return productsUserFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <ProductsUser>[];
    }

  }

  static Future<List<Products>> getSellerProducts() async {
    try{
      final _prefs = await SharedPreferences.getInstance();
      var postData = {'sellerId': await _prefs.getString('userId') ?? ''};
      var formData = FormData.fromMap(postData);
      var response = await GetDio.getDio()
          .post(ApiEndPoints.baseURL+ApiEndPoints.seller_products_list, data: formData);
      return productsFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <Products>[];
    }

  }

  static Future<List<GetExtraCharges>> getExtraCharges() async {
    try{
      var response = await GetDio.getDio()
          .get(ApiEndPoints.baseURL+ApiEndPoints.get_extra_charges);
      return getExtraChargesFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <GetExtraCharges>[];
    }
  }

  }

