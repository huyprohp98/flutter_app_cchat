// import 'package:cchat/app/constants/barrel_constants.dart';
// import 'package:cchat/model/entity/barrel_entity.dart';
// import 'package:cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:cchat/utils/utils.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class WidgetPromotionItem extends StatelessWidget {
//   final Promotion promotion;
//   final Function onTap;
//
//   const WidgetPromotionItem(
//       {Key key, @required this.promotion, @required this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 150,
//         padding: EdgeInsets.symmetric(vertical: 10),
//         child: Container(
//           decoration: BoxDecoration(
//               color: AppColor.GREY_LIGHTER_3,
//               borderRadius: BorderRadius.circular(10)),
//           child: DottedBorder(
//             borderType: BorderType.RRect,
//             radius: Radius.circular(10),
//             strokeWidth: 1,
//             color: AppColor.THIRD_COLOR,
//             dashPattern: [3],
//             child: Padding(
//               padding: const EdgeInsets.all(5),
//               child: Row(
//                 children: [
//                   FractionallySizedBox(
//                     heightFactor: 0.8,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         AspectRatio(
//                             aspectRatio: 1,
//                             child: Image.asset(
//                                 'assets/images/promotion_value_png.png')),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               AppLocalizations.of(context)
//                                   .translate('cart.promotion_sale_off'),
//                               style: AppStyle.DEFAULT_MEDIUM
//                                   .copyWith(color: AppColor.WHITE),
//                             ),
//                             Text(
//                               '${promotion.percentOff} %',
//                               style: AppStyle.DEFAULT_VERY_LARGE_BOLD
//                                   .copyWith(color: AppColor.WHITE),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   WidgetSpacer(
//                     width: 10,
//                   ),
//                   Expanded(
//                     flex: 7,
//                     child: Container(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${AppLocalizations.of(context).translate('cart.promotion_require_point')} ${AppValue.APP_MONEY_FORMAT.format(promotion.invoiceTotal)}',
//                                   style: AppStyle.DEFAULT_MEDIUM,
//                                 ),
//                                 Text(
//                                   '${AppLocalizations.of(context).translate('cart.promotion_max_sale')} ${AppValue.APP_MONEY_FORMAT.format(promotion.maxSale)}',
//                                   style: AppStyle.DEFAULT_MEDIUM,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text(
//                             '${AppValue.APP_DATE_FORMAT_ONLY_DATE.format(DateTime.parse(promotion.startDate))} ${AppLocalizations.of(context).translate('cart.to')} ${AppValue.APP_DATE_FORMAT_ONLY_DATE.format(DateTime.parse(promotion.endDate))}',
//                             style: AppStyle.DEFAULT_SMALL.copyWith(
//                                 color: AppColor.GREY,
//                                 fontStyle: FontStyle.italic),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
