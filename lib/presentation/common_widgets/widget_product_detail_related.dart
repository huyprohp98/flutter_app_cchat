import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_grid.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';

class WidgetProductDetailRelated extends StatelessWidget {
  final List<CategoryProductHotData> relatedProducts;
  final List<ProductMix> mixProducts;
  final String title;

  const WidgetProductDetailRelated(
      {Key key,
      @required this.relatedProducts,
      @required this.title,
      this.mixProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${title?.toUpperCase()}',
            style:
                AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: AppColor.PRIMARY),
          ),
          WidgetSpacer(
            height: 10,
          ),
          Container(
            height: AppCommonUtils.calculateHeightProduct(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return WidgetProductGrid(
                    product: relatedProducts != null
                        ? relatedProducts[index]
                        : (mixProducts != null
                            ? mixProducts[index].toProduct()
                            : null));
              },
              itemCount: (relatedProducts ?? mixProducts)?.length ?? 0,
              separatorBuilder: (context, index) {
                return WidgetSpacer(width: 8);
              },
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
