class Endpoint {
  Endpoint._();

  static const BASE_ANH_QUAN_URL = 'https://app.cchatclothes.vn';
  //AUTH ROUTE
  static const LOGIN_ANH_QUAN_APP = '/api/loginApp';
  static const REGISTER_ANH_QUAN_APP = '/api/registerApp';
  static const REGISTER_ANH_QUAN_VERIFY = '/api/checkOtpRegister';
  static const RESEND_OTP = '/api/resendCodeOtp';
  static const FORGOT_PASSWORD = '/api/forgetPassword';
  // static const FORGOT_PASSWORD_RESET = '/api/resetPassword';
  static const FORGOT_PASSWORD_VERIFY =
      '/api/checkOtpInForgotPassword';
  static const FORGOT_PASSWORD_RESET = '/api/resetPassword';

  static const GET_NEWS = '/api/listUserNew';
  static const GET_PROFILE_USER ='/api/profileUser';
  static const GET_LIST_VOUCHER ='/api/listVoucher';
  static const GET_LIST_HOME ='/api/getInfo';
  static const GET_LIST_CATEGORY_PRODUCT_HOT ='/api/listProducts';
  static const GET_PRODUCT = '/api/news';
  static const DETAIL_NEW = '/api/newsDetail';
  static const DETAIL_PRODUCT = '/api/getDetailProduct';
  static const ADD_PRODUCT_IN_CART = '/api/addProductInCart';
  static const CART = '/api/listProductInCartOfUser';
  static const CART_QUANTITY_ADD = '/api/upQuantityProductInCart';
  static const CART_QUANTITY_REMOVE = '/api/downQuantityProductInCart';
  static const CART_REMOVE = '/api/destroyProductInCart';
  static const PRODUCT_SEARCH_ATTR = '/api/searchProductByKey';





  // static const POST_NEWS = '/api/createUserNew';

  static const int DEFAULT_LIMIT = 20;

  // request failed
  static const int FAILURE = 0;

  // request success
  static const int SUCCESS = 1;

  // request with token expire
  static const int TOKEN_EXPIRE = 2;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  // method
  static const GET = 'GET';
  static const POST = 'POST';
  static const PUT = 'PUT';
  static const DELETE = 'DELETE';

  // get path
  static String getPath(String path) {
    return '$BASE_ANH_QUAN_URL$path';
  }
}
