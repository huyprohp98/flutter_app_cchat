import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/app/constants/navigator/navigator.dart';
import 'package:flutter_app_cchat/app/constants/string/validator.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_button.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_input.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_register_button.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_register_input.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter_app_cchat/utils/snackbar/get_snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'bloc/register_bloc.dart';
import 'bloc/register_event.dart';
import 'bloc/register_state.dart';

class WidgetRegisterForm extends StatefulWidget {
  @override
  _WidgetRegisterFormState createState() => _WidgetRegisterFormState();
}

class _WidgetRegisterFormState extends State<WidgetRegisterForm> {
  RegisterBloc _registerBloc;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool autoValidate = false;

  bool get isPopulated =>
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _usernameController.addListener(_onUsernameChange);
    _passwordController.addListener(_onPasswordChanged);
    _confirmPasswordController.addListener(_onPasswordConfirmChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateRegisterVerify(
            // username: _emailController.text, phone: _phoneController.text
            username: _usernameController.text,
          );
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
          setState(() {
            autoValidate = true;
          });
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
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
                    height: 10,
                  ),
                  _buildTextFieldPassword(),
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Divider(
                  //     color: Colors.grey,
                  //     thickness: 1,
                  //     height: 0,
                  //   ),
                  // ),

                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildTextFieldConfirmPassword(),
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
                  Container(
                    child: _buildButtonRegister(state),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(right: 10),
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

//  bool isRegisterButtonEnabled() {
//    return _registerBloc.state.isFormValid &&
//        isPopulated &&
//        !_registerBloc.state.isSubmitting;
//  }

  bool isRegisterButtonEnabled() {
    return _registerBloc.state.isSubmitting;
  }

  _buildButtonRegister(RegisterState state) {
    return WidgetRegisterButton(
      onTap: () {
        if (!isRegisterButtonEnabled()) {
          _registerBloc.add(RegisterSubmitted(
            username: _usernameController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
          ));
          FocusScope.of(context).unfocus();
        }
      },
      isEnable: !isRegisterButtonEnabled(),
      text: AppLocalizations.of(context).translate('register.title'),
    );
  }

  _buildTextFieldUsername() {
    return WidgetRegisterInput(
      inputType: TextInputType.emailAddress,
      inputController: _usernameController,
      validator: AppValidation.validateUserName(
          AppLocalizations.of(context).translate('register.username_invalid')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('register.email.phone'),
      // leadIcon: Image.asset(
      //   'assets/images/user_p.png',
      //   width: 25,
      //   height: 25,
      //   color: Colors.grey,
      // ),
    );
  }

  _buildTextFieldPassword() {
    return WidgetRegisterInput(
      inputController: _passwordController,
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('register.password_invalid')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('register.password'),
      obscureText: obscurePassword,
      endIcon: IconButton(
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
      // leadIcon: Image.asset(
      //   'assets/images/padlock.png',
      //   width: 25,
      //   height: 25,
      //   color: Colors.grey,
      // ),
    );
  }

  _buildTextFieldConfirmPassword() {
    return WidgetRegisterInput(
      inputController: _confirmPasswordController,
      validator: AppValidation.validatePassword(AppLocalizations.of(context)
          .translate('register.confirm_password_invalid')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('register.confirm_password'),
      obscureText: obscureConfirmPassword,
      endIcon: IconButton(
        icon: Icon(
          obscureConfirmPassword
              ? MaterialCommunityIcons.eye_outline
              : MaterialCommunityIcons.eye_off_outline,
          color: AppColor.GREY,
        ),
        onPressed: () {
          setState(() {
            obscureConfirmPassword = !obscureConfirmPassword;
          });
        },
      ),
      // leadIcon: Image.asset(
      //   'assets/images/padlock.png',
      //   width: 25,
      //   height: 25,
      //   color: Colors.grey,
      // ),
    );
  }

  void _onUsernameChange() {
    _registerBloc.add(UsernameChanged(
      username: _usernameController.text,
    ));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text));
  }

  void _onPasswordConfirmChanged() {
    _registerBloc.add(ConfirmPasswordChanged(
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
   }
}
