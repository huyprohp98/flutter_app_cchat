import 'package:flutter_app_cchat/model/entity/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusListView extends StatelessWidget {
  final News post;
  StatusListView({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 320,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          post?.avatar ?? '',
                        ),
                      ),
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(500),
                    //   child: Image.network(
                    //     post?.avatar ?? '',
                    //     height: 50,
                    //   ),
                    // ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${post?.name ?? ''}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${post?.createdAt ?? ''}",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/images/ic_rank_familiar.png',
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text("${post?.content ?? ''}"),
            ),
            Expanded(
              flex: 7,
              child: post?.image?.length == 1
                  ? Image.network(
                      "${post?.image?.first ?? ''}",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )
                  : Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        GridView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Image.network(
                                  post.image[index],
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: .9),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: post.image.length),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          color: Colors.grey[300],
                          child: Text(
                            '+' + post?.image?.length?.toString() ?? '0',
                          ),
                        )
                      ],
                    ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 190),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    post.isLike == 1
                        ? Image.asset(
                            "assets/images/img_heart_actived.png",
                            height: 14,
                          )
                        : Image.asset(
                            "assets/images/img_heart_actived.png",
                            color: Colors.grey,
                            height: 14,
                          ),
                    Text("${post?.likeCount ?? ''}"),
                    Image.asset(
                      "assets/images/ic_rank_familiar.png",
                      height: 14,
                    ),
                    Text("${post?.commentCount ?? ''}"),
                    Image.asset(
                      "assets/images/img_payment_method_e_wallet.png",
                      height: 14,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
