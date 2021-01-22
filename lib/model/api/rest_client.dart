import 'dart:io';

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/api/request/forgot_password_request.dart';
import 'package:flutter_app_cchat/model/api/request/forgot_password_reset_request.dart';
import 'package:flutter_app_cchat/model/api/request/forgot_password_verify_request.dart';
import 'package:flutter_app_cchat/model/api/request/register_app_request.dart';
import 'package:flutter_app_cchat/model/api/request/register_verify_request.dart';
import 'package:flutter_app_cchat/model/api/request/resend_otp_request.dart';
import 'package:flutter_app_cchat/model/api/response/detail_new_response.dart';
import 'package:flutter_app_cchat/model/api/response/forgot_password_reset_response.dart';
import 'package:flutter_app_cchat/model/api/response/forgot_password_response.dart';
import 'package:flutter_app_cchat/model/api/response/forgot_password_verify_response.dart';
import 'package:flutter_app_cchat/model/api/response/home_page_response.dart';
import 'package:flutter_app_cchat/model/api/response/home_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_add_product_in_cart.dart';
import 'package:flutter_app_cchat/model/api/response/list_banner_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_category_product_best_new_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_category_product_hot_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_category_product_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_destroy_product_in_cart_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_detail_product.dart';
import 'package:flutter_app_cchat/model/api/response/list_down_quantity_product_in_cart_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_product_in_cart_of_user_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_size_reponse.dart';
import 'package:flutter_app_cchat/model/api/response/list_up_quantity_product_in_cart_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_voucher_reponse.dart';
import 'package:flutter_app_cchat/model/api/response/news_product_response.dart';
import 'package:flutter_app_cchat/model/api/response/news_response.dart';
import 'package:flutter_app_cchat/model/api/response/post_diary_response.dart';
import 'package:flutter_app_cchat/model/api/response/product_by_attr_response.dart';
import 'package:flutter_app_cchat/model/api/response/register_response.dart';
import 'package:flutter_app_cchat/model/api/response/register_verify_response.dart';
import 'package:flutter_app_cchat/model/api/response/resend_otp_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_app_cchat/model/api/response/list_home_response.dart';
import 'package:flutter_app_cchat/model/entity/list_banner.dart';


import 'request/barrel_request.dart';
import 'response/barrel_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Endpoint.BASE_ANH_QUAN_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(Endpoint.LOGIN_ANH_QUAN_APP)
  Future<LoginRegisterResponse> loginApp(
      @Body() LoginAppRequest loginAppRequest);

  @POST(Endpoint.REGISTER_ANH_QUAN_APP)
  Future<RegisterResponse> registerApp(
      @Body() RegisterAppRequest registerAppRequest);

  @POST(Endpoint.REGISTER_ANH_QUAN_VERIFY)
  Future<RegisterVerifyResponse> registerVerify(
      @Body() RegisterVerifyRequest registerVerifyRequest);

  @POST(Endpoint.RESEND_OTP)
  Future<ResendOtpResponse> resendOtp(
      @Body() ResendOtpRequest resendOtpRequest);

  @POST(Endpoint.FORGOT_PASSWORD)
  Future<ForgotPasswordResponse> forgotPassword(
      @Body() ForgotPasswordRequest forgotPasswordRequest);

  @POST(Endpoint.FORGOT_PASSWORD_VERIFY)
  Future<ForgotPasswordVerifyResponse> forgotPasswordVerify(
      @Body() ForgotPasswordVerifyRequest forgotPasswordVerifyRequest);

  @POST(Endpoint.FORGOT_PASSWORD_RESET)
  Future<ForgotPasswordResetResponse> forgotPasswordReset(
      @Body() ForgotPasswordResetRequest forgotPasswordResetRequest);
  @GET(Endpoint.GET_LIST_HOME)
  Future<HomePageResponse> getHomePage();
  @GET(Endpoint.GET_NEWS)
  Future<NewsResponse> getNews();
  @GET(Endpoint.GET_LIST_VOUCHER)
  Future<ListVoucherResponse> getListVouchers();
  @GET(Endpoint.GET_LIST_HOME)
  Future<ListBannerResponse> getListBanners();
  @GET(Endpoint.GET_LIST_HOME)
  Future<ListCategoryProductResponse> getListCategoryProducts();
  @GET(Endpoint.GET_LIST_HOME)
  Future<ListSizeResponse> getListSizes();
  // @GET(Endpoint.GET_LIST_CATEGORY_PRODUCT_HOT)
  // Future<CategoryProductHotResponse> getListCategoryProductHots();
  @GET(Endpoint.GET_LIST_CATEGORY_PRODUCT_HOT)
  Future<CategoryProductHotResponse> getListCategoryProductHots(
      @Query("limit") int limit,
      @Query("offset") int offset,
      @Query("sort") int sort,
      );
  @GET(Endpoint.GET_LIST_HOME)
  Future<HomeResponse> getHomeData();
  @GET(Endpoint.GET_LIST_CATEGORY_PRODUCT_HOT)
  Future<CategoryProductBestNewResponse> getListCategoryProductNewBests(
      @Query("limit") int limit,
      @Query("offset") int offset,
      @Query("sort") int sort,
      );
  @GET(Endpoint.GET_PRODUCT)
  Future<NewsProductResponse> getNewProducts(
      @Query("limit") int limit,
      @Query("offset") int offset,
      @Query("type") int type,
      @Query("search_word") String searchWord,
      );
  @GET(Endpoint.DETAIL_NEW)
  Future<DetailNewResponse> getDetailNews(
      @Query("news_id") int newId,
      );
  @GET(Endpoint.DETAIL_PRODUCT)
  Future<DetailProductResponse> getDetailProducts(
      @Query("product_id") int productId,
      );
  @POST(Endpoint.ADD_PRODUCT_IN_CART)
  Future<AddProductInCartResponse> cartAdds(
      @Query('product_id') int productId,
      @Query('color_id') int colorId,
      @Query('size_id') int sizeId,
      @Query('quantity') int quantity,
      );
  @GET(Endpoint.PRODUCT_SEARCH_ATTR)
  Future<ProductByAttrResponse> getProductByAttrs(
      @Query("limit") int limit,
      @Query("offset") int offset,
      @Query("category_id") String categoryId,
      @Query("size_id") String sizeId,
      @Query("color_id") String colorId,
      @Query("price_begin") String priceBegin,
      @Query("price_end") String priceEnd,
      @Query("type") int type);
  // @GET(Endpoint.CART)
  // Future<ListProductInCartOfUserResponse> cartGet();
  // @POST(Endpoint.CART_QUANTITY_ADD)
  // Future<ListUpQuantityProductInCartResponse> cartQuantityAdd(
  //     @Part(name: 'user_cart_id') int userCartId,
  //     );
  // @POST(Endpoint.CART_QUANTITY_REMOVE)
  // Future<ListDownQuantityProductInCartResponse> cartQuantityRemove(
  //     @Query( 'user_cart_id') int userCartId,
  //     );
  // @POST(Endpoint.CART_REMOVE)
  // Future<DestroyProductInCartResponse> cartRemove(
  //     @Part(name: 'user_cart_id') int userCartId,
  //     );
  // @POST(Endpoint.CART_REMOVE)
  // Future<CartRemoveResponse> cartRemove(
  //     @Part(name: 'user_cart_id') int userCartId,
  //     );
//
  // @POST(Endpoint.POST_NEWS)
  // Future<PostDiaryResponse> postProduct(
  //     @Part(name: "images[]") List<File> storeImages,
  //     @Part(name: "content") String name);
}
