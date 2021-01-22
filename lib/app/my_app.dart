import 'package:flutter_app_cchat/app/simple_bloc_delegate.dart';
import 'package:flutter_app_cchat/app_config.dart';
import 'package:flutter_app_cchat/model/api/dio_provider.dart';
import 'package:flutter_app_cchat/model/local/barrel_local.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/router.dart';
import 'package:flutter_app_cchat/presentation/screen/barrel_screen.dart';
import 'package:flutter_app_cchat/presentation/screen/navigation/barrel_navigation.dart';
import 'package:flutter_app_cchat/presentation/screen/splash/sc_splash.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'auth_bloc/bloc.dart';
import 'constants/barrel_constants.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.WHITE,
      ),
    );
  }

  static Widget runWidget(String token) {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    Dio dio = DioProvider.instance(token);

    final UserRepository userRepository = UserRepository(dio: dio);
    final SessionRepository sessionRepository =
        SessionRepository(pref: LocalPref());

    final HomeRepository homeRepository = HomeRepository(dio: dio);

    final NotificationRepository notificationRepository =
        NotificationRepository(dio: dio);

    final AddressRepository addressRepository = AddressRepository(dio: dio);

    final CartRepository cartRepository = CartRepository(dio: dio);

    final PaymentRepository paymentRepository = PaymentRepository(dio: dio);

    final InvoiceRepository invoiceRepository = InvoiceRepository(dio: dio);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => userRepository,
        ),
        RepositoryProvider<SessionRepository>(
            create: (context) => sessionRepository),
        RepositoryProvider<HomeRepository>(
          create: (context) => homeRepository,
        ),
        RepositoryProvider<NotificationRepository>(
          create: (context) => notificationRepository,
        ),
        RepositoryProvider<AddressRepository>(
          create: (context) => addressRepository,
        ),
        RepositoryProvider<CartRepository>(
          create: (context) => cartRepository,
        ),
        RepositoryProvider<PaymentRepository>(
          create: (context) => paymentRepository,
        ),
        RepositoryProvider<InvoiceRepository>(
          create: (context) => invoiceRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
                userRepository: userRepository,
                sessionRepository: sessionRepository)
              ..add(AppInitialized()),
          ),
        ],
        child: MyApp(),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getKeyHash();
    final config = AppConfig.of(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColor.PRIMARY_COLOR,
        accentColor: AppColor.PRIMARY_COLOR,
        hoverColor: AppColor.PRIMARY_COLOR,
        fontFamily: 'Montserrat',
      ),
      navigatorObservers: [],
      supportedLocales: AppLanguage.getSupportLanguage().map((e) => e.locale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          debugPrint("*language locale is null!!!");
          return supportedLocales.first;
        }
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      locale: Locale('vi', 'VN'),
//        onGenerateRoute: Router.generateRoute,
      routes: BaseRouter.routes(context),
      home: SplashScreen(),
    );
  }

  static const platform = const MethodChannel('flutter.key_hash');

  getKeyHash() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('getKeyHash');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    print('---------------------------');
    print("Response: $response");
  }
}
