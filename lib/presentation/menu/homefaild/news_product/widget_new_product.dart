import 'package:flutter_app_cchat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter_app_cchat/utils/handler/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/new_product_bloc.dart';
import 'bloc/new_product_state.dart';
import 'list_view_new_product.dart';



class WidgetNewProductList extends StatefulWidget {
  @override
  _WidgetNewProductListState createState() => _WidgetNewProductListState();
}

class _WidgetNewProductListState extends State<WidgetNewProductList> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewProductBloc, NewProductState>(
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
      child: BlocBuilder<NewProductBloc, NewProductState>(
        builder: (context, state) {
          return _buildContent(state);
        },
      ),
    );
  }

  Widget _buildContent(NewProductState state) {
    if(state?.post?.length != 0 && state.post != null){
      return Container(
        // color: Colors.grey,
        margin: EdgeInsets.only(top: 40),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListViewNewProduct(post: state.post[index]);
            // return Dismissible(
            //   key: Key(state.post[index].id.toString()),
            //   background: slideLeftBackground(),
            //   child: ListViewNewProduct(post: state.post[index]),
            //
            //   // ignore: missing_return
            //   confirmDismiss: (direction) async {
            //     if (direction == DismissDirection.endToStart) {
            //       // DialogDeleteUtils.createNotify(
            //       //     message: "Bạn có muốn xóa bài viết không?",
            //       //     negativeLabel: "Không",
            //       //     onPositiveTaps: () {
            //       //       BlocProvider.of<NewProductBloc>(context)
            //       //           .add(RemovePost(state.post[index].id));
            //       //       BlocProvider.of<NewProductBloc>(context).add(RefreshPost());
            //       //       // AppNavigator.navigateBack();
            //       //       AppNavigator.navigateBack();
            //       //     },
            //       //     negativeLabels: "Đồng ý",
            //       //     onPositiveTap: () {
            //       //       AppNavigator.navigateBack();
            //       //     },
            //       //     positiveLabel: null);
            //     } else {
            //       // TODO: Navigate to edit page;
            //     }
            //   },
            // );
          },
          itemCount: state.post.length,
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 20);
          },
          physics: ScrollPhysics(),
        ),
      );
    }else{
      return Container();
    }
    // return Container(
    //   // color: Colors.grey,
    //   margin: EdgeInsets.only(top: 40),
    //   child: ListView.separated(
    //     scrollDirection: Axis.horizontal,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       return ListViewNewProduct(post: state.post[index]);
    //       // return Dismissible(
    //       //   key: Key(state.post[index].id.toString()),
    //       //   background: slideLeftBackground(),
    //       //   child: ListViewNewProduct(post: state.post[index]),
    //       //
    //       //   // ignore: missing_return
    //       //   confirmDismiss: (direction) async {
    //       //     if (direction == DismissDirection.endToStart) {
    //       //       // DialogDeleteUtils.createNotify(
    //       //       //     message: "Bạn có muốn xóa bài viết không?",
    //       //       //     negativeLabel: "Không",
    //       //       //     onPositiveTaps: () {
    //       //       //       BlocProvider.of<NewProductBloc>(context)
    //       //       //           .add(RemovePost(state.post[index].id));
    //       //       //       BlocProvider.of<NewProductBloc>(context).add(RefreshPost());
    //       //       //       // AppNavigator.navigateBack();
    //       //       //       AppNavigator.navigateBack();
    //       //       //     },
    //       //       //     negativeLabels: "Đồng ý",
    //       //       //     onPositiveTap: () {
    //       //       //       AppNavigator.navigateBack();
    //       //       //     },
    //       //       //     positiveLabel: null);
    //       //     } else {
    //       //       // TODO: Navigate to edit page;
    //       //     }
    //       //   },
    //       // );
    //     },
    //     itemCount: state.post.length,
    //     separatorBuilder: (context, index) {
    //       return WidgetSpacer(width: 20);
    //     },
    //     physics: ScrollPhysics(),
    //   ),
    // );

  }
}

