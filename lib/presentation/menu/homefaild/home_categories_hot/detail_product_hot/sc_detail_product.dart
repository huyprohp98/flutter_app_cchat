import 'dart:async';

import 'package:flutter_app_cchat/app/auth_bloc/authentication_bloc.dart';
import 'package:flutter_app_cchat/app/auth_bloc/authentication_state.dart';
import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_button.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/bottom_panel/bloc/bottom_panel_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/bottom_panel/bloc/bottom_panel_event.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/bottom_panel/widget_bottom_bar_menu.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/buy_now_panel/bloc/buy_now_panel_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/buy_now_panel/bloc/buy_now_panel_event.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/buy_now_panel/bloc/buy_now_panel_state.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/buy_now_panel/widget_buy_now_panel.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/detail_product_hot/widget_appbar.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/detail_product_hot/widget_product_detail_color.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/related_product_bloc/related_product_hot_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/related_product_bloc/related_product_hot_event.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/related_product_bloc/related_product_hot_state.dart';

import 'package:flutter_app_cchat/utils/color/barrel_color.dart';
import 'package:flutter_app_cchat/utils/dialog/get_dialog_utils.dart';
import 'package:flutter_app_cchat/utils/handler/http_handler.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_categories_hot/detail_product_hot/widge_product_detail_infor.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'bloc/detail_product_hot_bloc.dart';
import 'bloc/detail_product_hot_event.dart';
import 'bloc/detail_product_hot_state.dart';

