import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_main.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_grid.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/category_product/bloc/post_category_product_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/category_product/bloc/post_category_product_event.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/category_product/bloc/post_category_product_state.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_bloc/home_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/home_bloc/home_state.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_app_cchat/utils/handler/http_handler.dart';

import 'bloc/category_primary_bloc.dart';
import 'bloc/category_primary_event.dart';
import 'bloc/category_primary_state.dart';

class CategoryPrimaryScreen extends StatefulWidget {
  @override
  _CategoryPrimaryScreenState createState() => _CategoryPrimaryScreenState();
}

class _CategoryPrimaryScreenState extends State<CategoryPrimaryScreen> {
  Category _category;
  ColorCatergoryProductHot _color;
  Sizes _size;
  double _priceBegin = AppValue.PRODUCT_FILTER_PRICE_BEGIN;
  double _priceEnd = AppValue.PRODUCT_FILTER_PRICE_END;

  ItemScrollController _primaryScrollController = ItemScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  _onRefresh() async {
    BlocProvider.of<CategoryPrimaryBloc>(context).add(RefreshCategoryPrimary(
        _category, _size, _color, _priceBegin, _priceEnd));
  }

  _onLoadMore() async {
    BlocProvider.of<CategoryPrimaryBloc>(context).add(
        LoadCategoryPrimary(_category, _size, _color, _priceBegin, _priceEnd));
  }

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _category = arguments['category'];
        print("_______________");
        print(_category);

