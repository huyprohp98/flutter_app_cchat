class Validator {

  static final RegExp _phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');

  static final RegExp _emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^.{8,}$',
  );

  static final RegExp _otpCodeRegExp = RegExp(
    r'^.{6,}$',
  );

  static final RegExp _fullnameRegExp = RegExp(
    r'^.{1,}$',
  );

  static final RegExp _isNotEmptyRegExp = RegExp(
    r'^.{1,}$',
  );

  static bool isNotEmpty(String string) {
    return _isNotEmptyRegExp.hasMatch(string);
  }

  static isValidUsername(String username) {
    return _emailRegExp.hasMatch(username) || _phoneRegExp.hasMatch(username);
  }

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidName(String name) {
    return name.isNotEmpty;
  }
  static isValidPhoneNumber(String phoneNumber) {
    return _phoneRegExp.hasMatch(phoneNumber);
  }

  static isValidOtp(String otpCode) {
    return _otpCodeRegExp.hasMatch(otpCode);
  }

  static isValidResendOtp(int time) {
    return time == 0;
  }

  static isValidFullname(String fullname) {
    return _fullnameRegExp.hasMatch(fullname);
  }
}
