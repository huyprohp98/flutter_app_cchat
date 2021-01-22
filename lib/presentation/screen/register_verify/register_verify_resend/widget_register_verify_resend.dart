import 'package:flutter_app_cchat/app/constants/value/value.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_resend.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/snackbar/get_snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register_verify_resend_bloc.dart';
import 'bloc/register_verify_resend_event.dart';
import 'bloc/register_verify_resend_state.dart';

class WidgetRegisterVerifyResend extends StatefulWidget {
  final String username;

  const WidgetRegisterVerifyResend({Key key, this.username}) : super(key: key);

  @override
  _WidgetRegisterVerifyResendState createState() =>
      _WidgetRegisterVerifyResendState();
}

class _WidgetRegisterVerifyResendState
    extends State<WidgetRegisterVerifyResend> {
  RegisterVerifyResendBloc _registerVerifyResendBloc;

  @override
  void initState() {
    super.initState();
    _registerVerifyResendBloc =
        BlocProvider.of<RegisterVerifyResendBloc>(context)
          ..add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterVerifyResendBloc, RegisterVerifyResendState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          BlocProvider.of<RegisterVerifyResendBloc>(context)
              .add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<RegisterVerifyResendBloc, RegisterVerifyResendState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Row(
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

  Widget _buildContent(RegisterVerifyResendState state) {
    if (state.time != null) {
      return WidgetResend(
        onTap: () {
          BlocProvider.of<RegisterVerifyResendBloc>(context)
              .add(RegisterResendOtp(username: widget.username));
        },
        time: state.time,
        isValid: isResendEnabled(),
      );
    } else {
      return WidgetSpacer();
    }
  }
}
