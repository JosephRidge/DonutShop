import 'package:donutshop/pages/donut_details/donut_details.dart';
import 'package:donutshop/pages/home/home.dart';
import 'package:donutshop/pages/splash/splash.dart';
import 'package:donutshop/utility/constants.dart' as constants;
import 'package:donutshop/utility/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DonutBottomBarSelectionService(),
        ),
        ChangeNotifierProvider(
          create: (_) => DonutService(),
        ),
         ChangeNotifierProvider(
          create: (_) => DonutShoppingCartService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        navigatorKey: constants.Utils.mainAppNav,
        routes: {
          '/': (context) => SplashPage(),
          '/main': (context) => DonutShopMain(),
          '/details': (context) => DonutShopDetails(),
        }
      )
    );
  }
}