class DetailProductScreen extends StatefulWidget {
  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  PanelController _panelController = new PanelController();
  int _productId;
  bool favorite = false;
  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _productId = arguments['productId'];
        print('---productId---');
        print(_productId);
        BlocProvider.of<DetailProductBloc>(context)
            .add(LoadDetailProduct(_productId));
        BlocProvider.of<RelatedProductBloc>(context)
            .add(LoadRelatedProduct(_productId));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onArgument();
  }

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return BlocBuilder<DetailProductBloc, DetailProductHotState>(
      builder: (context, state) {
        if (state is DetailProductHotLoaded) {
          BlocProvider.of<BuyNowPanelBloc>(context)
              .add(AddProduct(product: state.detailProductHot));
          return Scaffold(
            body: Stack(
              children: [
                // ListView(children: [
                //   Container(
                //       height: MediaQuery.of(context).size.height - 100,
                //       width: MediaQuery.of(context).size.width,
                //       margin:
                //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       child: _buildListImage(state)),
                //   Container(
                //       height: MediaQuery.of(context).size.height / 2 + 188,
                //       width: MediaQuery.of(context).size.width,
                //       margin:
                //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       child: _buildInformation(state)),
                //   _buildRelatedProduct(),
                //   // Expanded(
                //   //   child: SlidingUpPanel(
                //   //     controller: _panelController,
                //   //     //
                //   //     panel: _buildPanel(),
                //   //     onPanelClosed: () {
                //   //       BlocProvider.of<BottomPanelBloc>(context)
                //   //           .add(ClosePanel());
                //   //       print('close');
                //   //     },
                //   //     maxHeight: Get.height * 2 / 3,
                //   //     minHeight: 0,
                //   //     backdropEnabled: true,
                //   //     renderPanelSheet: false,
                //   //   ),
                //   //   // child: SlidingUpPanel(
                //   //   //   controller: _panelController,
                //   //   //   backdropEnabled: true,
                //   //   //   panelSnapping: true,
                //   //   //   defaultPanelState:PanelState.CLOSED,
                //   //   //   panel: _buildPanel(),
                //   //   //   // panel: Text("huy"),
                //   //   //   maxHeight: Get.height * 2 / 3,
                //   //   //   minHeight: 0,
                //   //   //   renderPanelSheet: false,
                //   //   // ),
                //   //   // child: _buildPanel(),
                //   //
                //   // ),
                //
                // ]),
                Expanded(
                  child: SlidingUpPanel(
                    controller: _panelController,
                    body: RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<DetailProductBloc>(context)
                            .add(RefreshDetailProduct(_productId));
                        await Future.delayed(Duration(seconds: 2));
                        return true;
                      },
                      color: AppColor.PRIMARY_COLOR,
                      backgroundColor: AppColor.THIRD_COLOR,
                      child: ListView(
                          children: [
                        Container(
                            height: MediaQuery.of(context).size.height - 100,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: _buildListImage(state)),
                        Container(
                            height:
                                MediaQuery.of(context).size.height / 2 + 188,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: _buildInformation(state)),
                        _buildRelatedProduct(),
                      ]),
                    ),
                    panel: _buildPanel(),
                    onPanelClosed: () {
                      BlocProvider.of<BottomPanelBloc>(context)
                          .add(ClosePanel());
                      print('close');
                    },
                    maxHeight: Get.height * 2 / 3,
                    minHeight: 0,
                    backdropEnabled: true,
                    renderPanelSheet: false,
                  ),
                ),
                _buildAppBar(),
              ],
            ),
            // bottomNavigationBar: _buildbottomNavigationBar(),
            bottomNavigationBar: _buildBottomNavigationBar(),
          );
        } else if (state is DetailProductHotLoading) {
          return Center(
            child: WidgetCircleProgress(),
          );
        } else if (state is DetailProductHotNotLoaded) {
          return WidgetScreenError(
            status: state.status,
          );
        } else {
          return Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }

  _buildLogoAndCart() => WidgetAppBar(
        color: Colors.transparent,
        heroSearch: true,
        actionBack: true,
      );

  _buildAppBar() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: WidgetAppbar(
          left: [WidgetAppbarMenuBack()],
          right: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                  child: favorite
                      ? Container(
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            "assets/icons/ic_heart_red.png",
                          ))
                      : Container(
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            "assets/icons/ic_heart_black.png",
                          )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    width: 25,
                    height: 25,
                    child: Image.asset(
                      "assets/images/shopping.png",
                      color: Colors.black,
                    )),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      );

  _buildbottomNavigationBar() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: WidgetButton(
              onTap: () {},
              text: AppLocalizations.of(context)
                  .translate('product_detail.add_cart'),
              textColor: AppColor.PRIMARY,
              backgroundColor: AppColor.WHITE,
              isBorder: true,
            )),
        Expanded(
            flex: 1,
            child: WidgetButton(
              onTap: () {},
              text: AppLocalizations.of(context)
                  .translate('product_detail.order_now'),
              textColor: AppColor.WHITE,
              backgroundColor: AppColor.PRIMARY,
              isBorder: false,
            ))
      ],
    );
  }

  _buildBottomNavigationBar() {
    return BlocBuilder<BuyNowPanelBloc, BuyNowPanelState>(
      builder: (context, state) {
        if (state.product != null) {
          return WidgetBottomBarMenu(
            product: state.product,
            onAddCartTap: () {
              if (BlocProvider.of<AuthenticationBloc>(context).state
                  is! Authenticated) {
                GetDialogUtils.createNotify(
                    message: AppLocalizations.of(context)
                        .translate('authentication.message'),
                    positiveLabel: AppLocalizations.of(context)
                        .translate('authentication.positive'),
                    negativeLabel: AppLocalizations.of(context)
                        .translate('authentication.negative'),
                    onPositiveTap: () {
                      AppNavigator.navigateLogin();
                    });
              } else {
                if (state.isFormValid) {
                  print('isFormValid');
                  BlocProvider.of<BuyNowPanelBloc>(context)
                      .add(ProductDetailAddCart());
                } else {
                  GetDialogUtils.createNotify(
                      message: AppLocalizations.of(context)
                          .translate('product_detail.add_cart_failure'),
                      positiveLabel: AppLocalizations.of(context).translate(
                          'product_detail.add_cart_failure_positive'),
                      negativeLabel: AppLocalizations.of(context).translate(
                          'product_detail.add_cart_failure_negative'),
                      onPositiveTap: () {
                        AppNavigator.navigateBack();
                      });
                }
              }
            },
            onBuyNowTap: () {
              if (BlocProvider.of<AuthenticationBloc>(context).state
                  is! Authenticated) {
                GetDialogUtils.createNotify(
                    message: AppLocalizations.of(context)
                        .translate('authentication.message'),
                    positiveLabel: AppLocalizations.of(context)
                        .translate('authentication.positive'),
                    negativeLabel: AppLocalizations.of(context)
                        .translate('authentication.negative'),
                    onPositiveTap: () {
                      AppNavigator.navigateLogin();
                    });
              } else {
                BlocProvider.of<BottomPanelBloc>(context)
                    .add(OpenBuyNowPanel());
                _panelController.open();
              }
            },
          );
        } else {
          return WidgetCircleProgress();
        }
      },
    );
  }

  Widget _buildPanel() {
    return WidgetBuyNowPanel(
      onCloseTap: () {
        _panelController.close();
      },
    );
  }

  Widget _buildListImage(DetailProductHotState state) {
    if (state is DetailProductHotLoaded) {
      return state?.detailProductHot?.image?.length != 0 &&
              state?.detailProductHot?.image != null
          ? Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  state.detailProductHot.image[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: false,
              itemCount: state?.detailProductHot?.image?.length,
              scrollDirection: Axis.vertical,
              pagination: new SwiperPagination(
                alignment: Alignment.centerRight,
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.blue),
              ),
              control: new SwiperControl(iconNext: null, iconPrevious: null),
            )
          : Center(
              child: Text('Không có ảnh'),
            );
    } else if (state is DetailProductHotLoading) {
      return Center(
        child: WidgetCircleProgress(),
      );
    } else if (state is DetailProductHotNotLoaded) {
      return WidgetScreenError(
        status: state.status,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  // Widget _buildListImage(DetailProductHotState state) {
  //   if (state is DetailProductHotLoaded){
  //     return state?.detailProductHot?.image?.length !=0 && state?.detailProductHot?.image != null ?
  //     Swiper(
  //       itemBuilder: (BuildContext context, int index) {
  //         return Image.network(state.detailProductHot.image[index], fit: BoxFit.fill,);
  //       },
  //       autoplay: false,
  //       itemCount: state?.detailProductHot?.image?.length,
  //       scrollDirection: Axis.vertical,
  //       pagination: new SwiperPagination(),
  //       // control: new SwiperControl(
  //       //     iconNext: null,
  //       //     iconPrevious: null
  //       // ),
  //     ) :
  //     Center(child: Text('Không có ảnh'),);
  //   }else if (state is DetailProductHotLoading) {
  //     return Center(
  //       child: WidgetCircleProgress(),
  //     );
  //   } else if (state is DetailProductHotNotLoaded) {
  //     return WidgetScreenError(
  //       status: state.status,
  //     );
  //   } else {
  //     return Center(
  //       child: Text('Unknown state'),
  //     );
  //   }
  // }
  _buildInformation(DetailProductHotLoaded state) => WidgetProductDetailInfor(
        product: state.detailProductHot,
      );

  // Widget _buildDetail(DetailProductHotState state) {
  //   if (state is DetailProductHotLoaded && state.detailProductHot != null){
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(state.detailProductHot.name, style: AppStyle.DEFAULT_MEDIUM_BOLD,),
  //         SizedBox(height: 10,),
  //         Text(AppValue.APP_MONEY_FORMAT.format(state.detailProductHot.price), style: AppStyle.DEFAULT_MEDIUM.copyWith(color: Colors.red[600]),),
  //         SizedBox(height: 10,),
  //         Text('Mã sản phẩm: ${state.detailProductHot.productCode}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.grey),),
  //         SizedBox(height: 20,),
  //         Row(
  //           children: [
  //             Text('Chọn màu: ', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black),),
  //             Container(
  //               height: 25,
  //               width: MediaQuery.of(context).size.width*0.7,
  //               child: ListView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: state.detailProductHot.color.length,
  //                 itemBuilder: (context, index) {
  //                   // return _buildColorItem(state.detailProductHot.color[index].colorCode,
  //                   //     state.detailProductHot.color[index].name);
  //                   // return _buildRadioColor(state.detailProductHot.color[index].colorCode,state.detailProductHot.color[index].name);
  //                   return WidgetProductDetailColor(
  //                     colors: state.detailProductHot.color,
  //                     selectedColors: state.detailProductHot.color != null
  //                         ? List<ColorCatergoryProductHot>.of([state.detailProductHot.color[index]])
  //                         : List<ColorCatergoryProductHot>(),
  //                     // onSelectedChanged: (int, colors) {
  //                     //   BlocProvider.of<DetailProductBloc>(context)
  //                     //       .add(SelectColor(color: colors[0]));
  //                     // },
  //                   );
  //                 },
  //               ),
  //             )
  //           ],
  //         ),
  //         SizedBox(height: 20,),
  //         Row(
  //           children: [
  //             Text('Chọn size: ', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black),),
  //             Container(
  //               height: 25,
  //               width: MediaQuery.of(context).size.width*0.7,
  //               child: ListView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: state.detailProductHot.size.length,
  //                 itemBuilder: (context, index) {
  //                   return _buildSizeItem(state.detailProductHot.size[index].name);
  //                 },
  //               ),
  //             )
  //           ],
  //         ),
  //         Divider(
  //           thickness: 0.3,
  //           color: Colors.grey[400],
  //         ),
  //         Text('Chi tiết sản phẩm', style: AppStyle.DEFAULT_MEDIUM_BOLD,),
  //         SizedBox(height: 10,),
  //         HtmlWidget(state.detailProductHot.detailProduct),
  //         Divider(
  //           thickness: 0.3,
  //           color: Colors.grey[400],
  //         ),
  //       ],
  //     );
  //   }else if (state is DetailProductHotLoading) {
  //     return Center(
  //       child: WidgetCircleProgress(),
  //     );
  //   } else if (state is DetailProductHotNotLoaded) {
  //     return WidgetScreenError(
  //       status: state.status,
  //     );
  //   } else {
  //     return Center(
  //       child: Text('Unknown state'),
  //     );
  //   }
  // }

  Widget _buildColorItem(String colorCode, String nameColor) {
    Color color = HexColor(colorCode);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: color, border: Border.all(color: Colors.grey)),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            nameColor,
            style: AppStyle.DEFAULT_MEDIUM,
          ),
        ],
      ),
    );
  }
  // _buildColorItems(String colorCode, String nameColor) =>WidgetProductDetailColor(colors: [colorCode],);

  Widget _buildSizeItem(String nameSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.grey)),
            child: Center(
                child: Text(
              nameSize,
              style: AppStyle.DEFAULT_SMALL_BOLD,
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedProduct() {
    return BlocBuilder<RelatedProductBloc, RelatedProductHotState>(
        builder: (context, state) {
      if (state is RelatedProductHotLoaded && state.relatedProductHot != null) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: [
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  AppLocalizations.of(context)
                      .translate('product_detail.related_product')
                      .toUpperCase(),
                  style: AppStyle.DEFAULT_MEDIUM_BOLD
                      .copyWith(color: AppColor.BLACK),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6 - 30,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state?.relatedProductHot?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            AppNavigator.navigateDetailProductHot(
                                state.relatedProductHot[index].id);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Image.network(
                                  state.relatedProductHot[index].image[0],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.relatedProductHot[index].name,
                                style: AppStyle.DEFAULT_MEDIUM,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                AppValue.APP_MONEY_FORMAT.format(
                                    state.relatedProductHot[index].price),
                                style: AppStyle.DEFAULT_SMALL
                                    .copyWith(color: AppColor.RED),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      } else if (state is RelatedProductHotLoading) {
        return Center(
          child: WidgetCircleProgress(),
        );
      } else if (state is RelatedProductHotNotLoaded) {
        return WidgetScreenError(
          status: state.status,
        );
      } else {
        return Center(
          child: Text('Unknown state'),
        );
      }
    });
  }
}
