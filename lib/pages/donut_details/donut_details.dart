import 'package:donutshop/data/models/donut.dart';
import 'package:donutshop/utility/constants.dart' as constants;
import 'package:donutshop/utility/services.dart';
import 'package:donutshop/widgets/donut_shopping_badge_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutShopDetails extends StatefulWidget {
  const DonutShopDetails({super.key});

  @override
  State<DonutShopDetails> createState() => _DonutShopDetailsState();
}

class _DonutShopDetailsState extends State<DonutShopDetails>
    with SingleTickerProviderStateMixin {
  DonutModel? selectedDonut;
  AnimationController? controller;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DonutService donutService = Provider.of<DonutService>(
      context,
      listen: false,
    );
    selectedDonut = donutService.getSelecteDonut();

    /**
 * 
 * PAGE: 
 * - donut
 * - name, like, price
 * - description
 * - add to cart
 */
    double screenHeight = MediaQuery.of(context).size.height;

    var col = Column(
      children: [
        // donut
        Container(
          height: screenHeight * 0.5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -40,
                right: -120,
                child: Hero(
                  tag: selectedDonut!.name!,
                  child: RotationTransition(
                    turns: rotationAnimation!,
                    child: Image.network(
                      selectedDonut!.imgUrl!,
                      width: MediaQuery.of(context).size.width * 1.25,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // details
        Expanded(
          child: Container(
            // color: Colors.amberAccent,
            padding: EdgeInsets.all(20),
            height: screenHeight * 0.5,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${selectedDonut!.name!}',
                        style: TextStyle(
                          color: constants.Utils.mainDark,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    IconButton(
                      icon: Icon(Icons.favorite_outline),
                      color: constants.Utils.mainDark,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text('${selectedDonut!.description!}'),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: constants.Utils.mainDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '\$${selectedDonut!.price!.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Consumer<DonutShoppingCartService>(
                  builder: (context, cartService, child) {
                    if (!cartService.isDonutInCart(selectedDonut!)){
                      return GestureDetector(
                        onTap: () {
                          cartService?.addToCart(selectedDonut!);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: constants.Utils.mainDark.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: constants.Utils.mainDark,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Add To Cart',
                                style: TextStyle(
                                  color: constants.Utils.mainDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                     return Text("...");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: constants.Utils.mainDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          width: 120,
          child: Image.network(constants.Utils.donutLogoRedText),
        ),
        actions: [DonutShoppingCartBadge()],
      ),
      body: SizedBox(height: screenHeight, width: double.infinity, child: col),
      /*Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -40,
                  right: -120,
                  child: Hero(
                    tag: selectedDonut!.name!,
                    child: RotationTransition(
                      turns: rotationAnimation!,
                      child: Image.network(
                        selectedDonut!.imgUrl!,
                        width: MediaQuery.of(context).size.width * 1.25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${selectedDonut!.name!}',
                          style: TextStyle(
                            color: constants.Utils.mainDark,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(Icons.favorite_outline),
                        color: constants.Utils.mainDark,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: constants.Utils.mainDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '\$${selectedDonut!.price!.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('${selectedDonut!.description!}'),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: constants.Utils.mainDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: constants.Utils.mainDark,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Add To Cart',
                          style: TextStyle(color: constants.Utils.mainDark),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )*/
    );
  }
}
