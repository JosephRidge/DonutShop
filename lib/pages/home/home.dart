

import 'package:donutshop/pages/donuts/donut_page.dart';
import 'package:donutshop/pages/shopping_cart/shopping_cart.dart';
import 'package:donutshop/utility/constants.dart' as constants;
import 'package:donutshop/widgets/donut_bottom_bar.dart';
import 'package:donutshop/widgets/donut_side_menu.dart';
import 'package:flutter/material.dart';

class DonutShopMain extends StatelessWidget {
  const DonutShopMain({super.key});


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DonutSideMenu()
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: constants.Utils.mainDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.network(constants.Utils.donutLogoRedText, width: 120)
      ),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key:constants.Utils.mainListNav,
              initialRoute: '/main',
              onGenerateRoute: (RouteSettings settings) {
                Widget page;
                switch(settings.name) {
                  case '/main':
                    page = DonutMainPage();
                    break;
                  case '/favorites':
                    page = Center(child: Text('favorites'));
                    break;
                  case '/shoppingcart':
                    page = DonutShoppingCartPage();
                    break; 
                  default:
                    page = Center(child: Text('main'));
                    break;
                }

                return PageRouteBuilder(pageBuilder: (_, __, ___) => page,
                  transitionDuration: const Duration(seconds: 0)
                );
             }
             
           )
          ),
          DonutBottomBar()
        ]
      )
    );
  }
}
