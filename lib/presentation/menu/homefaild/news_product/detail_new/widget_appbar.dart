import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_menu.dart';
import 'package:flutter/material.dart';

class WidgetAppBar extends StatefulWidget {
  final String title;
  final Function openDrawer;
  final bool actionBack;
  final Color color;
  final bool canSearch;
  final bool heroSearch;
  final String tag;

  WidgetAppBar({
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
  _WidgetAppBarState createState() => _WidgetAppBarState();
}

class _WidgetAppBarState extends State<WidgetAppBar> {

  bool favorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color ?? Colors.white,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Stack(
        children: [
//          title != null
//              ? _buildTitle()
//              : WidgetLogo(
//                  widthPercent: 0.3,
//                ),
          widget.title != null
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
                    widget.actionBack == true
                        ? WidgetAppbarMenuBack()
                        : null
                  ],
                )),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      child: favorite ? Container(
                          width: 25,
                          height: 25,
                          child: Image.asset("assets/icons/ic_heart_red.png",)) :
                      Container(
                          width: 25,
                          height: 25,
                          child: Image.asset("assets/icons/ic_heart_black.png",)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 25,
                        height: 25,
                        child: Image.asset("assets/images/shopping.png",color: Colors.black,)),

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
    return widget.tag != null
        ? Hero(
            tag: widget.tag,
            child: Container(
              margin: const EdgeInsets.all(4.0),
              height: 56.25,
              child: Center(
                child: Text(
                  widget.title.toUpperCase(),

                ),
              ),
            ))
        : Container(
            margin: const EdgeInsets.all(4.0),
            height: 56.25,
            child: Center(
              child: Text(
                widget.title.toUpperCase(),

              ),
            ),
          );
  }
}
