import 'package:flutter_app_cchat/app/auth_bloc/authentication_bloc.dart';
import 'package:flutter_app_cchat/app/constants/navigator/navigator.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:flutter_app_cchat/presentation/screen/login/widget_login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: Scaffold(
        body: BlocProvider(
            create: (context) => LoginBloc(
                userRepository: userRepository,
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context)),
            child: Column(
              children: [
                // Container(
                //   child: Stack(
                //     children: [
                //       Container(
                //         color: Colors.red,
                //         width: MediaQuery.of(context).size.width,
                //         height: 80,
                //       ),
                //       Positioned.fill(
                //           top: 24,
                //           left: 15,
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Image.asset(
                //                 'assets/images/left_arrow.png',
                //                 width: 25,
                //                 height: 25,
                //               ),
                //             ],
                //           )),
                //       Positioned.fill(
                //           top: 24,
                //           child: Center(
                //             child: Text(
                //               "Đăng nhập",
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 16,
                //               ),
                //             ),
                //           )),
                //     ],
                //   ),
                // ),
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/img_login.png",
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width/2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildLoginForm(),
                  ],
                ))
              ],
            )),
      ),
    );
  }

  _buildLoginForm() => WidgetLoginForm();
}
