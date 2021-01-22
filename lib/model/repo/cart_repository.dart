import 'package:dio/dio.dart';
import 'package:flutter_app_cchat/model/api/response/list_add_product_in_cart.dart';
import 'package:flutter_app_cchat/model/api/response/list_destroy_product_in_cart_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_down_quantity_product_in_cart_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_product_in_cart_of_user_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_up_quantity_product_in_cart_response.dart';
import 'package:flutter_app_cchat/model/api/rest_client.dart';
import 'package:meta/meta.dart';

class CartRepository {
  final Dio dio;

  CartRepository({@required this.dio});
  Future<AddProductInCartResponse> cartAdd({
    @required int productId,
    @required int colorId,
    @required int sizeId,
    @required int quantity,
  }) async {
    final client = RestClient(dio);
    return client.cartAdds(productId, colorId, sizeId, quantity);
  }
  // Future<ListProductInCartOfUserResponse> getCart() async {
  //   final client = RestClient(dio);
  //   return client.cartGet();
  // }
  // // Future<CartRemoveResponse> cartRemove({@required int userCartId}) async {
  // //   final client = RestClient(dio);
  // //   return client.cartRemove(userCartId);
  // // }
  // Future<ListDownQuantityProductInCartResponse> cartQuantityRemove(
  //     {@required int userCartId}) async {
  //   final client = RestClient(dio);
  //   return client.cartQuantityRemove(userCartId);
  // }
  // Future<ListUpQuantityProductInCartResponse> cartQuantityAdd(
  //     {@required int userCartId}) async {
  //   final client = RestClient(dio);
  //   return client.cartQuantityAdd(userCartId);
  // }
  // Future<DestroyProductInCartResponse> cartRemove({@required int userCartId}) async {
  //   final client = RestClient(dio);
  //   return client.cartRemove(userCartId);
  // }
}
