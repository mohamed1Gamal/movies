import 'package:flutter/material.dart';
import 'package:movies/modules/layout/service/api_manager.dart';

import '../../../core/theme/app_color.dart';

class MovieDetailsScreen extends StatelessWidget {
  num movieId;
  MovieDetailsScreen({super.key, required this.movieId});

  // static String routeName = "movie_details_screen";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    print("Movie Details");
    return Scaffold(
      body: FutureBuilder(
        future: ApiManager.getMovieDetails(movieId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: AppColor.yellow,),);
          } else if(snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
          } else {
            var movieDetails = snapshot.data;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movieDetails?.largeCoverImage??""),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.black.withValues(alpha: 0.4),
                      AppColor.black.withValues(alpha: 1),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back)),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_outline),
                          ),
                        ],
                      ),
                      Expanded(child: Image.asset("assets/layout/play_now.png")),
                      Text(
                        movieDetails?.titleEnglish??"",
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15,),
                      Text(movieDetails?.year.toString()??"", style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.white.withValues(alpha: 0.7)),),
                      SizedBox(height: 8,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.red
                          ),
                          onPressed: () {}, child: Center(child: Text("Watch",style: theme.textTheme.bodyMedium,))),
                      SizedBox(height: 16,),
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22,vertical: 8),
                            decoration: BoxDecoration(
                                color: AppColor.darkGray,
                                borderRadius: BorderRadiusGeometry.circular(16)
                            ),
                            child: Row(
                              spacing: 22,
                              children: [
                                Icon(Icons.favorite,color: AppColor.yellow,size: 28,),
                                Text(movieDetails?.likeCount.toString()??"",style: theme.textTheme.bodyLarge,)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22,vertical: 8),
                            decoration: BoxDecoration(
                                color: AppColor.darkGray,
                                borderRadius: BorderRadiusGeometry.circular(16)
                            ),
                            child: Row(
                              spacing: 22,
                              children: [
                                Icon(Icons.access_time_filled_sharp,color: AppColor.yellow,size: 28,),
                                Text(movieDetails?.runtime.toString()??"",style: theme.textTheme.bodyLarge,)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22,vertical: 8),
                            decoration: BoxDecoration(
                                color: AppColor.darkGray,
                                borderRadius: BorderRadiusGeometry.circular(16)
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(Icons.star,color: AppColor.yellow,size: 28,),
                                Text(movieDetails?.rating.toString()??"",style: theme.textTheme.bodyLarge,)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      // Text("Screenshots"),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
