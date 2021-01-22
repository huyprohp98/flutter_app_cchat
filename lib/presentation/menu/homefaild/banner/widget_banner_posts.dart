import 'dart:async';

import 'package:flutter_app_cchat/presentation/common_widgets/widget_banner_image.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_banner_images_list.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/new/list_home_page_status.dart';
import 'package:flutter_app_cchat/utils/handler/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/post_banner_bloc.dart';
import 'bloc/post_banner_state.dart';
import 'list_banner_status.dart';

class WidgetPostListBannerItem extends StatefulWidget {
  @override
  _WidgetPostListBannerItemState createState() => _WidgetPostListBannerItemState();
}

class _WidgetPostListBannerItemState extends State<WidgetPostListBannerItem> {
  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBannerBloc, PostBannerState>(
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
      child: BlocBuilder<PostBannerBloc, PostBannerState>(
        builder: (context, state) {
          return _buildContent(state);
        },
      ),
    );
  }

  Widget _buildContent(PostBannerState state) {
    return state?.post!=null?Swiper(
      itemBuilder: (BuildContext context, int index) {
        return WidgetBannerImageList(
          banner: state.post[index],
        );
      },

      autoplay: true,
      itemCount: state.post.length,
      pagination: new SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: new DotSwiperPaginationBuilder(
            color: Colors.grey, activeColor: Colors.blue),
      ),
      control: new SwiperControl(
          iconNext: null,
          iconPrevious: null
      ),
    //  control: new SwiperControl(),
    ):Container();
  }

  Widget slideLeftBackground() {
    return Container(
      color: Color(0xff0066b3),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              'Xóa',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return SafeArea(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          offset += 5;
          time = 800 + offset;

          print(time);

          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey[300],
                child: ShimmerLayout(),
                period: Duration(milliseconds: time),
              ));
        },
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 280;
    double containerHeight = 15;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.75,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}

class ShimmerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 500,
        child: Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Colors.white,
          child: Image.asset("thecsguy.PNG"),
          period: Duration(seconds: 3),
        ),
      ),
    );
  }
}
