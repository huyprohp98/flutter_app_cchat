import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_menu.dart';

class WidgetAppBarMain extends StatelessWidget {
  final String title;
  final Function openDrawer;
  final Function actionBack;
  final Color color;
  final bool canSearch;
  final bool heroSearch;
  final String tag;

  WidgetAppBarMain({
    Key key,
    this.canSearch = true,
    this.color,
    this.heroSearch = false,
    this.actionBack,
    this.title,
    this.tag,
    this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.white,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Stack(
        children: [
//          title != null
//              ? _buildTitle()
//              : WidgetLogo(
//                  widthPercent: 0.3,
//                ),
          title != null
              ? _buildTitle()
              : Container(
                  margin: const EdgeInsets.all(4.0),
                  height: 56.25,
                ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    actionBack != null
                        ? Container(
                            width: 36,
                            height: 36,
                            child: WidgetAppbarMenu(
                              icon: Image.asset('assets/icons/ic_back.png'),
                              onTap: actionBack,
                            ))
                        : Container(
                            width: 45,
                            height: 45,
                            child: WidgetAppbarMenu(
                              icon: Image.asset('assets/icons/ic_menu.png'),
                              onTap: openDrawer,
                            ))
                  ],
                )),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        width: 25,
                        height: 25,
                        child: Image.asset("assets/images/shopping.png",color: Colors.black,)),
                    canSearch
                        ? (heroSearch
                            ? Hero(
                                tag: "search",
                                child: Container(
                                    width: 45,
                                    height: 45,
                                    child: WidgetAppbarMenu(
                                      icon: Image.asset(
                                          'assets/images/img_search.png'),
                                      onTap: () {

                                      },
                                    )),
                              )
                            : Container(
                                width: 45,
                                height: 45,
                                child: WidgetAppbarMenu(
                                  icon: Image.asset(
                                      'assets/images/img_search.png'),
                                  onTap: () {
                                  },
                                )))
                        : SizedBox(),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return tag != null
        ? Hero(
            tag: tag,
            child: Container(
              margin: const EdgeInsets.all(4.0),
              height: 56.25,
              child: Center(
                child: Text(
                  title.toUpperCase(),

                ),
              ),
            ))
        : Container(
            margin: const EdgeInsets.all(4.0),
            height: 56.25,
            child: Center(
              child: Text(
                title.toUpperCase(),

              ),
            ),
          );
  }
}
