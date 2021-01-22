import 'package:flutter_app_cchat/model/entity/banner.dart';
import 'package:flutter_app_cchat/model/entity/home_list_banner.dart';
import 'package:flutter_app_cchat/model/entity/list_voucher.dart';
import 'package:flutter_app_cchat/model/entity/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StatusListBanner extends StatelessWidget {
  final Banners post;
  StatusListBanner({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xfff5dcee),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Image.network(post?.image ?? ''),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 1,
                height: MediaQuery.of(context).size.height / 6,
                color: Colors.grey,
              ),

              Expanded(
                flex: 6,
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    children: [
                      Image.network('${post.type}'),
                      Text('${post.type}',style: TextStyle(fontSize: 12),),
                      // Text('${post.point}'),
                      // Text('${post.type}'),
                      // Text('${post.percentOff.toString()}'),
                      // Text('${post.salePrice}'),
                      // Text('${post.maxSalePrice}'),
                      // Text('${post.invoiceTotal}'),
                      // Text('${post.expiresAt}'),


                    ],
                  ),
                ),
              ),
            ],
          ),

          // Container(),

          // Expanded(
          //   flex: 2,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Container(
          //           height: 40,
          //           width: 40,
          //           child: CircleAvatar(
          //             backgroundImage: NetworkImage(
          //               post?.image ?? '',
          //             ),
          //           ),
          //         ),
          //         // ClipRRect(
          //         //   borderRadius: BorderRadius.circular(500),
          //         //   child: Image.network(
          //         //     post?.avatar ?? '',
          //         //     height: 50,
          //         //   ),
          //         // ),
          //         SizedBox(
          //           width: 15,
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(top: 5),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("${post?.name ?? ''}"),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Text(
          //                 "${post?.expiresAt ?? ''}",
          //                 style: TextStyle(color: Colors.grey),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Spacer(),
          //         Image.asset(
          //           'assets/images/ic_rank_familiar.png',
          //           height: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 5),
          //   child: Text("${post?.name ?? ''}"),
          // ),
          // Expanded(
          //   flex: 7,
          //   child: post?.image?.length == 1
          //       ? Image.network(
          //           "${post?.image?? ''}",
          //           height: 200,
          //           width: MediaQuery.of(context).size.width,
          //           fit: BoxFit.cover,
          //         )
          //       : Stack(
          //           alignment: Alignment.bottomRight,
          //           children: [
          //             GridView.builder(
          //                 shrinkWrap: true,
          //                 itemBuilder: (context, index) {
          //                   return Container(
          //                     child: Image.network(
          //                       post.image[index],
          //                     ),
          //                   );
          //                 },
          //                 gridDelegate:
          //                     SliverGridDelegateWithFixedCrossAxisCount(
          //                         crossAxisCount: 2, childAspectRatio: .9),
          //                 physics: NeverScrollableScrollPhysics(),
          //                 itemCount: post.image.length),
          //             Container(
          //               margin: EdgeInsets.only(bottom: 15),
          //               color: Colors.grey[300],
          //               child: Text(
          //                 '+' + post?.image?.length?.toString() ?? '0',
          //               ),
          //             )
          //           ],
          //         ),
          // ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
