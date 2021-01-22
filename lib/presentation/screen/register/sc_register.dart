import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_logo.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:flutter_app_cchat/presentation/screen/register/widget_bottom_login.dart';
import 'package:flutter_app_cchat/presentation/screen/register/widget_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => RegisterBloc(userRepository: userRepository),
          child: Container(
              color: AppColor.PRIMARY_BACKGROUND,
              child: ListView(
                children: [
                  WidgetSpacer(
                    height: 20,
                  ),
                  _buildImage(),
                  _buildRegisterForm(),
                  _buildBottomLogin(),
                  WidgetSpacer(
                    height: 20,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  _buildImage() => WidgetLoginLogo();
  _buildRegisterForm() => WidgetRegisterForm();
  _buildBottomLogin() => WidgetBottomLogin();
}
