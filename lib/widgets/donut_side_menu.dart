import 'package:donutshop/utility/constants.dart' as constants;
import 'package:flutter/material.dart';

class DonutSideMenu extends StatelessWidget {
  const DonutSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.Utils.mainDark,
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Image.network(
              constants.Utils.donutLogoWhiteNoText,
              width: 100,
            ),
          ),
          Image.network(constants.Utils.donutLogoWhiteText, width: 150),
        ],
      ),
    );
  }
}
