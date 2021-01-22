import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/news_product/detail_new/sc_detail_new.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/news_product/sc_new_product.dart';
import 'package:flutter_app_cchat/presentation/menu/homefaild/sc_home.dart';
import 'package:flutter_app_cchat/presentation/menu/new/sc_new.dart';
import 'package:flutter_app_cchat/presentation/menu/sc_home.dart';
import 'package:flutter_app_cchat/presentation/menu/sc_information.dart';
import 'package:flutter_app_cchat/presentation/menu/sc_person.dart';
import 'package:flutter_app_cchat/presentation/menu/sc_store.dart';
import 'package:flutter_app_cchat/presentation/menu/voucher/voucher_sc.dart';
import 'package:flutter_app_cchat/presentation/screen/drawer/app_drawer.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/new/sc_voucher.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/sc_home.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/sc_information.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/sc_person.dart';
// import 'package:flutter_app_cchat/presentation/screen/menu/sc_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/presentation/screen/login/login.dart';

class TabNavigatorRoutes {
//  static const String root = '/';
  static const String home = '/home';
  static const String store = '/store';
  static const String information = '/info';
  static const String news = '/news';
  static const String account = '/news';
  static const String product = '/product';
  static const String notification = '/notification';
}

class NavigationScreen extends StatefulWidget {
  NavigationScreen();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<FABBottomNavItem> _navMenus = List();
  PageController _pageController;
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool appbar = true;

  // CAN CO DU LIEU ;;

  // _NavigationScreenState({this.type});

  @override
  void initState() {
    _pageController =
        new PageController(initialPage: _selectedIndex, keepPage: true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navMenus = _getTab();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        // appBar: appbar
        //     ? AppBar(
        //         backgroundColor: Colors.blue,
        //         actions: <IconButton>[
        //           IconButton(
        //             icon: Icon(Icons.search),
        //             onPressed: () {
        //               // AppNavigator.navigateSearch();
        //             },
        //           ),
        //         ],
        //       )
        //     : null,
        bottomNavigationBar: WidgetFABBottomNav(
          backgroundColor: Colors.black,
          selectedIndex: _selectedIndex,
          onTabSelected: (index) async {
            goToPage(page: index);
          },
          items: _navMenus,
          selectedColor: Colors.white,
          color: Colors.grey,
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width/2.5,
          child: AppDrawer(
            drawer: _drawerKey,
            // menu: goToPage,
            // notification: goToPage,
            // account: goToPage,
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (newPage) {
            setState(() {
              this._selectedIndex = newPage;
            });
          },
          children: [
            NewProductScreen(),
            NewProductScreen(),
            HomeScreen(
              drawer: _drawerKey,
            ),
            // BannerPages(
            //   drawer: _drawerKey,
            // ),
            WallPage(),
            LoginScreen(),
          ],
        ));
  }

  List<FABBottomNavItem> _getTab() {
    return List.from([
      FABBottomNavItem.asset(
          route: TabNavigatorRoutes.product,
          tabItem: TabItem.product,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/nav_bag.png',
           // text: "Home"
      ),
      FABBottomNavItem.asset(
          route: TabNavigatorRoutes.store,
          tabItem: TabItem.store,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/nav_news.png',
          // text: "Store"
      ),
      FABBottomNavItem.asset(
          route: TabNavigatorRoutes.information,
          tabItem: TabItem.info,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/images/ic_nav_home.png',
          // text: "Information"
      ),
      FABBottomNavItem.asset(
          route: TabNavigatorRoutes.news,
          tabItem: TabItem.news,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/nav_user.png',
          // text: "News"
      ),
      FABBottomNavItem.asset(
          route: TabNavigatorRoutes.account,
          tabItem: TabItem.news,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/nav_bell.png',
          // text: "Person"
      ),
    ]);
  }

  void goToPage({int page, int id = 0}) {
    if (page != _selectedIndex) {
      setState(() {
        this._selectedIndex = page;
      });
      _pageController.jumpToPage(_selectedIndex);
    }
    setState(() {
      this._selectedIndex = page;
    });
    _pageController.jumpToPage(_selectedIndex);
  }
}
