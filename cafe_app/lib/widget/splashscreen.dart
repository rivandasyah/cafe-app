import 'package:cafe_app/utils/style.dart';
import 'package:cafe_app/widget/restaurant_list.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName = '/splashscreen';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterSeconds: RestaurantList(),
      seconds: 3,
      title: Text(
        'Cafe and Restaurant',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
      ),
      // image: Image.asset('images/image.png'),
      photoSize: 50,
      loaderColor: secondaryColor,
      backgroundColor: primaryColor,
    );
  }
}
