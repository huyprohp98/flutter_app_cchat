import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_button.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_input.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_register_input.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/common/common_utils.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter_app_cchat/utils/snackbar/get_snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

// import '../../router.dart';
import '../router.dart';
import 'bloc/forgot_password_reset_bloc.dart';
import 'bloc/forgot_password_reset_event.dart';
import 'bloc/forgot_password_reset_state.dart';

class WidgetForgotPasswordResetForm extends StatefulWidget {
  final String username;
  final String otpCode;

  const WidgetForgotPasswordResetForm({Key key, this.username, this.otpCode})
      : super(key: key);

  @override
  _WidgetForgotPasswordResetFormState createState() =>
      _WidgetForgotPasswordResetFormState();
}

class _WidgetForgotPasswordResetFormState
    extends State<WidgetForgotPasswordResetForm> {
  ForgotPasswordResetBloc _forgotPasswordBloc;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool autovalidate = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool get isPopulated =>
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _forgotPasswordBloc = BlocProvider.of<ForgotPasswordResetBloc>(context);
    _passwordController.addListener(_onPasswordChange);
    _confirmPasswordController.addListener(_onConfirmPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordResetBloc, ForgotPasswordResetState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateLogin();
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
          setState(() {
            autovalidate = true;
          });
        }
      },
      child: BlocBuilder<ForgotPasswordResetBloc, ForgotPasswordResetState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  _buildTextFieldPassword(),
                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildTextFieldConfirmPassword(),
                  WidgetSpacer(
                    height: 15,
                  ),
                  _buildButtonForgotPasswordReset(state),
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

  bool isForgotPasswordResetButtonEnabled() {
    return _forgotPasswordBloc.state.isFormValid &&
        isPopulated &&
        !_forgotPasswordBloc.state.isSubmitting;
  }

  _buildButtonForgotPasswordReset(ForgotPasswordResetState state) {
    return WidgetLoginButton(
      onTap: () {
        if (isForgotPasswordResetButtonEnabled()) {
          _forgotPasswordBloc.add(ForgotPasswordResetSubmitted(
              username: widget.username,
              otpCode: widget.otpCode,
              password: _passwordController.text,
              confirmPassword: _confirmPasswordController.text));
          AppCommonUtils.disposeKeyboard();
        }
      },
      isEnable: isForgotPasswordResetButtonEnabled(),
      text: AppLocalizations.of(context)
          .translate('forgot_password_reset.update'),
    );
  }

  _buildTextFieldConfirmPassword() {
    return WidgetRegisterInput(
      inputController: _confirmPasswordController,
      obscureText: true,
      autovalidate: autovalidate,
      validator: (_) {
        return !_forgotPasswordBloc.state.isConfirmPasswordValid
            ? AppLocalizations.of(context)
                .translate('forgot_password_reset.confirm_password_invalid')
            : null;
      },
      hint: AppLocalizations.of(context)
          .translate('forgot_password_reset.confirm_password_hint'),
      // leadIcon: Image.asset(
      //   'assets/images/padlock.png',
      //   width: 25,
      //   height: 25,
      //   color: Colors.grey,
      // ),
    );
  }

  _buildTextFieldPassword() {
    return WidgetRegisterInput(
      inputController: _passwordController,
      obscureText: true,
      autovalidate: autovalidate,
      validator: (_) {
        return !_forgotPasswordBloc.state.isPasswordValid
            ? AppLocalizations.of(context)
                .translate('forgot_password_reset.password_invalid')
            : null;
      },
      hint: AppLocalizations.of(context)
          .translate('forgot_password_reset.password_hint'),
      // leadIcon: Image.asset(
      //   'assets/images/padlock.png',
      //   width: 25,
      //   height: 25,
      //   color: Colors.grey,
      // ),
    );
  }

  void _onPasswordChange() {
    _forgotPasswordBloc.add(PasswordChanged(
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text));
  }

  void _onConfirmPasswordChange() {
    _forgotPasswordBloc.add(ConfirmPasswordChanged(
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text));
  }
}
