import 'package:flutter_app_cchat/model/entity/banner.dart' as BannerImage;
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app/constants/value/value.dart';

class WidgetBannerImage extends StatelessWidget {
  final BannerImage.Banners banner;

  WidgetBannerImage({Key key, @required this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: banner.image,
      imageBuilder: (context, image) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.fitHeight)),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      placeholder: (context, url) {
        return Center(child: WidgetCircleProgress());
      },
      errorWidget: (context, url, error) {
        return Center(child: WidgetCachedImageError());
      },
      fit: AppValue.IMAGE_FIT_MODE,
      filterQuality: FilterQuality.low,
    );
  }
}
