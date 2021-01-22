import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WidgetCachedImage extends StatelessWidget {
  WidgetCachedImage({this.url, this.color, this.fit});

  final String url;
  final Color color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) {
          return Center(child: WidgetCircleProgress());
        },
        errorWidget: (context, url, error) {
          return Center(child: WidgetCachedImageError());
        },
        color: color,
        fit: fit ?? AppValue.IMAGE_FIT_MODE,
        filterQuality: FilterQuality.low,
      ),
    );
  }
}
