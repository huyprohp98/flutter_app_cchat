import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_detail_quantity.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/detail_product_hot/widget_product_detail_color.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/detail_product_hot/widget_product_detail_size.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/buy_now_panel_bloc.dart';
import 'bloc/buy_now_panel_event.dart';
import 'bloc/buy_now_panel_state.dart';

class WidgetBuyNowPanel extends StatefulWidget {
  final Function onCloseTap;

  const WidgetBuyNowPanel({Key key, @required this.onCloseTap})
      : super(key: key);

  @override
  _WidgetBuyNowPanelState createState() => _WidgetBuyNowPanelState();
}

class _WidgetBuyNowPanelState extends State<WidgetBuyNowPanel> {
  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BuyNowPanelBloc, BuyNowPanelState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          await HttpHandler.resolve(status: state.status);
        }
        if (state.isSuccess) {
          // BlocProvider.of<CartBloc>(context).add(LoadCart());
          await HttpHandler.resolve(status: state.status);
          GetDialogUtils.createNotify(
              message: AppLocalizations.of(context)
                  .translate('product_detail.add_cart_success'),
              positiveLabel: AppLocalizations.of(context)
                  .translate('product_detail.add_cart_success_positive'),
              negativeLabel: AppLocalizations.of(context)
                  .translate('product_detail.add_cart_success_negative'),
              onPositiveTap: () {
                AppNavigator.navigateBack();
                // AppNavigator.navigateCart();
              });
        }

        if (state.isFailure) {
          print(state.status);
          await HttpHandler.resolve(status: state.status);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: BlocBuilder<BuyNowPanelBloc, BuyNowPanelState>(
            builder: (context, state) {
          if (state.product == null) {
            return Center(
              child: WidgetCircleProgress(),
            );
          } else {
            return _buildContent(state);
          }
        }),
      ),
    );
  }

  Widget _buildContent(BuyNowPanelState state) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: AspectRatio(
                      aspectRatio: AppValue.PRODUCT_IMAGE_RATIO,
                      child: WidgetCachedImage(
                        url: state.product.image[0],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.product.name,
                            style: AppStyle.DEFAULT_MEDIUM,
                          ),
                          WidgetSpacer(
                            height: 5,
                          ),
                          state.product.salePrice != 0
                              ? Text(
                                  '${AppValue.APP_MONEY_FORMAT.format(state.product.price)}',
                                  style: AppStyle.PRODUCT_PRICE.copyWith(
                                      fontSize: AppValue.FONT_SIZE_SMALL),
                                )
                              : Text(
                                  '${AppValue.APP_MONEY_FORMAT.format(state.product.price)}',
                                  style: AppStyle.PRODUCT_SALE_PRICE.copyWith(
                                      fontSize: AppValue.FONT_SIZE_MEDIUM),
                                ),
                          state.product.salePrice != 0
                              ? WidgetSpacer(
                                  height: 4,
                                )
                              : const SizedBox(),
                          state.product.salePrice != 0
                              ? Text(
                                  '${AppValue.APP_MONEY_FORMAT.format(state.product.salePrice)}',
                                  style: AppStyle.PRODUCT_SALE_PRICE.copyWith(
                                      fontSize: AppValue.FONT_SIZE_MEDIUM),
                                )
                              : SizedBox(),
                          WidgetSpacer(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: state.product.color != null
                        ? WidgetProductDetailColor(
                            colors: state.product.color,
                            selectedColors: state.color != null
                                ? List<ColorCatergoryProductHot>.of([state.color])
                                : List<ColorCatergoryProductHot>(),
                            onSelectedChanged: (int, colors) {
                              BlocProvider.of<BuyNowPanelBloc>(context)
                                  .add(SelectColor(color: colors[0]));
                            },
                          )
                        : const SizedBox(),
                  ),
                  _buildDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: state.product.size != null
                        ? WidgetProductDetailSize(
                            sizes: state.product.size,
                            selectedSizes: state.size != null
                                ? List<Sizes>.of([state.size])
                                : List<Sizes>(),
                            onSelectedChanged: (int, sizes) {
                              BlocProvider.of<BuyNowPanelBloc>(context)
                                  .add(SelectSize(size: sizes[0]));
                            },
                          )
                        : const SizedBox(),
                  ),
                  _buildDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: WidgetProductDetailQuantity(
                      onIncreaseTap: () {
                        BlocProvider.of<BuyNowPanelBloc>(context)
                            .add(IncreaseQuantity());
                      },
                      onDecreaseTap: () {
                        BlocProvider.of<BuyNowPanelBloc>(context)
                            .add(DecreaseQuantity());
                      },
                      quantity: state.quantity,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  _buildSubmitButton(state)
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: - 5,
          right: -5,
          child: GestureDetector(
            onTap: widget.onCloseTap,
            child: Container(
              width: 20,
              height: 20,
              child: Image.asset('assets/images/img_close_round.png'),
            ),
          ),
        )
      ],
    );
  }

  _buildDivider() => Divider(
        height: 1,
        thickness: 0.2,
        color: AppColor.GREY_LIGHTER_3,
      );

  _buildSubmitButton(BuyNowPanelState state) {
    return WidgetLoginButton(
      onTap: () {
        if (state.isFormValid) {
          BlocProvider.of<BuyNowPanelBloc>(context).add(ProductDetailAddCart());
        }
      },
      isEnable: state.isFormValid,
      text: AppLocalizations.of(context).translate('product_detail.buy_now').toUpperCase(),
    );
  }
}
