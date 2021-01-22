import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_detail_quantity.dart';
import 'package:flutter_app_cchat/presentation/screen/barrel_screen.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

const width = 40.0;
const height = width * 2 / 3;

class WidgetProductCart extends StatelessWidget {
  final Cart cart;
  final Function onDeleteTap;
  final Function onQuantityAdd;
  final Function onQuantityRemove;

  const WidgetProductCart(
      {Key key,
      @required this.cart,
      @required this.onDeleteTap,
      this.onQuantityAdd,
      this.onQuantityRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: AspectRatio(
              aspectRatio: AppValue.PRODUCT_IMAGE_RATIO,
              child: WidgetCachedImage(
                url: cart.productImage[0],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.productName,
                    style: AppStyle.DEFAULT_SMALL,
                  ),
                  WidgetSpacer(
                    height: 10,
                  ),
                  Text(
                    '${AppLocalizations.of(context).translate('cart.type')} ${cart.productDistribute}',
                    style: AppStyle.DEFAULT_SMALL,
                  ),
                  WidgetSpacer(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      cart.productSalePrice != 0
                          ? Text(
                              '${AppValue.APP_MONEY_FORMAT.format(cart.productPrice)}',
                              style: AppStyle.PRODUCT_PRICE,
                            )
                          : Text(
                              '${AppValue.APP_MONEY_FORMAT.format(cart.productPrice)}',
                              style: AppStyle.PRODUCT_SALE_PRICE,
                            ),
                      WidgetSpacer(
                        width: 10,
                      ),
                      cart.productSalePrice != 0
                          ? Text(
                              '${AppValue.APP_MONEY_FORMAT.format(cart.productSalePrice)}',
                              style: AppStyle.PRODUCT_SALE_PRICE,
                            )
                          : SizedBox(),
                    ],
                  ),
                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildAddOrRemove(),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onDeleteTap,
            borderRadius: BorderRadius.circular(500),
            child: Container(
              width: 30,
              height: 30,
              child: Icon(
                Icons.close,
                color: AppColor.GREY,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddOrRemove(){
    return WidgetProductDetailQuantity(
      onIncreaseTap: onQuantityAdd,
      onDecreaseTap: onQuantityRemove,
      quantity: cart.productQuantity,
    );
  }
}
