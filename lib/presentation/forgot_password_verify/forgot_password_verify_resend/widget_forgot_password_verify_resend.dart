import 'package:flutter_app_cchat/app/constants/value/value.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_resend.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/snackbar/get_snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/forgot_password_verify_resend_bloc.dart';
import 'bloc/forgot_password_verify_resend_event.dart';
import 'bloc/forgot_password_verify_resend_state.dart';

class WidgetForgotPasswordVerifyResend extends StatefulWidget {
  final String username;

  const WidgetForgotPasswordVerifyResend({Key key, this.username})
      : super(key: key);

  @override
  _WidgetForgotPasswordVerifyResendState createState() =>
      _WidgetForgotPasswordVerifyResendState();
}

class _WidgetForgotPasswordVerifyResendState
    extends State<WidgetForgotPasswordVerifyResend> {
  ForgotPasswordVerifyResendBloc _registerVerifyResendBloc;

  @override
  void initState() {
    super.initState();
    _registerVerifyResendBloc =
        BlocProvider.of<ForgotPasswordVerifyResendBloc>(context)
          ..add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordVerifyResendBloc,
        ForgotPasswordVerifyResendState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          BlocProvider.of<ForgotPasswordVerifyResendBloc>(context)
              .add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ForgotPasswordVerifyResendBloc,
          ForgotPasswordVerifyResendState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: [_buildContent(state)],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isResendEnabled() {
    return _registerVerifyResendBloc.state.isFormValid &&
        !_registerVerifyResendBloc.state.isSubmitting;
  }

  Widget _buildContent(ForgotPasswordVerifyResendState state) {
    if (state.time != null) {
      return WidgetResend(
        onTap: () {
          BlocProvider.of<ForgotPasswordVerifyResendBloc>(context)
              .add(ForgotPasswordResendOtp(username: widget.username));
        },
        time: state.time,
        isValid: isResendEnabled(),
      );
    } else {
      return WidgetSpacer();
    }
  }
}
