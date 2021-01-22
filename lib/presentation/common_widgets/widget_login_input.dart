import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetLoginInput extends StatefulWidget {
  final TextEditingController inputController;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hint;
  final bool obscureText;
  final bool autovalidate;
  final TextInputType inputType;
  final Widget endIcon;
  final Widget leadIcon;

  WidgetLoginInput(
      {this.inputController,
      this.onChanged,
      this.validator,
      this.hint,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.autovalidate = false,
      this.endIcon,
      this.leadIcon});

  @override
  _WidgetLoginInputState createState() => _WidgetLoginInputState();
}

class _WidgetLoginInputState extends State<WidgetLoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      height: AppValue.INPUT_FORM_HEIGHT,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              widget.leadIcon ?? WidgetSpacer(),
              Container(height: 20, child: VerticalDivider(color: Colors.grey)),
              Expanded(
                child: TextFormField(
                  controller: widget.inputController,
                  onChanged: (change) {
                    widget.onChanged(change);
                  },
                  autovalidate: widget.autovalidate ?? false,
                  validator: widget.validator,
                  style: AppStyle.DEFAULT_MEDIUM,
                  maxLines: 1,
                  keyboardType: widget.inputType ?? TextInputType.text,
                  textAlign: TextAlign.left,
                  obscureText: widget.obscureText,
                  decoration: InputDecoration.collapsed(
                    hintText: widget.hint,
                  ),
                ),
              ),
              widget.endIcon ?? WidgetSpacer()
            ],
          ),
        ),
      ),
    ));
  }
}
