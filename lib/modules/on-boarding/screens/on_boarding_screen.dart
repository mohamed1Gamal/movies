import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/on-boarding/screens/on_board_navigation_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "onBoardingScreen";

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.black,
                image: DecorationImage(
                  image: AssetImage("assets/onBoarding/Movies_Group.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.4),
                      AppColor.black,
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsetsGeometry.all(16),
                      child: Column(
                        children: [
                          Text(
                            "Find Your Next\n Favorite Movie Here",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleLarge
                          ),
                          Text(
                            "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                            style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.white.withValues(alpha: 0.6)),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            // style: ElevatedButton.styleFrom(
                            //     foregroundColor: AppColor.black,
                            //     backgroundColor: AppColor.yellow,
                            //
                            //     elevation: 0,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadiusGeometry.circular(15),
                            //     ),
                            //     padding: EdgeInsetsGeometry.all(10)
                            // ),

                            onPressed: () {
                              Navigator.pushNamed(context, OnBoardNavigationScreen.routeName);
                            },
                            child: Center(
                              child: Text(
                                "Explore Now",
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
