import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/presentation/forgot_password_reset/widget_forgot_password_reset_appbar.dart';
import 'package:flutter_app_cchat/presentation/forgot_password_reset/widget_forgot_password_reset_form.dart';
import 'package:flutter_app_cchat/presentation/forgot_password_reset/widget_forgot_password_reset_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/forgot_password_reset_bloc.dart';

class ForgotPasswordResetScreen extends StatefulWidget {
  @override
  _ForgotPasswordResetScreenState createState() =>
      _ForgotPasswordResetScreenState();
}

class _ForgotPasswordResetScreenState extends State<ForgotPasswordResetScreen> {
  String _username;
  String _otpCode;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _username = arguments['username'];
        _otpCode = arguments['otp_code'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onArgument();
  }

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                ForgotPasswordResetBloc(userRepository: userRepository),
            child: Container(
                color: AppColor.PRIMARY_BACKGROUND,
                child: Column(
                  children: [
                    _buildAppbar(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            WidgetSpacer(
                              height: 45,
                            ),
                            _buildTop(),
                            _buildForgotPasswordResetForm(),
                            WidgetSpacer(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  _buildAppbar() => WidgetForgotPasswordResetAppbar();

  _buildTop() => WidgetForgotPasswordResetTitle();

  _buildForgotPasswordResetForm() => WidgetForgotPasswordResetForm(
        username: _username,
        otpCode: _otpCode,
      );
}
