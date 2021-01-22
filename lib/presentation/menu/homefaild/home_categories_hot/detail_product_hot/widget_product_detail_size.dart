import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';

class WidgetProductDetailSize extends StatelessWidget {
  final List<Sizes> selectedSizes;
  final List<Sizes> sizes;
  final Function(int, List<Sizes>) onSelectedChanged;

  const WidgetProductDetailSize(
      {Key key,
      @required this.sizes,
      @required this.selectedSizes,
      this.onSelectedChanged})
      : super(key: key);

  final double size = 26;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(
          '${AppLocalizations.of(context).translate('product_detail.size')}: ',
          style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.THIRD_COLOR),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: WidgetRadioGroup<Sizes>(
            items: sizes,
            selectedItem: selectedSizes,
            maxSelected: 1,
            onSelectedChanged: onSelectedChanged,
            radioAreaBuilder: (int index, Sizes item) {
              return Container(
                width: size,
                height: size,
                decoration:
                    BoxDecoration(border: Border.all(color: AppColor.GREY)),
                child: Center(
                  child: Text(
                    '${item.name}',
                    style: AppStyle.DEFAULT_SMALL_BOLD,
                  ),
                ),
              );
            },
            radioBuilder: (int index, Sizes item) {
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
