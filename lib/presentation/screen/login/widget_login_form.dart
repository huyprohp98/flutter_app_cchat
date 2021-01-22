import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/app/constants/navigator/navigator.dart';
import 'package:flutter_app_cchat/app/constants/string/validator.dart';
import 'package:flutter_app_cchat/app/constants/style/style.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/presentation/screen/login/bloc/login_event.dart';
import 'package:flutter_app_cchat/utils/snackbar/get_snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';

class WidgetLoginForm extends StatefulWidget {
  @override
  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  LoginBloc _loginBloc;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool obscurePassword = true;
  bool autoValidate = false;

  bool get isPopulated =>
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    // _usernameController.text = '0867160324';
    // _passwordController.text = '123456789';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateNavigation();
        }
        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
          setState(() {
            autoValidate = true;
          });
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    elevation: 3,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        controller: _usernameController,
                        onChanged: (value) {
                          _loginBloc.add(LoginUsernameChanged(email: value));
                        },
                        validator: AppValidation.validateUserName(
                            "Vui lòng điền tài khoản"),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Số điện thoại hoặc email",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                WidgetSpacer(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    elevation: 3,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: TextFormField(
                              enableInteractiveSelection: false,
                              controller: _passwordController,
                              obscureText: obscurePassword,
                              onChanged: (value) {
                                _loginBloc
                                    .add(LoginPasswordChanged(password: value));
                              },
                              validator: AppValidation.validatePassword(
                                  "Vui lòng nhập mật khẩu"),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mật khẩu",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? MaterialCommunityIcons.eye_outline
                                    : MaterialCommunityIcons.eye_off_outline,
                                color: AppColor.GREY,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                WidgetSpacer(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(left: 170),
                  child: GestureDetector(
                    onTap: () {
                      AppNavigator.navigateForgotPassword();
                    },
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                WidgetSpacer(
                  height: 20,
                ),
                _buildButtonLogin(state),
                WidgetSpacer(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Hoặc ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                WidgetSpacer(
                  height: 10,
                ),
                Center(
                  child: Image.asset("assets/images/LogoGoogle.png",width: 50,height: 50,),
                ),
                Center(
                  child: Text(
                    "Google",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                WidgetSpacer(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppNavigator.navigateForgotPassword();
                      },
                      child: Text(
                        'Chưa có tài khoản?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),

                    GestureDetector(
                      onTap: () {
                        AppNavigator.navigateRegister();
                      },
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(
                          fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    ),

                    // _buildButtonLogin(state),
                  ],
                ),

              ],
            ),
          ),
        );
      }),
    );
  }

  _buildButtonLogin(LoginState state) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 12,
      child: GestureDetector(
        onTap: () {
          if (isRegisterButtonEnabled()) {
            _loginBloc.add(LoginSubmitUsernamePasswordEvent(
              email: _usernameController.text.trim(),
              password: _passwordController.text.trim(),
            ));
            FocusScope.of(context).unfocus();
          }
        },
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: isRegisterButtonEnabled()
              ? AppColor.BLACK
              : AppColor.BUTTON_DISABLE_COLOR,
          child: Center(
              child: Text(
            "Đăng nhập",
            style: isRegisterButtonEnabled()
                ? AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE)
                : AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.BLACK),
          )),
        ),
      ),
    );
  }

  bool isRegisterButtonEnabled() {
    return _loginBloc.state.isFormValid &&
        isPopulated &&
        !_loginBloc.state.isSubmitting;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget WidgetButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: 50,
      child: GestureDetector(
        onTap: () {
          if (isRegisterButtonEnabled()) {
            _loginBloc.add(LoginSubmitUsernamePasswordEvent(
              email: _usernameController.text.trim(),
              password: _passwordController.text.trim(),
            ));
            FocusScope.of(context).unfocus();
          }
        },
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: isRegisterButtonEnabled()
              ? AppColor.RED
              : AppColor.BUTTON_DISABLE_COLOR,
          child: Center(
              child: Text(
            "Đăng nhập",
            style: isRegisterButtonEnabled()
                ? AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE)
                : AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.BLACK),
          )),
        ),
      ),
    );
  }
}
