import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
    required this.header,
    required this.body,
    required this.image,
  });

  String image;
  String body;
  String header;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.blueGradient.withValues(alpha: 0),
                    AppColor.blueGradient,
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
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
                          header,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          body,
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w400,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.black,
                            backgroundColor: AppColor.yellow,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                            padding: EdgeInsetsGeometry.all(10),
                          ),

                          onPressed: () {

                          },
                          child: Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
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
  }
}
