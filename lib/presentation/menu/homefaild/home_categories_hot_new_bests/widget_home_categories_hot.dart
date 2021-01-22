import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_categories_product.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/home_categorie_new_bests_bloc.dart';
import 'bloc/home_categorie_new_bests_event.dart';
import 'bloc/home_categorie_new_bests_state.dart';

class WidgetHomeCategorieNewBestHot extends StatefulWidget {
  @override
  _WidgetHomeCategorieNewBestHotState createState() =>
      _WidgetHomeCategorieNewBestHotState();
}

class _WidgetHomeCategorieNewBestHotState extends State<WidgetHomeCategorieNewBestHot> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCategorieNewBestBloc>(context)
        .add(LoadHomeCategoriesNewBestHot());
  }

  onRefresh(HomeCategoriesNewBestLoaded state) async {
    BlocProvider.of<HomeCategorieNewBestBloc>(context)
        .add(RefreshHomeCategoriesNewBestHot());
  }

  _onLoadMore(HomeCategoriesNewBestLoaded state) async {
    BlocProvider.of<HomeCategorieNewBestBloc>(context)
        .add(LoadHomeCategoriesNewBestHot());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCategorieNewBestBloc, HomeCategorieNewBestState>(
      listener: (context, state) {
        if (state is HomeCategoriesNewBestLoaded) {
          if (state.hasReachedMax) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
      },
      child: BlocBuilder<HomeCategorieNewBestBloc, HomeCategorieNewBestState>(
        builder: (context, state) {
          return Container(
            child: _buildContent(state),
          );
        },
      ),
    );
  }
  // Widget _buildContent(HomeCategorieNewBestState state) {
  //   if (state is HomeCategoriesNewBestLoaded) {
  //     return Container(
  //       // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       // width: MediaQuery.of(context).size.width,
  //       // height: MediaQuery.of(context).size.height,
  //       child: ListView(
  //         children: [
  //           Text('huy'),
  //           SizedBox(height: 30,),
  //           ListView.separated(
  //             scrollDirection: Axis.horizontal,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index) {
  //               // return _buildProduct(state: state.hotProducts[index]);
  //               return StatusListCategoryProductHot(post: state.hotProducts[index]
  //               );
  //             },
  //             itemCount: state.hotProducts.length,
  //             separatorBuilder: (context, index) {
  //               return WidgetSpacer(height: 10);
  //             },
  //             physics: ScrollPhysics(),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else if (state is HomeCategoriesNewBestLoading) {
  //     return Container(
  //       width: double.infinity,
  //       height: AppValue.PRODUCT_HORIZONTAL_HEIGHT,
  //       child: Center(
  //         child: WidgetCircleProgress(),
  //       ),
  //     );
  //   } else {
  //     return Center(
  //       child: Text('Unknown state'),
  //     );
  //   }
  // }
  Widget _buildContent(HomeCategorieNewBestState state) {
    if (state is HomeCategoriesNewBestLoaded) {
      return Container(
          child: WidgetCategoriesProduct(
        actionMore: () {
          // AppNavigator.navigateProductCollection(ProductCollectionType.HOT);
        },
        refreshController: _refreshController,
        categoryName:
            AppLocalizations.of(context).translate('home.hot_product'),
        products: state.hotProducts,
        onLoadMore: () => _onLoadMore(state),
        onRefresh: () => onRefresh(state),
      ));
    } else if (state is HomeCategoriesNewBestLoading) {
      return Container(
        width: double.infinity,
        height: AppValue.PRODUCT_HORIZONTAL_HEIGHT,
        child: Center(
          child: WidgetCircleProgress(),
        ),
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  // Widget _buildProduct(HomeCategorieNewBestState state, int index) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.5,
  //     // decoration: BoxDecoration(
  //     //   border: Border.all()
  //     // ),
  //     padding: EdgeInsets.all(10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           height: MediaQuery.of(context).size.height * 0.35,
  //           width: MediaQuery.of(context).size.width * 0.5,
  //           // child: Image.network(state.productAllData.listProduct[index].image[0], fit: BoxFit.fill,),
  //           child: Image.network(,fit: BoxFit.fill,),
  //
  //         ),
  //         SizedBox(height: 10,),
  //         // Text(state.productAllData.listProduct[index].name, style: AppStyle.DEFAULT_MEDIUM,),
  //         // SizedBox(height: 10,),
  //         // Text(AppValue.APP_MONEY_FORMAT.format(state.productAllData.listProduct[index].price), style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.RED),),
  //       ],
  //     ),
  //   );
  // }

}
