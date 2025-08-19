

import 'package:donutshop/data/models/donut_page.dart';
import 'package:donutshop/utility/constants.dart' as constants;
import 'package:donutshop/widgets/page_view_indicator.dart';
import 'package:flutter/material.dart';

class DonutPager extends StatefulWidget {
  const DonutPager({super.key});

  @override
  State<DonutPager> createState() => _DonutPagerState();
}

class _DonutPagerState extends State<DonutPager> {

  List<DonutPage> pages = [
    DonutPage(imgUrl: constants.Utils.donutPromo1, logoImgUrl: constants.Utils.donutLogoWhiteText),
    DonutPage(imgUrl: constants.Utils.donutPromo2, logoImgUrl: constants.Utils.donutLogoWhiteText),
    DonutPage(imgUrl: constants.Utils.donutPromo3, logoImgUrl:constants.Utils.donutLogoRedText),
  ];

  int currentPage = 0;
  PageController? controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              controller: controller,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: List.generate(pages.length, (index) {
                DonutPage currentPage = pages[index];
                return Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), 
                        blurRadius: 10, 
                        offset: Offset(0.0, 5.0)
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage(currentPage.imgUrl!),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Image.network(currentPage.logoImgUrl!, width: 120)
                );
              })
            )
          ),
          PageViewIndicator(
            controller: controller, 
            numberOfPages: pages.length,
            currentPage: currentPage,
          )
        ],
      )
    );
  }
}