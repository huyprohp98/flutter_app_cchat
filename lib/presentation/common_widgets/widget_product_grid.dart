import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetProductGrid extends StatelessWidget {
  final CategoryProductHotData product;
  final bool full;
  final bool empty;

  const WidgetProductGrid(
      {Key key, this.product, this.full = false, this.empty = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return empty
        ? SizedBox(
            width: full ? width : (width - 40) / 2,
      height: 1,
          )
        : GestureDetector(
            onTap: () {
              AppNavigator.navigateDetailProductHot(product.id);
            },
            child: Container(
                width: full ? width : (width - 40) / 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: AspectRatio(
                        aspectRatio: AppValue.PRODUCT_IMAGE_RATIO,
                        child: WidgetCachedImage(
                          url: product.image[0],
                        )
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetSpacer(
                            height: 6,
                          ),
                          product.salePrice != 0
                              ? Text(
                                  '${product.percentOff.floor()}% OFF',
                                  style: AppStyle.APP_MEDIUM.copyWith(
                                      color: AppColor.THIRD_COLOR,
                                      fontWeight: FontWeight.w800),
                                )
                              : SizedBox(),
                          WidgetSpacer(
                            height: product.salePrice != 0 ? 5 : 0,
                          ),
                          Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.DEFAULT_MEDIUM.copyWith(
                              color: AppColor.PRIMARY,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          WidgetSpacer(
                            height: 5,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              product.salePrice != 0
                                  ? Text(
                                      '${AppValue.APP_MONEY_FORMAT.format(product.price)}',
                                      style: AppStyle.PRODUCT_PRICE,
                                    )
                                  : Text(
                                      '${AppValue.APP_MONEY_FORMAT.format(product.price)}',
                                      style: AppStyle.PRODUCT_SALE_PRICE,
                                    ),
                              WidgetSpacer(
                                height: 0,
                                width: 10,
                              ),
                              product.salePrice != 0
                                  ? Text(
                                      '${AppValue.APP_MONEY_FORMAT.format(product.salePrice)}',
                                      style: AppStyle.PRODUCT_SALE_PRICE,
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          WidgetSpacer(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
  }
}