        BlocProvider.of<CategoryPrimaryBloc>(context).add(LoadCategoryPrimary(
            _category, _size, _color, _priceBegin, _priceEnd));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onArgument();
    BlocProvider.of<PostCategoryProductBloc>(context).add(LoadCategoryProduct());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<PostCategoryProductBloc, PostCategoryProductState>(
      listener: (context, state) async {
        if (state.isLoading) {
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isSuccess) {
          await HttpHandler.resolve(status: state.status);
          print("_____________");
          print(state.status);
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
          print(state.status);
        }
      },
      child: BlocBuilder<PostCategoryProductBloc, PostCategoryProductState>(
        builder: (context, state) {
          return Scaffold(
            key: _drawerKey,
            backgroundColor: Colors.white,
            // endDrawer: WidgetProductFilter(
            //   size: _size,
            //   color: _color,
            //   priceBegin: _priceBegin,
            //   priceEnd: _priceEnd,
            //   onSizeTap: (size) {
            //     if (_size != size) {
            //       setState(() {
            //         _size = size;
            //       });
            //     } else {
            //       setState(() {
            //         _size = null;
            //       });
            //     }
            //   },
            //   onColorTap: (color) {
            //     if (_color != color) {
            //       setState(() {
            //         _color = color;
            //       });
            //     } else {
            //       setState(() {
            //         _color = null;
            //       });
            //     }
            //   },
            //   onSliderChange: (value) {
            //     setState(() {
            //       _priceBegin = value.start;
            //       _priceEnd = value.end;
            //     });
            //   },
            //   onCompleteTap: () {
            //     BlocProvider.of<CategoryPrimaryBloc>(context).add(
            //         FilterCategoryPrimary(
            //             _category, _size, _color, _priceBegin, _priceEnd));
            //     Get.back();
            //   },
            // ),
            body: Container(
              child: Column(
                children: [
                  _buildAppbar(),
                  _buildPrimaryCategory(state),
                  Expanded(child: _buildContent())
                ],
              ),
            ),
          );
        },
      ),
    ));
    return SafeArea(
        child: BlocBuilder<PostCategoryProductBloc, PostCategoryProductState>(
      builder: (context, state) {
        return Scaffold(
          key: _drawerKey,
          backgroundColor: Colors.white,
          // endDrawer: WidgetProductFilter(
          //   size: _size,
          //   color: _color,
          //   priceBegin: _priceBegin,
          //   priceEnd: _priceEnd,
          //   onSizeTap: (size) {
          //     if (_size != size) {
          //       setState(() {
          //         _size = size;
          //       });
          //     } else {
          //       setState(() {
          //         _size = null;
          //       });
          //     }
          //   },
          //   onColorTap: (color) {
          //     if (_color != color) {
          //       setState(() {
          //         _color = color;
          //       });
          //     } else {
          //       setState(() {
          //         _color = null;
          //       });
          //     }
          //   },
          //   onSliderChange: (value) {
          //     setState(() {
          //       _priceBegin = value.start;
          //       _priceEnd = value.end;
          //     });
          //   },
          //   onCompleteTap: () {
          //     BlocProvider.of<CategoryPrimaryBloc>(context).add(
          //         FilterCategoryPrimary(
          //             _category, _size, _color, _priceBegin, _priceEnd));
          //     Get.back();
          //   },
          // ),
          body: Container(
            child: Column(
              children: [
                _buildAppbar(),
                _buildPrimaryCategory(state),
                Expanded(child: _buildContent())
              ],
            ),
          ),
        );

        //   if (state.isSuccess) {
      //     return Scaffold(
      //       key: _drawerKey,
      //       backgroundColor: Colors.white,
      //       // endDrawer: WidgetProductFilter(
      //       //   size: _size,
      //       //   color: _color,
      //       //   priceBegin: _priceBegin,
      //       //   priceEnd: _priceEnd,
      //       //   onSizeTap: (size) {
      //       //     if (_size != size) {
      //       //       setState(() {
      //       //         _size = size;
      //       //       });
      //       //     } else {
      //       //       setState(() {
      //       //         _size = null;
      //       //       });
      //       //     }
      //       //   },
      //       //   onColorTap: (color) {
      //       //     if (_color != color) {
      //       //       setState(() {
      //       //         _color = color;
      //       //       });
      //       //     } else {
      //       //       setState(() {
      //       //         _color = null;
      //       //       });
      //       //     }
      //       //   },
      //       //   onSliderChange: (value) {
      //       //     setState(() {
      //       //       _priceBegin = value.start;
      //       //       _priceEnd = value.end;
      //       //     });
      //       //   },
      //       //   onCompleteTap: () {
      //       //     BlocProvider.of<CategoryPrimaryBloc>(context).add(
      //       //         FilterCategoryPrimary(
      //       //             _category, _size, _color, _priceBegin, _priceEnd));
      //       //     Get.back();
      //       //   },
      //       // ),
      //       body: Container(
      //         child: Column(
      //           children: [
      //             _buildAppbar(),
      //             _buildPrimaryCategory(state),
      //             Expanded(child: _buildContent())
      //           ],
      //         ),
      //       ),
      //     );
      //   } else if (state.isLoading) {
      //     return Center(
      //       child: WidgetCircleProgress(),
      //     );
      //   } else if (state.isFailure) {
      //     return WidgetScreenError(
      //       status: state.status,
      //     );
      //   } else {
      //     return Center(
      //       child: Text('Unknown state'),
      //     );
      //   }
      },
    )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _drawerKey,
  //     backgroundColor: Colors.white,
  //     body: Container(
  //       child: Column(
  //         children: [
  //           _buildAppbar(),
  //           // _buildPrimaryCategory(state),
  //           // _buildPrimaryCategory(state),
  //           Expanded(child: _buildContent())
  //         ],
  //       ),
  //     ),
  //   );
  //   // return SafeArea(
  //   //   child: Container(
  //   //     child: Column(
  //   //       children: [
  //   //         _buildAppbar(),
  //   //         // _buildPrimaryCategory(state),
  //   //         Expanded(child: _buildContent())
  //   //       ],
  //   //     ),
  //   //   ),
  //   //   // child: Scaffold(
  //   //   //   key: _drawerKey,
  //   //   //   backgroundColor: Colors.white,
  //   //   //   endDrawer: WidgetProductFilter(
  //   //   //     size: _size,
  //   //   //     color: _color,
  //   //   //     priceBegin: _priceBegin,
  //   //   //     priceEnd: _priceEnd,
  //   //   //     onSizeTap: (size) {
  //   //   //       if (_size != size) {
  //   //   //         setState(() {
  //   //   //           _size = size;
  //   //   //         });
  //   //   //       } else {
  //   //   //         setState(() {
  //   //   //           _size = null;
  //   //   //         });
  //   //   //       }
  //   //   //     },
  //   //   //     onColorTap: (color) {
  //   //   //       if (_color != color) {
  //   //   //         setState(() {
  //   //   //           _color = color;
  //   //   //         });
  //   //   //       } else {
  //   //   //         setState(() {
  //   //   //           _color = null;
  //   //   //         });
  //   //   //       }
  //   //   //     },
  //   //   //     onSliderChange: (value) {
  //   //   //       setState(() {
  //   //   //         _priceBegin = value.start;
  //   //   //         _priceEnd = value.end;
  //   //   //       });
  //   //   //     },
  //   //   //     onCompleteTap: () {
  //   //   //       BlocProvider.of<CategoryPrimaryBloc>(context).add(
  //   //   //           FilterCategoryPrimary(
  //   //   //               _category, _size, _color, _priceBegin, _priceEnd));
  //   //   //       Get.back();
  //   //   //     },
  //   //   //   ),
  //   //   //   body: Container(
  //   //   //     child: Column(
  //   //   //       children: [
  //   //   //         _buildAppbar(),
  //   //   //         // _buildPrimaryCategory(state),
  //   //   //         Expanded(child: _buildContent())
  //   //   //       ],
  //   //   //     ),
  //   //   //   ),
  //   //   // ),
  //   // );
  // }



  Widget _buildContent() {
    return BlocListener<CategoryPrimaryBloc, CategoryPrimaryState>(
      listener: (context, state) {
        if (state is CategoryPrimaryLoaded) {
          // if (state.hasReachedMax) {
          //   _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        },
      child: BlocBuilder<CategoryPrimaryBloc, CategoryPrimaryState>(
          builder: (context, state) {
        if (state is CategoryPrimaryLoaded) {
          return Column(
            children: [
              // _buildSecondaryCategory(state),
              Expanded(child: _buildProduct(state))
            ],
          );
        } else if (state is CategoryPrimaryLoading) {
          return Center(
            child: WidgetCircleProgress(),
          );
        } else if (state is CategoryPrimaryNotLoaded) {
          return Center(
            child: Text('${state.error}'),
          );
        } else {
          return Center(
            child: Text('Unknown state'),
          );
        }
      }),
    );
  }

  static final corner = 10.0;
  static final noCorner = corner / 2;
  static final paddingEven = EdgeInsets.only(
      left: corner, right: noCorner, top: noCorner, bottom: noCorner);
  static final paddingOdd = EdgeInsets.only(
      left: noCorner, right: corner, top: noCorner, bottom: noCorner);

  Widget _buildProduct(CategoryPrimaryLoaded state) {
    return Container(
      child: WidgetRefresher(
          refreshController: _refreshController,
          scrollDirection: Axis.vertical,
          onLoading: _onLoadMore,
          onRefresh: _onRefresh,
          child: WidgetWrapBuilder.build(
              itemBuilder: _itemBuilder, data: state.products ?? [])),
    );
  }

  Widget _itemBuilder(list, context, index) {
    if (list == null)
      return WidgetProductGrid(
        empty: true,
      );
    return Container(
      child: Padding(
        padding: index % 2 == 0 ? paddingEven : paddingOdd,
        child: WidgetProductGrid(
          product: list[index],
          full: (index + 1) % 3 == 0,
        ),
      ),
    );
  }
  //
  // Widget _buildSecondaryCategory(CategoryPrimaryLoaded state) {
  //   if (state.category.child != null) {
  //     print(state.category);
  //     if (state.category.child.isNotEmpty) {
  //       return Stack(
  //         children: [
  //           Positioned.fill(
  //             child: Align(
  //               alignment: Alignment.bottomCenter,
  //               child: _buildDotLine(),
  //             ),
  //           ),
  //           Container(
  //               height: AppValue.ACTION_BAR_HEIGHT,
  //               child: ListView.separated(
  //                 scrollDirection: Axis.horizontal,
  //                 itemBuilder: (context, index) {
  //                   // return WidgetTabBar(
  //                   //   category: state.category.child[index],
  //                   //   onTap: (Category category) {
  //                   //     AppNavigator.navigateCategorySecondary(
  //                   //         state.category.child[index]);
  //                   //   },
  //                   //   style: AppStyle.DEFAULT_SMALL_BOLD
  //                   //       .copyWith(color: AppColor.PRIMARY),
  //                   // );
  //                 },
  //                 separatorBuilder: (context, index) {
  //                   return WidgetSpacer(width: 0);
  //                 },
  //                 physics: BouncingScrollPhysics(),
  //                 itemCount: state.category.child.length,
  //               )),
  //         ],
  //       );
  //     }
  //   }
  //   return SizedBox();
  // }
  //
  Widget _buildPrimaryCategory(PostCategoryProductState state) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildDotLine(),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  height: AppValue.ACTION_BAR_HEIGHT,
                  child: ScrollablePositionedList.builder(
                    initialScrollIndex: state.post
                        .indexOf(_category) !=
                        -1
                        ? state.post.indexOf(_category)
                        : 0,
                    itemScrollController: _primaryScrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return WidgetTabBar(
                        category: state.post[index],
                        onTap: (Category category) {
                          setState(() {
                            _category = category;
                          });
                          BlocProvider.of<CategoryPrimaryBloc>(context).add(
                              ChangeCategoryPrimary(_category, _size, _color,
                                  _priceBegin, _priceEnd));

                          _primaryScrollController.scrollTo(
                              index: index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        style: AppStyle.DEFAULT_MEDIUM,
                        isChoose: _category ==
                            state.post[index],
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: state.post.length,
                  )),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: AppValue.ACTION_BAR_HEIGHT,
              height: AppValue.ACTION_BAR_HEIGHT,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: AppColor.GREY_LIGHTER_3, spreadRadius: .2, blurRadius: 20)
                ],
              ),
              child: Container(
                width: AppValue.ACTION_BAR_HEIGHT * 0.85,
                height: AppValue.ACTION_BAR_HEIGHT * 0.85,
                child: WidgetAppbarMenu(
                  icon: Image.asset('assets/images/img_filter.png'),
                  onTap: () {
                    _drawerKey.currentState.openEndDrawer();
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildDotLine() => DottedBorder(
        padding: const EdgeInsets.only(),
        strokeWidth: 0.5,
        color: AppColor.GREY,
        child: Container(
          height: 0.1,
          width: double.maxFinite,
        ),
      );

  Widget _buildAppbar() => WidgetAppBarMain(
        canSearch: false,
        actionBack: () {
          Navigator.pop(context);
        },
        title:
            '${AppLocalizations.of(context).translate('category_primary.title')} ${_category?.name ?? ""}',
      );
}
