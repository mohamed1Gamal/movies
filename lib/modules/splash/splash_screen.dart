import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/layout/layout_screens/layout_screen.dart';
import 'package:movies/modules/on-boarding/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";

  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),() {
      bool isLogin = FirebaseAuth.instance.currentUser != null;
      if(isLogin) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LayoutScreen();
        },));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return OnBoardingScreen();
        },));
      }

    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/logo/logo.png")),
            Image.asset("assets/logo/branding_logo.png",width: screenSize.width*0.5,)
          ],
        ),
      ),
    );
  }
}
