import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/modules/authentication/screens/forget_password_screen.dart';
import 'package:movies/modules/authentication/screens/login_screen.dart';
import 'package:movies/modules/layout/layout_screens/home_screen.dart';
import 'package:movies/modules/layout/layout_screens/layout_screen.dart';
import 'package:movies/modules/layout/layout_screens/movie_details_screen.dart';
import 'package:movies/modules/layout/layout_screens/update_profile_screen.dart';
import 'package:movies/modules/on-boarding/screens/on_boarding_screen.dart';
import 'package:movies/modules/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'modules/authentication/screens/register_screen.dart';
import 'modules/on-boarding/screens/on_board_navigation_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        OnBoardNavigationScreen.routeName : (_) => OnBoardNavigationScreen(),
        OnBoardingScreen.routeName : (_) => OnBoardingScreen(),
        LoginScreen.routeName : (_) => LoginScreen(),
        RegisterScreen.routeName : (_) => RegisterScreen(),
        ForgetPasswordScreen.routeName : (_) => ForgetPasswordScreen(),
        LayoutScreen.routeName : (_) => LayoutScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        // UpdateProfileScreen.routeName : (_) => UpdateProfileScreen(currentAvatar: 5,)
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
