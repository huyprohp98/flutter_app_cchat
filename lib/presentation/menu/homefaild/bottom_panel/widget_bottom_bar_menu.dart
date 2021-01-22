import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/product.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bottom_panel_bloc.dart';
import 'bloc/bottom_panel_state.dart';

class WidgetBottomBarMenu extends StatelessWidget {
  final CategoryProductHotData product;
  final Function onAddCartTap;
  final Function onBuyNowTap;

  const WidgetBottomBarMenu(
      {Key key,
      @required this.onAddCartTap,
      @required this.onBuyNowTap,
      @required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomPanelBloc, BottomPanelState>(
        builder: (context, state) {
      return _buildContent(context, state);
    });
  }

  Widget _buildContent(BuildContext context, BottomPanelState state) {
    if (state is BottomMenuVisible) {
      return Container(
        height: AppValue.ACTION_BAR_HEIGHT,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 0.5,
              color: AppColor.GREY_LIGHTER_3,
            ),
            Expanded(
              child: product.isAttr == 0 && product.qty == 0
                  ? Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('product_detail.out_of_stock'),
                        style: AppStyle.DEFAULT_MEDIUM
                            .copyWith(color: AppColor.WHITE),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      color: AppColor.THIRD_COLOR,
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: onAddCartTap,
                            child: Container(
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('product_detail.add_cart'),
                                style: AppStyle.DEFAULT_MEDIUM,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              color: AppColor.WHITE,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: onBuyNowTap,
                            child: Container(
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)
                                        .translate('product_detail.order_now')
                                        ?.toUpperCase() ??
                                    "",
                                style: AppStyle.DEFAULT_MEDIUM
                                    .copyWith(color: AppColor.WHITE),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ],
        ),
      );
    } else if (state is BuyNowPanelOpened) {
      return WidgetSpacer();
    } else if (state is AddCartPanelOpened) {
      return WidgetSpacer();
    }
  }
}
