import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/menu/voucher/bloc/bloc.dart';
import 'package:flutter_app_cchat/presentation/screen/login/login.dart';
import 'package:flutter_app_cchat/presentation/screen/navigation/sc_navigation.dart';

import 'package:flutter_app_cchat/presentation/screen/register/sc_register.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/sc_register_verify.dart';
import 'package:flutter_app_cchat/presentation/screen/splash/sc_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password/sc_forgot_password.dart';
import 'forgot_password_reset/sc_forgot_password_reset.dart';
import 'forgot_password_verify/sc_forgot_password_verify.dart';
import 'menu/homefaild/banner/bloc/post_banner_bloc.dart';
import 'menu/homefaild/bottom_panel/bloc/bottom_panel_bloc.dart';
import 'menu/homefaild/buy_now_panel/bloc/buy_now_panel_bloc.dart';
import 'menu/homefaild/category_primary/bloc/category_primary_bloc.dart';
import 'menu/homefaild/category_primary/sc_category_primary.dart';
import 'menu/homefaild/category_product/bloc/post_category_product_bloc.dart';
import 'menu/homefaild/home_bloc/home_bloc.dart';
import 'menu/homefaild/home_categories_hot/bloc/home_categories_hot_bloc.dart';
import 'menu/homefaild/home_categories_hot/detail_product_hot/bloc/detail_product_hot_bloc.dart';
import 'menu/homefaild/home_categories_hot/detail_product_hot/sc_detail_product.dart';
import 'menu/homefaild/home_categories_hot/related_product_bloc/related_product_hot_bloc.dart';
import 'menu/homefaild/home_categories_hot_new_bests/bloc/home_categorie_new_bests_bloc.dart';
import 'menu/homefaild/news_product/bloc/new_product_bloc.dart';
import 'menu/homefaild/news_product/detail_new/bloc/detail_new_bloc.dart';
import 'menu/homefaild/news_product/detail_new/sc_detail_new.dart';
import 'menu/new/bloc/post_bloc.dart';

class BaseRouter {
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String LOGIN_REGISTER = '/login_register';
  static const String LOGIN_TEST_REGISTER = '/login_test_register';
  static const String REGISTER = '/register';
  static const String REGISTER_VERIFY = '/register_verify';
  static const String FORGOT_PASSWORD = '/forgot_password';
  static const String FORGOT_PASSWORD_VERIFY = '/forgot_password_verify';
  static const String FORGOT_PASSWORD_RESET = '/forgot_password_reset';
  static const String CREATE_NEWS = '/create_news';
  static const String NEW_DETAIL = '/new_detail';
  static const String NAVIGATION = '/navigation';
  static const String DETAIL_PRODUCT_HOT = '/detail_product_hot';
  static const String CATEGORY_PRIMARY = '/category_primary';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case NAVIGATION:
        return MaterialPageRoute(builder: (_) => NavigationScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    var homeRepository = RepositoryProvider.of<HomeRepository>(context);
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    var notificationRepository =
        RepositoryProvider.of<NotificationRepository>(context);
    var addressRepository = RepositoryProvider.of<AddressRepository>(context);
    var cartRepository = RepositoryProvider.of<CartRepository>(context);
    var paymentRepository = RepositoryProvider.of<PaymentRepository>(context);
    var invoiceRepository = RepositoryProvider.of<InvoiceRepository>(context);
    return {
      SPLASH: (context) => SplashScreen(),
      LOGIN: (context) => LoginScreen(),
      // LOGIN_REGISTER: (context) => LoginOrRegister(),
      // LOGIN_TEST_REGISTER: (context) => LoginTestScreen(),
      REGISTER: (context) => RegisterScreen(),
      REGISTER_VERIFY: (context) => RegisterVerifyScreen(),
      FORGOT_PASSWORD: (context) => ForgotPasswordScreen(),
      FORGOT_PASSWORD_VERIFY: (context) => ForgotPasswordVerifyScreen(),
      FORGOT_PASSWORD_RESET: (context) => ForgotPasswordResetScreen(),

      // NAVIGATION: (context) => NavigationScreen(),
      NAVIGATION: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => PostBloc(userRepository: userRepository),
            ),
            BlocProvider(
              create: (context) =>
                  PostVoucherBloc(userRepository: userRepository),
            ),
            BlocProvider(
              create: (context) =>
                  PostBannerBloc(userRepository: userRepository),
            ),
            BlocProvider(
              create: (context) =>
                  PostCategoryProductBloc(userRepository: userRepository),
            ),
            BlocProvider(
              create: (context) =>
                  HomeCategoriesHotBloc(homeRepository: homeRepository),
            ),
            BlocProvider(
              create: (context) =>
                  HomeCategorieNewBestBloc(homeRepository: homeRepository),
            ),
            BlocProvider(
              create: (context) => HomeDataBloc(userRepository: userRepository),
            ),
            // BlocProvider(
            //   create: (context) => PostCategoryProductNewBestBloc(homeRepository: homeRepository),
            // ),
            BlocProvider(
              create: (context) =>
                  NewProductBloc(homeRepository: homeRepository),
            ),
          ], child: NavigationScreen()),
      NEW_DETAIL: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  DetailNewBloc(homeRepository: homeRepository),
            ),
          ], child: DetailNewScreen()),
      DETAIL_PRODUCT_HOT: (context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              DetailProductBloc(homeRepository: homeRepository),
        ),
        BlocProvider(
          create: (context) =>
              RelatedProductBloc(homeRepository: homeRepository),
        ),
        BlocProvider(
          create: (context) =>
              BottomPanelBloc(),
        ),
        BlocProvider(
          create: (context) =>
              BuyNowPanelBloc(cartRepository: cartRepository),
        ),
      ], child: DetailProductScreen()),
      CATEGORY_PRIMARY: (context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              CategoryPrimaryBloc(homeRepository: homeRepository),
        ),
        BlocProvider(
          create: (context) =>
              PostCategoryProductBloc(userRepository: userRepository),
        ),
      ], child: CategoryPrimaryScreen()),
    };
  }
}
