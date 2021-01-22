import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_grid.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_refresher_no_more.dart';
import 'package:flutter_app_cchat/utils/common/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WidgetCategoriesProduct extends StatefulWidget {
  final String categoryName;
  final List<CategoryProductHotData> products;
  final RefreshController refreshController;
  final Function onLoadMore;
  final Function onRefresh;
  final Function actionMore;
  final Color color;
  final String tag;

  WidgetCategoriesProduct({
    Key key,
    this.categoryName,
    this.products,
    this.onLoadMore,
    this.onRefresh,
    this.tag,
    this.color,
    this.actionMore,
    this.refreshController,
  }) : super(key: key);

  @override
  _WidgetCategoriesProductState createState() =>
      _WidgetCategoriesProductState();
}

class _WidgetCategoriesProductState extends State<WidgetCategoriesProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color ?? Colors.white,
      child: Column(
        children: [
          // WidgetCategoriesMore(
          //   tag: widget.tag,
          //   actionMore: widget.actionMore,
          //   name: widget.categoryName,
          // ),
          Container(
              margin: const EdgeInsets.all(15),
              height: AppCommonUtils.calculateHeightProduct(),
              child: WidgetRefresher(
                refreshController: widget.refreshController,
                onLoading: widget.onLoadMore,
                onRefresh: widget.onRefresh,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return WidgetProductGrid(
                      product: widget.products[index],
                    );
                  },
//                  itemExtent: 100.0,
                  itemCount: widget.products.length,
                  separatorBuilder: (context, index) {
                    return WidgetSpacer(width: 12);
                  },
                  physics: BouncingScrollPhysics(),
                ),
              )),
        ],
      ),
    );
  }
}
