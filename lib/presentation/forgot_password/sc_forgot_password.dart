import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:flutter_app_cchat/presentation/forgot_password/widget_forgot_password_appbar.dart';
import 'package:flutter_app_cchat/presentation/forgot_password/widget_forgot_password_form.dart';
import 'package:flutter_app_cchat/presentation/forgot_password/widget_forgot_password_title.dart';

import 'package:flutter_app_cchat/presentation/screen/register/widget_bottom_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                ForgotPasswordBloc(userRepository: userRepository),
            child: Container(
                color: AppColor.PRIMARY_BACKGROUND,
                child: Column(
                  children: [
                    _buildAppbar(),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Nhập thông tin tài khoản",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Text(
                                'Vui lòng nhập Số điện thoại hoặc Email mà bạn đăng ký tài khoản',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _buildForgotPasswordForm(),
                          _buildBottomLogin()
                        ],
                      ),
                    )),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  _buildAppbar() => WidgetForgotPasswordAppbar();

  _buildTop() => WidgetForgotPasswordTitle();

  _buildForgotPasswordForm() => WidgetForgotPasswordForm();
  _buildBottomLogin() => WidgetBottomLogin();
}
