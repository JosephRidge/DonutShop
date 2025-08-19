import 'package:donutshop/utility/constants.dart' as   constants;
import 'package:donutshop/utility/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutBottomBar extends StatelessWidget {
  const DonutBottomBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Consumer<DonutBottomBarSelectionService>(
        builder: (context, bottomBarSelectionService, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.trip_origin, 
                  color: bottomBarSelectionService.tabSelection == 'main' ? 
                              constants.Utils.mainDark :   constants.Utils.mainColor
                ),
                onPressed: () {
                  bottomBarSelectionService.setTabSelection('main');
                }
              ),
              IconButton(
                icon: Icon(Icons.favorite, 
                color: bottomBarSelectionService.tabSelection == 'favorites' ? 
                              constants.Utils.mainDark :   constants.Utils.mainColor
                ),
                onPressed: () {
                  bottomBarSelectionService.setTabSelection('favorites');
                }
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart,
                color: bottomBarSelectionService.tabSelection == 'shoppingcart' ? 
                            constants.Utils.mainDark :   constants.Utils.mainColor
                ),
                onPressed: () {
                  bottomBarSelectionService.setTabSelection('shoppingcart');
                }
              )
            ]
          );
      })
    );
  }
}