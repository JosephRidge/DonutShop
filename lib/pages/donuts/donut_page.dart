
import 'package:donutshop/pages/donuts/donut_pager.dart';
import 'package:donutshop/utility/services.dart';
import 'package:donutshop/widgets/donut_filter_bar.dart';
import 'package:donutshop/widgets/donut_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonutPager(),
        DonutFilterBar(),
        Expanded(
          child: Consumer<DonutService>(
            builder: (context, donutService, child) {
              return DonutList(donuts: donutService.filteredDonuts);
            },
          )
        )
      ]
    );
  }
}
