
import 'package:donutshop/pages/home/home.dart';
import 'package:donutshop/utility/constants.dart' as constants;
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});


  @override 
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> 
  with SingleTickerProviderStateMixin {

  AnimationController? donutController;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();
    donutController = AnimationController(
      duration: const Duration(seconds:2), 
      vsync: this)..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 1)
    .animate(CurvedAnimation(parent: donutController!, curve: Curves.linear));
  }

  @override 
  void dispose() {
    donutController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DonutShopMain())
      );
    });

    return Scaffold(
      backgroundColor: constants.Utils.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: rotationAnimation!,
              child: Image.network(constants.Utils.donutLogoWhiteNoText, width: 100, height: 100),
            ),

            // Load a Lottie file from your assets
            // Lottie.asset('assets/lottie/olympic-athlete.json'),
            Image.network(constants.Utils.donutLogoWhiteText, width: 150, height: 150)
          ],
        ),
      )
    );
  }
}
