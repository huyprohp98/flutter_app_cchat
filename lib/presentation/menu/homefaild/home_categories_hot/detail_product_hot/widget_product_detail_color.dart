import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';

class WidgetProductDetailColor extends StatelessWidget {
  final List<ColorCatergoryProductHot> selectedColors;
  final List<ColorCatergoryProductHot> colors;
  final Function(int, List<ColorCatergoryProductHot>) onSelectedChanged;

  const WidgetProductDetailColor(
      {Key key,
      @required this.colors,
      @required this.selectedColors,
      @required this.onSelectedChanged})
      : super(key: key);

  final double size = 26.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(
          '${AppLocalizations.of(context).translate('product_detail.color')}: ',
          style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.THIRD_COLOR),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: WidgetRadioGroup<ColorCatergoryProductHot>(
            items: colors,
            selectedItem: selectedColors,
            maxSelected: 1,
            onSelectedChanged: onSelectedChanged,
            hintBuilder: (int index, ColorCatergoryProductHot item) {
              return Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    '${AppCommonUtils.firstUpperCase(item.name)}',
                    style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.THIRD_COLOR, fontSize: 13),
                  ));
            },
            radioAreaBuilder: (int index, ColorCatergoryProductHot item) {
              return Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    color: Color(
                        HexColor.getColorFromHex(colors[index].colorCode)),
                    border: Border.all(color: AppColor.GREY)),
              );
            },
            radioBuilder: (int index, ColorCatergoryProductHot item) {
              return Container(
                  width: size,
                  height: size,
                  color: Colors.transparent,
                  child: Image.asset('assets/images/img_rect_tick.png'));
            },
          ),
        ),
      ],
    );
  }
}
