import 'package:flutter_app_cchat/model/entity/category.dart';
import 'package:flutter_app_cchat/model/entity/news_product.dart';
import 'package:flutter_app_cchat/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async {
    Get.back();
  }

  static navigatePopUtil({String name}) async {
    Navigator.popUntil(Get.context, ModalRoute.withName(name));
  }

  static navigateSplash() async {
    var result = await Get.toNamed(BaseRouter.SPLASH);
    return result;
  }

  static navigateLogin() async {
    var result = await Get.toNamed(BaseRouter.LOGIN);
    return result;
  }

  static navigateLoginOrRegister() async {
    var result = await Get.toNamed(BaseRouter.LOGIN_REGISTER);
    return result;
  }
  static navigateLoginTest() async {
    var result = await Get.toNamed(BaseRouter.LOGIN_TEST_REGISTER);
    return result;
  }

  static navigateNavigation() async {
    var result = await Get.offAllNamed(BaseRouter.NAVIGATION);
    return result;
  }

  static navigateRegister() async {
    var result = await Get.toNamed(BaseRouter.REGISTER);
    return result;
  }

  static navigateRegisterVerify({String username}) async {
    var result = await Get.toNamed(BaseRouter.REGISTER_VERIFY,
        arguments: {'username': username});
    return result;
  }

  static navigateForgotPassword() async {
    var result = await Get.toNamed(BaseRouter.FORGOT_PASSWORD);
    return result;
  }

  static navigateForgotPasswordVerify({String username, String phone}) async {
    var result = await Get.toNamed(BaseRouter.FORGOT_PASSWORD_VERIFY,
        arguments: {'username': username, 'phone': phone});
    return result;
  }

  static navigateForgotPasswordReset({String username, String otpCode}) async {
    var result =
        await Get.toNamed(BaseRouter.FORGOT_PASSWORD_RESET, arguments: {
      'username': username,
      'otp_code': otpCode,
    });
    return result;
  }

  static navigatePostNews() async {
    var result = await Get.toNamed(BaseRouter.CREATE_NEWS);
    return result;
  }
  static navigateNewProduct(int newId) async {
    var result = await Get.toNamed(BaseRouter.NEW_DETAIL,
        arguments: {'newId': newId});
    print(newId);
    return result;
  }
  static navigateDetailProductHot(int productId) async {
    var result = await Get.toNamed(BaseRouter.DETAIL_PRODUCT_HOT,
        arguments: {'productId': productId});
    print(productId);
    return result;
  }
  static navigateCategoryPrimary(Category category) async {
    var result = await Get.toNamed(BaseRouter.CATEGORY_PRIMARY,
        arguments: {'category': category});
    return result;
  }
}
