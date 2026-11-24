import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/authentication/screens/login_screen.dart';
import 'package:movies/modules/on-boarding/widgets/onboarding_widget.dart';

import '../../../core/widgets/onboarding_data.dart';

class OnBoardNavigationScreen extends StatefulWidget {

  static const String routeName = "onBoardNavigationScreen";
  const OnBoardNavigationScreen({super.key});

  @override
  State<OnBoardNavigationScreen> createState() =>
      _OnBoardNavigationScreenState();
}

// int index=0;
class _OnBoardNavigationScreenState extends State<OnBoardNavigationScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    controller.addListener(() {
      int nextIndex = controller.page?.toInt() ?? 0;
      if (nextIndex != currentIndex) {
        setState(() {
          currentIndex = nextIndex;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = OnboardingData.boardingData;
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: item.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item[index].imgPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                item[index].color.withValues(alpha: 0),
                                item[index].color,
                              ],
                              begin: AlignmentGeometry.topCenter,
                              end: AlignmentGeometry.bottomCenter,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColor.black,
                                  borderRadius: BorderRadiusGeometry.only(
                                    topRight: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                  ),
                                ),
                                padding: EdgeInsetsGeometry.all(16),
                                child: Column(
                                  children: [
                                    Text(
                                      item[index].header,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyLarge
                                    ),
                                    SizedBox(height: 24),
                                    Text(
                                      item[index].body ?? "",
                                      style: theme.textTheme.bodyMedium
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsetsGeometry.only(left: 16, right: 16),
            color: AppColor.black,
            child: Column(
              children: [
                ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   foregroundColor: AppColor.black,
                  //   backgroundColor: AppColor.yellow,
                  //   elevation: 0,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadiusGeometry.circular(15),
                  //   ),
                  //   padding: EdgeInsetsGeometry.all(10),
                  // ),

                  onPressed: () {
                    if (currentIndex == item.length - 1) {
                      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                    } else {
                      controller.animateToPage(
                        currentIndex + 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      (currentIndex != item.length - 1) ? "Next" : "Finish",
                      // style: TextStyle(
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.w600,
                      // ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                (currentIndex != 0 && currentIndex != item.length - 1)
                    ? ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        //   foregroundColor: AppColor.yellow,
                        //   backgroundColor: AppColor.black,
                        //   side: BorderSide(color: AppColor.yellow),
                        //   elevation: 0,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadiusGeometry.circular(15),
                        //   ),
                        //   padding: EdgeInsetsGeometry.all(10),
                        // ),

                        onPressed: () {
                          controller.animateToPage(
                            currentIndex - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceIn,
                          );
                        },
                        child: Center(
                          child: Text(
                            "Back",
                            // style: TextStyle(
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.w600,
                            // ),
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );

    // int index=0;
    // return Scaffold(
    //   // backgroundColor: AppColor.black,
    //   body: Column(
    //     children: [
    //       Expanded(
    //         child: Column(
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                     image: AssetImage(item[index].imgPath),
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     gradient: LinearGradient(
    //                       colors: [
    //                         AppColor.blueGradient.withValues(alpha: 0),
    //                         AppColor.blueGradient,
    //                       ],
    //                       begin: AlignmentGeometry.topCenter,
    //                       end: AlignmentGeometry.bottomCenter,
    //                     ),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: [
    //                       Container(
    //                         decoration: BoxDecoration(
    //                           color: AppColor.black,
    //                           borderRadius: BorderRadiusGeometry.only(
    //                             topRight: Radius.circular(40),
    //                             topLeft: Radius.circular(40),
    //                           ),
    //                         ),
    //                         padding: EdgeInsetsGeometry.all(16),
    //                         child: Column(
    //                           children: [
    //                             Text(
    //                               item[index].header,
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                 fontSize: 24,
    //                                 fontWeight: FontWeight.w700,
    //                                 color: AppColor.white,
    //                               ),
    //                             ),
    //                             SizedBox(height: 24),
    //                             Text(
    //                               item[index].body??"",
    //                               style: TextStyle(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w400,
    //                                 color: AppColor.white,
    //                               ),
    //                             ),
    //                             SizedBox(height: 24),
    //                               (index !=item.length-1) ? ElevatedButton(
    //                               style: ElevatedButton.styleFrom(
    //                                 foregroundColor: AppColor.black,
    //                                 backgroundColor: AppColor.yellow,
    //
    //                                 elevation: 0,
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadiusGeometry.circular(15),
    //                                 ),
    //                                 padding: EdgeInsetsGeometry.all(10),
    //                               ),
    //
    //                               onPressed: () {
    //                                 index++;
    //                                 print(index);
    //                                 setState(() {
    //
    //                                 });
    //                               },
    //                               child: Center(
    //                                 child: Text(
    //                                   "Next",
    //                                   style: TextStyle(
    //                                     fontSize: 20,
    //                                     fontWeight: FontWeight.w600,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ) : ElevatedButton(
    //                                 style: ElevatedButton.styleFrom(
    //                                   foregroundColor: AppColor.black,
    //                                   backgroundColor: AppColor.yellow,
    //
    //                                   elevation: 0,
    //                                   shape: RoundedRectangleBorder(
    //                                     borderRadius: BorderRadiusGeometry.circular(15),
    //                                   ),
    //                                   padding: EdgeInsetsGeometry.all(10),
    //                                 ),
    //
    //                                 onPressed: () {
    //                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    //                                     return LoginScreen();
    //                                   },));
    //                                 },
    //                                 child: Center(
    //                                   child: Text(
    //                                     "Finish",
    //                                     style: TextStyle(
    //                                       fontSize: 20,
    //                                       fontWeight: FontWeight.w600,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ) ,
    //                             SizedBox(height: 16),
    //                               if(index > 0 && index < item.length-1) ElevatedButton(
    //                               style: ElevatedButton.styleFrom(
    //                                 foregroundColor: AppColor.yellow,
    //                                 backgroundColor: AppColor.black,
    //                                 side: BorderSide(color: AppColor.yellow),
    //                                 elevation: 0,
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadiusGeometry.circular(15),
    //                                 ),
    //                                 padding: EdgeInsetsGeometry.all(10),
    //                               ),
    //
    //                               onPressed: () {
    //                                 index--;
    //
    //                                 setState(() {
    //
    //                                 });
    //                               },
    //                               child: Center(
    //                                 child: Text(
    //                                   "Back",
    //                                   style: TextStyle(
    //                                     fontSize: 20,
    //                                     fontWeight: FontWeight.w600,
    //                                   ),
    //                                 ) ,
    //                               ),
    //                             ) ,
    //                             SizedBox(height: 16),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //
    //       ),
    //
    //     ],
    //   )
    // );
  }
}
