import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/presentation/forgot_password_verify/widget_forgot_password_verify_appbar.dart';
import 'package:flutter_app_cchat/presentation/forgot_password_verify/widget_forgot_password_verify_form.dart';
import 'package:flutter_app_cchat/presentation/forgot_password_verify/widget_forgot_password_verify_username.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/forgot_password_verify_bloc.dart';
import 'forgot_password_verify_resend/bloc/forgot_password_verify_resend_bloc.dart';

class ForgotPasswordVerifyScreen extends StatefulWidget {
  @override
  _ForgotPasswordVerifyScreenState createState() =>
      _ForgotPasswordVerifyScreenState();
}

class _ForgotPasswordVerifyScreenState
    extends State<ForgotPasswordVerifyScreen> {
  String _username, _phone;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _username = arguments['username'];
        _phone = arguments['phone'];
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
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ForgotPasswordVerifyBloc(userRepository: userRepository),
              ),
              BlocProvider(
                create: (context) => ForgotPasswordVerifyResendBloc(
                    userRepository: userRepository),
              ),
            ],
            child: Container(
                color: AppColor.PRIMARY_BACKGROUND,
                child: Column(
                  children: [
                    _buildAppbar(),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              WidgetSpacer(
                                height: 45,
                              ),
                              _buildUsername(),
                              _buildForm(),
                            ],
                          ),
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

  _buildAppbar() => WidgetForgotPasswordVerifyAppbar();

  _buildUsername() => WidgetForgotPasswordVerifyUsername(
        username: _username,
      );

  _buildForm() => WidgetForgotPasswordVerifyForm(
        username: _username,
        phone: _phone,
      );
}
