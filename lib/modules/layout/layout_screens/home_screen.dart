import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/layout/layout_screens/movie_details_screen.dart';
import 'package:movies/modules/layout/service/api_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static String routeName = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentPage = 1.0;
  late PageController _pageController;
  int pageLength = 5;
  late final Future<dynamic> _moviesFuture = ApiManager.getMovies();
  @override
  void initState() {
    _pageController = PageController(initialPage: 1, viewportFraction: 0.5);

    _pageController.addListener(() {
      currentPage = _pageController.page!;
      setState(() {

      });
      super.initState();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _moviesFuture,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          print("looooooooooading");
          return Center(child: CircularProgressIndicator(color: AppColor.white,),);
        } else if (snapshot.hasError) {
          print("errrrrrrrrrrrrror");
          return Text(snapshot.data.toString(), style: TextStyle(color: AppColor.white),);
        } else {
          print("Mooooooooooovies");
          var movies = snapshot.data;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/onBoarding/1917.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.black.withValues(alpha: 0.8),
                    AppColor.black.withValues(alpha: 0.9),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset("assets/layout/available_now.png"),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 351,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: pageLength,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            double scale = max(
                              0.7,
                              1.0 - (currentPage - index).abs() * 0.2,
                            );
                            return Center(
                              child: TweenAnimationBuilder(
                                duration: Duration(milliseconds: 150),
                                tween: Tween<double>(begin: scale, end: scale),
                                builder: (context, double value, child) {
                                  return Transform.scale(scale: value, child: child);
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return MovieDetailsScreen(movieId: movies?[index].id);
                                    },));
                                  },
                                  child: Container(
                                    width: 234,
                                    height: 351,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(movies?[index].largeCoverImage??""),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentGeometry.topLeft,
                                      child: Container(
                                        margin: EdgeInsetsGeometry.all(10),
                                        padding: EdgeInsetsGeometry.all(6),
                                        decoration: BoxDecoration(
                                          color: AppColor.darkGray.withValues(alpha: 0.7),
                                          borderRadius: BorderRadiusGeometry.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(movies![index].rating.toString()),
                                            Icon(Icons.star, color: AppColor.yellow),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 22),
                      Image.asset("assets/layout/watch_now.png"),
                      SizedBox(
                        height: 300,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(width: 10,),
                          itemCount: pageLength,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  print("details inside the search");
                                  return MovieDetailsScreen(movieId: movies[index].id??0);
                                },));
                              },
                              child: Container(
                                width: 146,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusGeometry.circular(16),
                                  image: DecorationImage(
                                    image: NetworkImage(movies?[index].largeCoverImage??""),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentGeometry.topLeft,
                                  child: Container(
                                    margin: EdgeInsetsGeometry.all(10),
                                    padding: EdgeInsetsGeometry.all(6),
                                    decoration: BoxDecoration(
                                      color: AppColor.darkGray.withValues(alpha: 0.7),
                                      borderRadius: BorderRadiusGeometry.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(movies![index].rating.toString()),
                                        Icon(Icons.star, color: AppColor.yellow),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
