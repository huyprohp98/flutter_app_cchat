import 'package:flutter_app_cchat/app/constants/navigator/navigator.dart';
import 'package:flutter_app_cchat/app/constants/string/validator.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_button.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_input.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_register_input.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter_app_cchat/utils/snackbar/get_snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/forgot_password_bloc.dart';
import 'bloc/forgot_password_event.dart';
import 'bloc/forgot_password_state.dart';

class WidgetForgotPasswordForm extends StatefulWidget {
  @override
  _WidgetForgotPasswordFormState createState() =>
      _WidgetForgotPasswordFormState();
}

class _WidgetForgotPasswordFormState extends State<WidgetForgotPasswordForm> {
  ForgotPasswordBloc _forgotPasswordBloc;

  final TextEditingController _usernameController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool get isPopulated => _usernameController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
    _usernameController.addListener(_onUsernameChange);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateForgotPasswordVerify(
              username: _usernameController.text);
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  _buildTextFieldUsername(),
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Divider(
                  //     color: Colors.grey,
                  //     thickness: 1,
                  //     height: 0,
                  //   ),
                  // ),
                  WidgetSpacer(
                    height: 20,
                  ),
                  _buildButtonForgotPassword(state),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(right: 10),
                  //       child:
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isForgotPasswordButtonEnabled() {
    return _forgotPasswordBloc.state.isFormValid &&
        isPopulated &&
        !_forgotPasswordBloc.state.isSubmitting;
  }

  _buildButtonForgotPassword(ForgotPasswordState state) {
    return WidgetLoginButton(
      onTap: () {
        if (isForgotPasswordButtonEnabled()) {
          _forgotPasswordBloc.add(ForgotPasswordSubmitted(
            username: _usernameController.text,
          ));
          FocusScope.of(context).unfocus();
        }
      },
      isEnable: isForgotPasswordButtonEnabled(),
      text: AppLocalizations.of(context).translate('forgot_password.continue'),
    );
  }

  _buildTextFieldUsername() {
    return WidgetRegisterInput(
      inputType: TextInputType.emailAddress,
      inputController: _usernameController,
      validator: AppValidation.validateUserName(AppLocalizations.of(context)
          .translate('forgot_password.username_invalid')),
      hint: AppLocalizations.of(context)
          .translate('forgot_password.username_hint'),
      // leadIcon: Image.asset(
      //   'assets/images/envelope.png',
      //   width: 25,
      //   height: 25,
      //   color: Colors.grey,
      // ),
    );
  }
  // _buildTextFieldUsername() {
  //   return                 Container(
  //     width: MediaQuery.of(context).size.width / 1.2,
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(50.0),
  //       ),
  //       elevation: 3,
  //       child: Container(
  //         margin: EdgeInsets.only(left: 20),
  //         child: TextFormField(
  //           enableInteractiveSelection: false,
  //           controller: _usernameController,
  //           onChanged: (value) {
  //             _loginBloc.add(LoginUsernameChanged(email: value));
  //           },
  //           validator: AppValidation.validateUserName(
  //               "Vui lòng điền tài khoản"),
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             hintText: "Số điện thoại hoặc email",
  //             hintStyle: TextStyle(color: Colors.grey[400]),
  //           ),
  //           textAlign: TextAlign.start,
  //         ),
  //       ),
  //     ),
  //   ),
  //
  // }

  void _onUsernameChange() {
    _forgotPasswordBloc.add(UsernameChanged(
      username: _usernameController.text,
    ));
  }
}
