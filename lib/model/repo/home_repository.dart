import 'package:dio/dio.dart';
import 'package:flutter_app_cchat/model/api/response/detail_new_response.dart';
import 'package:flutter_app_cchat/model/api/response/home_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_add_product_in_cart.dart';
import 'package:flutter_app_cchat/model/api/response/list_category_product_best_new_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_category_product_hot_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_detail_product.dart';
import 'package:flutter_app_cchat/model/api/response/news_product_response.dart';
import 'package:flutter_app_cchat/model/api/response/product_by_attr_response.dart';
import 'package:flutter_app_cchat/model/api/rest_client.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final Dio dio;

  HomeRepository({@required this.dio});
  // Future<CategoryProductHotResponse> getListCategoryProductHot() async {
  //   final client = RestClient(dio);
  //   return client.getListCategoryProductHots();
  // }
  Future<CategoryProductHotResponse> getListCategoryProductHot(
      {@required int limit, @required int offset, @required int sort}) async {
    final client = RestClient(dio);
    return client.getListCategoryProductHots(limit, offset, sort);
  }

  Future<HomeResponse> getHomeData() async {
    final client = RestClient(dio);
    return client.getHomeData();
  }

  Future<CategoryProductBestNewResponse> getListCategoryProductNewBest(
      {@required int limit, @required int offset, @required int sort}) async {
    final client = RestClient(dio);
    return client.getListCategoryProductNewBests(limit, offset, sort);
  }

  Future<NewsProductResponse> getNewProduct(
      {@required int limit,
      @required int offset,
      @required int type,
      String searchWord}) async {
    final client = RestClient(dio);
    return client.getNewProducts(limit, offset, type, searchWord);
  }

  Future<DetailNewResponse> getDetailNew({
    @required int newId,
  }) async {
    final client = RestClient(dio);
    return client.getDetailNews(newId);
  }

  Future<DetailProductResponse> getDetailProduct({
    @required int productId,
  }) async {
    final client = RestClient(dio);
    return client.getDetailProducts(productId);
  }

  Future<ProductByAttrResponse> getProductByAttr(
      {@required int limit,
      @required int offset,
      @required int categoryId,
      @required int sizeId,
      @required int colorId,
      @required double priceBegin,
      @required double priceEnd,
      @required int type}) async {
    final client = RestClient(dio);
    print('categoryId.toString() ${categoryId.toString()}');
    return client.getProductByAttrs(
        limit,
        offset,
        categoryId != null ? categoryId.toString() : '',
        sizeId != null ? sizeId.toString() : '',
        colorId != null ? colorId.toString() : '',
        priceBegin != null ? priceBegin.toString() : '',
        priceEnd != null ? priceEnd.toString() : '',
        type ?? 1);
  }
}
