import 'package:donutshop/data/models/donut.dart';
import 'package:donutshop/data/models/donut_filter_bar_item.dart';
import 'package:donutshop/utility/constants.dart' as constants;
import 'package:flutter/material.dart';

class DonutBottomBarSelectionService extends ChangeNotifier {

  String? tabSelection = 'main';

  void setTabSelection(String selection) {
    constants.Utils.mainListNav.currentState!.pushReplacementNamed('/$selection');
    tabSelection = selection;
    notifyListeners();
  }
}


class DonutShoppingCartService extends ChangeNotifier {

  List<DonutModel> cartDonuts = [];

  void addToCart(DonutModel donut) {
    cartDonuts.add(donut);
    notifyListeners();
  }

  void removeFromCart(DonutModel donut) {
    cartDonuts.removeWhere((d) => d.name == donut.name);
    notifyListeners();
  }

  void clearCart() {
    cartDonuts.clear();
    notifyListeners();
  }

  double getTotal() {
    double cartTotal = 0.0;
    cartDonuts.forEach((element) {
      cartTotal += element.price!;
    });

    return cartTotal;
  }

  bool isDonutInCart(DonutModel donut) {
    return cartDonuts.any((d) => d.name == donut.name);
  }
}

 
class DonutService extends ChangeNotifier {

  List<DonutFilterBarItem> filterBarItems = [
    DonutFilterBarItem(id: 'classic', label: 'Classic'),
    DonutFilterBarItem(id: 'sprinkled', label: 'Sprinkled'),
    DonutFilterBarItem(id: 'stuffed', label: 'Stuffed'),
  ];

  String? selectedDonutType;
  List<DonutModel> filteredDonuts = [];


  late DonutModel selectedDonut;

  DonutModel getSelecteDonut() {
    return selectedDonut;
  }

  void onDonutSelected(DonutModel donut) {
    selectedDonut = donut;
    constants.Utils.mainAppNav.currentState!.pushNamed('/details');
  }

  DonutService() {
    selectedDonutType = filterBarItems.first.id;
    filteredDonutsByType(selectedDonutType!);
  }

  void filteredDonutsByType(String type) {
    selectedDonutType = type;
    filteredDonuts = constants.Utils.donuts.where(
      (d) => d.type == selectedDonutType).toList();

    notifyListeners();
  }
}
