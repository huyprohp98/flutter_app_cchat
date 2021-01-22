import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/register_verify_resend/bloc/register_verify_resend_bloc.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/widget_register_verify_appbar.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/widget_register_verify_form.dart';
import 'package:flutter_app_cchat/presentation/screen/register_verify/widget_register_verify_username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register_verify_bloc.dart';

class  RegisterVerifyScreen extends StatefulWidget {
  @override
  _RegisterVerifyScreenState createState() => _RegisterVerifyScreenState();
}

class _RegisterVerifyScreenState extends State<RegisterVerifyScreen> {
  String _username;
  // String _phone;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _username = arguments['username'];
        // _phone = arguments['phone'];
        print("_______________");
        print(_username);
        // print(_phone);
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
                    RegisterVerifyBloc(userRepository: userRepository),
              ),
              BlocProvider(
                create: (context) =>
                    RegisterVerifyResendBloc(userRepository: userRepository),
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
                              // _buildResend(),
                              // WidgetSpacer(height: 20,),
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

  _buildAppbar() => WidgetRegisterVerifyAppbar();

  _buildUsername() => WidgetRegisterVerifyUsername(
        username: _username,
      );

  _buildForm() => WidgetRegisterVerifyForm(
        username: _username,
        // phone: _phone,
      );
}
