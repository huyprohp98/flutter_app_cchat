import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/detail_product_hot/widget_product_detail_color.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/detail_product_hot/widget_product_detail_size.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';

// import 'barrel_product_detail.dart';

class WidgetProductDetailInfor extends StatefulWidget {
  final CategoryProductHotData product;

  const WidgetProductDetailInfor({Key key, @required this.product})
      : super(key: key);

  @override
  _WidgetProductDetailInforState createState() =>
      _WidgetProductDetailInforState();
}

class _WidgetProductDetailInforState extends State<WidgetProductDetailInfor> {
  static const paddingHeight = 8.0;
  bool isReadDetail = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetSpacer(
            height: 6,
          ),
          widget.product.salePrice != 0
              ? Text(
                  '${widget.product.percentOff.floor()}% OFF',
                  style: AppStyle.APP_MEDIUM.copyWith(
                      color: AppColor.THIRD_COLOR, fontWeight: FontWeight.w800),
                )
              : SizedBox(),
          WidgetSpacer(
            height: widget.product.salePrice != 0 ? 5 : 0,
          ),
          Text(
            widget.product.name,
            style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(
              color: AppColor.PRIMARY,
            ),
            textAlign: TextAlign.center,
          ),
          WidgetSpacer(
            height: 5,
          ),
          Wrap(
            alignment: WrapAlignment.end,
            children: [
              widget.product.salePrice != 0
                  ? Text(
                      '${AppValue.APP_MONEY_FORMAT.format(widget.product.price)}',
                      style: AppStyle.PRODUCT_PRICE_DETAIL,
                    )
                  : Text(
                      '${AppValue.APP_MONEY_FORMAT.format(widget.product.price)}',
                      style: AppStyle.PRODUCT_SALE_PRICE_DETAIL,
                    ),
              WidgetSpacer(
                width: paddingHeight,
              ),
              widget.product.salePrice != 0
                  ? Text(
                      '${AppValue.APP_MONEY_FORMAT.format(widget.product.salePrice)}',
                      style: AppStyle.PRODUCT_SALE_PRICE_DETAIL,
                    )
                  : SizedBox(),
            ],
          ),
          WidgetSpacer(
            height: paddingHeight,
          ),
          Text(
            '${AppLocalizations.of(context).translate('product_detail.product_id')}: ${widget.product.productCode}',
            style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.GREY),
          ),
          WidgetSpacer(
            height: paddingHeight,
          ),
          widget.product.color != null ? _buildRadioColor() : SizedBox(),
          widget.product.size != null ? _buildRadioSize() : SizedBox(),
          WidgetSpacer(
            height: paddingHeight,
          ),
          _buildDivider(),
          WidgetSpacer(
            height: paddingHeight,
          ),
          Text(
            AppLocalizations.of(context).translate('product_detail.detail'),
            style:
            AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: AppColor.PRIMARY),
          ),
          WidgetSpacer(
            height: paddingHeight * 0.6,
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              _buildDetail(),
            ],
          )),
          WidgetSpacer(
            height: paddingHeight,
          ),
          _buildDivider(),
        ],
      ),
    );
  }

  _buildDivider() => Divider(
        color: AppColor.GREY,
        height: .2,
        thickness: 0.1,
      );

  _buildDetail() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HtmlWidget(widget.product.detailProduct),
          // // height: isReadDetail ? null : 550,
          // // child: HtmlWidget(
          // //   widget.product.detailProduct,
          // // ),
          // widget.product.detailProduct.length > 200
          //     ? GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       isReadDetail = !isReadDetail;
          //     });
          //   },
          //   child: Column(
          //     children: [
          //       Text(
          //         AppLocalizations.of(context)
          //             .translate('product_detail.read_more'),
          //         style: AppStyle.DEFAULT_SMALL_BOLD
          //             .copyWith(color: AppColor.PRIMARY),
          //       ),
          //       Container(
          //           width: 20,
          //           height: 20,
          //           child: Image.asset(
          //               'assets/images/img_chevron_bottom.png'))
          //     ],
          //   ),
          // )
          //     : SizedBox()
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //   child: Container(
          //     height: isReadDetail ? null : 50,
          //     HtmlWidget(widget.product.detailProduct),
          //   ),
          // ),
          // HtmlWidget(widget.product.detailProduct),
          // widget.product.detailProduct.length > 100
          //     ? Column(
          //   children: [
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Center(
          //       child: GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             isReadDetail = !isReadDetail;
          //           });
          //         },
          //         child: isReadDetail
          //             ? Text(
          //           "Thu gọn",
          //           style: TextStyle(color: Colors.blue),
          //         )
          //             : Text(
          //           "Xem thêm",
          //           style: TextStyle(color: Colors.blue),
          //         ),
          //       ),
          //     ),
          //   ],
          // )
          //     : SizedBox(),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 5),
          //   child: Container(
          //       height: isReadDetail ? null : 60,
          //       child: SingleChildScrollView(
          //         child: HtmlWidget(
          //           widget.product.detailProduct,
          //         ),
          //       )),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              height: isReadDetail ? null : 50,
              child: SingleChildScrollView(
                child: HtmlWidget(
                  widget.product.detailProduct,
                ),
              ),
            ),
          ),


          widget.product.detailProduct.length > 300
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isReadDetail = !isReadDetail;
                    });
                  },
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: isReadDetail
                                ? Text(
                                    "Thu gọn",
                                    style: TextStyle(color: Colors.blue),
                                  )
                                : Text(
                                    "Xem thêm",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                          ),
                          Container(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                'assets/images/img_chevron_bottom.png',
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }

  _buildRadioSize() => Column(
        children: [
          WidgetProductDetailSize(
            sizes: widget.product.size,
            selectedSizes: widget.product.size != null
                ? List<Sizes>.of([widget.product.size.first])
                : List<Sizes>(),
            onSelectedChanged: (int, sizes) {
              // BlocProvider.of<BuyNowPanelBloc>(context)
              //     .add(SelectSize(size: sizes[0]));
            },
          ),
          WidgetSpacer(
            height: paddingHeight,
          ),
        ],
      );

  _buildRadioColor() => Column(
        children: [
          WidgetProductDetailColor(
            colors: widget.product.color,
            selectedColors: widget.product.color != null
                ? List<ColorCatergoryProductHot>.of(
                    [widget.product.color.first])
                : List<ColorCatergoryProductHot>(),
            onSelectedChanged: (int, colors) {
              // BlocProvider.of<BuyNowPanelBloc>(context)
              //     .add(SelectColor(color: colors[0]));
            },
          ),
          WidgetSpacer(
            height: paddingHeight,
          ),
        ],
      );
}
