import 'dart:io';

import 'package:flutter_app_cchat/model/api/request/barrel_request.dart';
import 'package:flutter_app_cchat/model/api/request/forgot_password_request.dart';
import 'package:flutter_app_cchat/model/api/request/forgot_password_reset_request.dart';
import 'package:flutter_app_cchat/model/api/request/forgot_password_verify_request.dart';
import 'package:flutter_app_cchat/model/api/request/register_app_request.dart';
import 'package:flutter_app_cchat/model/api/request/register_verify_request.dart';
import 'package:flutter_app_cchat/model/api/request/resend_otp_request.dart';
import 'package:flutter_app_cchat/model/api/response/barrel_response.dart';
import 'package:flutter_app_cchat/model/api/response/forgot_password_reset_response.dart';
import 'package:flutter_app_cchat/model/api/response/forgot_password_response.dart';
import 'package:flutter_app_cchat/model/api/response/forgot_password_verify_response.dart';
import 'package:flutter_app_cchat/model/api/response/home_page_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_category_product_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_size_reponse.dart';
import 'package:flutter_app_cchat/model/api/response/list_voucher_reponse.dart';
import 'package:flutter_app_cchat/model/api/response/news_response.dart';
import 'package:flutter_app_cchat/model/api/response/post_diary_response.dart';
import 'package:flutter_app_cchat/model/api/response/register_response.dart';
import 'package:flutter_app_cchat/model/api/response/register_verify_response.dart';
import 'package:flutter_app_cchat/model/api/response/resend_otp_response.dart';
import 'package:flutter_app_cchat/model/api/rest_client.dart';
import 'package:flutter_app_cchat/model/api/response/list_home_response.dart';
import 'package:flutter_app_cchat/model/api/response/list_banner_response.dart';


import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final Dio dio;

  UserRepository({@required this.dio});

  Future<LoginRegisterResponse> loginApp(
      {@required String username, @required String password}) async {
    final client = RestClient(dio);
    return client
        .loginApp(LoginAppRequest(emailOrPhone: username, password: password));
  }

  Future<RegisterResponse> registerApp(
      {@required String username,
      @required String password,
      @required String confirmPassword,
      }) async {
    final client = RestClient(dio);
    return client.registerApp(RegisterAppRequest(
      username: username,
      password: password,
      confirmPassword: confirmPassword,

    ));
  }

  Future<RegisterVerifyResponse> registerVerify(
      {@required String username, @required String otpCode}) async {
    final client = RestClient(dio);
    return client.registerVerify(
        RegisterVerifyRequest(emailOrPhone: username, otpCode: otpCode));
  }

  Future<ResendOtpResponse> resendRegisterOtp(
      {@required String username}) async {
    final client = RestClient(dio);
    return client.resendOtp(ResendOtpRequest(emailOrPhone: username, type: 0));
  }

  Future<ForgotPasswordResponse> forgotPassword(
      {@required String username}) async {
    final client = RestClient(dio);
    return client.forgotPassword(ForgotPasswordRequest(emailOrPhone: username));
  }

  Future<ForgotPasswordVerifyResponse> forgotPasswordVerify(
      {@required String username, @required String otpCode}) async {
    final client = RestClient(dio);
    return client.forgotPasswordVerify(
        ForgotPasswordVerifyRequest(emailOrPhone: username, otpCode: otpCode));
  }

  Future<ResendOtpResponse> resendForgotPasswordOtp(
      {@required String username}) async {
    final client = RestClient(dio);
    return client.resendOtp(ResendOtpRequest(emailOrPhone: username, type: 1));
  }

  Future<ForgotPasswordResetResponse> forgotPasswordReset(
      {@required String username,
      @required String otpCode,
      @required String password,
      @required String confirmPassword}) async {
    final client = RestClient(dio);
    return client.forgotPasswordReset(ForgotPasswordResetRequest(
        emailOrPhone: username,
        otpCode: otpCode,
        password: password,
        confirmPassword: confirmPassword));
  }
  Future<HomePageResponse> getHomepage() async {
    final client = RestClient(dio);
    return client.getHomePage();
  }
  Future<NewsResponse> getNew() async {
    final client = RestClient(dio);
    return client.getNews();
  }
  Future<ListVoucherResponse> getListVoucher() async {
    final client = RestClient(dio);
    return client.getListVouchers();
  }
  Future<ListBannerResponse> getListBanner() async {
    final client = RestClient(dio);
    return client.getListBanners();
  }
  Future<ListCategoryProductResponse> getListCategoryProduct() async {
    final client = RestClient(dio);
    return client.getListCategoryProducts();
  }
  Future<ListSizeResponse> getListSize() async {
    final client = RestClient(dio);
    return client.getListSizes();
  }
  // Future<ListHomeResponse> getListHome() async {
  //   final client = RestClient(dio);
  //   return client.getListHomes();
  // }
  //
  // Future<PostDiaryResponse> postProduct({
  //   @required List<File> storeImages,
  //   @required String name,
  // }) async {
  //   final client = RestClient(dio);
  //   return client.postProduct(
  //     storeImages,
  //     name,
  //   );
  // }
}
