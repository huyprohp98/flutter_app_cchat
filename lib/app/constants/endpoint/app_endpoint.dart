// class Endpoint {
//   Endpoint._();
//
//   static const BASE_URL = 'https://myphamlinhanh.vn';
//   //AUTH ROUTE
//   static const LOGIN_APP = '/api/loginApp';
//   static const REGISTER_APP = '/api/registerApp';
//   static const REGISTER_VERIFY = '/api/checkOtpRegister';
//   static const RESEND_OTP = '/api/resendCodeOtp';
//   static const FORGOT_PASSWORD = '/api/forgetPassword';
//   static const FORGOT_PASSWORD_RESET = '/api/resetPassword';
//   static const FORGOT_PASSWORD_VERIFY =
//       '/api/checkOtpSmsExpireInForgotPassWord';
//   static const GET_NEWS = '/api/listUserNew';
//   static const POST_NEWS = '/api/createUserNew';
//
//   static const int DEFAULT_LIMIT = 20;
//
//   // request failed
//   static const int FAILURE = 0;
//
//   // request success
//   static const int SUCCESS = 1;
//
//   // request with token expire
//   static const int TOKEN_EXPIRE = 2;
//
//   // receiveTimeout
//   static const int receiveTimeout = 15000;
//
//   // connectTimeout
//   static const int connectionTimeout = 15000;
//
//   // method
//   static const GET = 'GET';
//   static const POST = 'POST';
//   static const PUT = 'PUT';
//   static const DELETE = 'DELETE';
//
//   // get path
//   static String getPath(String path) {
//     return '$BASE_URL$path';
//   }
// }
