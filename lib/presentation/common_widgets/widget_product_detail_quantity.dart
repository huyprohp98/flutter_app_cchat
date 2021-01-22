import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';

const double heightQuantity = 26;
const double widthQuantity = 26;

class WidgetProductDetailQuantity extends StatelessWidget {
  final int quantity;
  final Function onIncreaseTap;
  final Function onDecreaseTap;

  const WidgetProductDetailQuantity(
      {Key key, this.onIncreaseTap, this.onDecreaseTap, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${AppLocalizations.of(context).translate('product_detail.quantity')}: ',
            style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.THIRD_COLOR),
          ),
          const SizedBox(
            width: 2,
          ),
          Row(
            children: [
              InkWell(
                onTap: onDecreaseTap,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          vertical:
                              BorderSide(color: AppColor.GREY, width: 0.5),
                          horizontal:
                              BorderSide(color: AppColor.GREY, width: 0.5))),
                  width: widthQuantity,
                  height: heightQuantity,
                  child: Icon(Icons.remove, color: AppColor.THIRD_COLOR, size: AppValue.FONT_SIZE_SMALL,),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical:
                            BorderSide(color: AppColor.GREY, width: 0.5))),
                width: widthQuantity * 1.5,
                height: heightQuantity,
                child: Center(child: Text(quantity.toString(), style: AppStyle.DEFAULT_SMALL_BOLD,)),
              ),
              InkWell(
                onTap: onIncreaseTap,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          vertical:
                              BorderSide(color: AppColor.GREY, width: 0.5),
                          horizontal:
                              BorderSide(color: AppColor.GREY, width: 0.5))),
                  width: widthQuantity,
                  height: heightQuantity,
                  child: Icon(
                    Icons.add,
                    color: AppColor.THIRD_COLOR,
                    size: AppValue.FONT_SIZE_SMALL,
                  ),
                ),
              ),
              const SizedBox(width: 10,)
            ],
          ),
        ],
      ),
    );
  }
}
