import 'package:flutter_app_cchat/app/constants/color/color.dart';
import 'package:flutter_app_cchat/app/constants/navigator/navigator.dart';
import 'package:flutter_app_cchat/app/constants/string/validator.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_button.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_login_input.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter_app_cchat/utils/snackbar/get_snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'bloc/forgot_password_verify_bloc.dart';
import 'bloc/forgot_password_verify_event.dart';
import 'bloc/forgot_password_verify_state.dart';
import 'forgot_password_verify_resend/widget_forgot_password_verify_resend.dart';

class WidgetForgotPasswordVerifyForm extends StatefulWidget {
  final String username, phone;

  const WidgetForgotPasswordVerifyForm(
      {Key key, @required this.username, @required this.phone})
      : super(key: key);

  @override
  _WidgetForgotPasswordVerifyFormState createState() =>
      _WidgetForgotPasswordVerifyFormState();
}

class _WidgetForgotPasswordVerifyFormState
    extends State<WidgetForgotPasswordVerifyForm> {
  ForgotPasswordVerifyBloc _registerVerifyBloc;

  TextEditingController _otpCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _registerVerifyBloc = BlocProvider.of<ForgotPasswordVerifyBloc>(context);
    _otpCodeController.addListener(_onOtpCodeChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordVerifyBloc, ForgotPasswordVerifyState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateForgotPasswordReset(
              username: widget.username, otpCode: _otpCodeController.text);
        }
        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ForgotPasswordVerifyBloc, ForgotPasswordVerifyState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  _buildCodeField(),

                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildButtonVerify(state),
                  WidgetSpacer(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Tôi không nhận được mã.",style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: _buildResend(),
                      )
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool get isPopulated => _otpCodeController.text.isNotEmpty;

  bool isForgotPasswordButtonEnabled() {
    return _registerVerifyBloc.state.isFormValid &&
        isPopulated &&
        !_registerVerifyBloc.state.isSubmitting;
  }

  _buildButtonVerify(ForgotPasswordVerifyState state) {
    return WidgetLoginButton(
      onTap: () {
        if (isForgotPasswordButtonEnabled()) {
          _registerVerifyBloc.add(ForgotPasswordVerifySubmitted(
            username: widget.username,
            otpCode: _otpCodeController.text,
          ));
        }
      },
      isEnable: isForgotPasswordButtonEnabled(),
      text: AppLocalizations.of(context).translate('forgot_password.continue'),
    );
  }

  // Widget _buildCodeField() {
  //   return WidgetLoginInput(
  //     inputType: TextInputType.number,
  //     inputController: _otpCodeController,
  //     validator: AppValidation.validateUserName(
  //         AppLocalizations.of(context).translate('register_verify.otpCheck')),
  //     hint: AppLocalizations.of(context).translate('register_verify.title'),
  //     leadIcon: Image.asset(
  //       'assets/images/envelope.png',
  //       width: 25,
  //       height: 25,
  //       color: Colors.grey,
  //     ),
  //   );
  // }
  Widget _buildCodeField() {
    return PinCodeTextField(
      length: 6,
      obsecureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderWidth: 0,
        inactiveColor: AppColor.GREY_LIGHTER_3,
        inactiveFillColor: AppColor.GREY_LIGHTER_3,
        selectedColor: AppColor.GREY,
        selectedFillColor: AppColor.GREY,
        activeColor: AppColor.GREY_LIGHTER_3,
        activeFillColor: AppColor.GREY_LIGHTER_3,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      textInputType: TextInputType.number,
      controller: _otpCodeController,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {},
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  void _onOtpCodeChange() {
    _registerVerifyBloc.add(OtpCodeChanged(otpCode: _otpCodeController.text));
  }

  @override
  void dispose() {
    super.dispose();
  }

  _buildResend() => WidgetForgotPasswordVerifyResend(username: widget.username);
}
