import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/core/widgets/genre_widget.dart';
import 'package:movies/modules/layout/layout_screens/layout_screen.dart';
import 'package:movies/modules/layout/service/api_manager.dart';

import 'movie_details_screen.dart';

class BrowseScreen extends StatefulWidget {
  BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  var source = GenreWidget.genres;

  int selectedGenre =0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Column(
        children: [
          DefaultTabController(
            length: source.length,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (value) {
                selectedGenre = value;
                print(selectedGenre);
                setState(() {

                });
              },
              automaticIndicatorColorAdjustment: false,
              labelStyle: theme.textTheme.labelMedium?.copyWith(
                color: AppColor.black,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 5),
              unselectedLabelColor: AppColor.yellow,
              indicator: BoxDecoration(
                color: AppColor.yellow,
                borderRadius: BorderRadiusGeometry.circular(16),
                border: Border.all(color: AppColor.yellow, width: 8),
              ),
              tabs: source.map((e) {
                return Tab(
                  height: max(0, 60),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      // color: AppColor.yellow,
                      borderRadius: BorderRadiusGeometry.circular(16),
                      border: Border.all(color: AppColor.yellow, width: 2),
                    ),
                    child: Text(e, overflow: TextOverflow.visible),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16,),
          FutureBuilder(future: ApiManager.getSearch(source[selectedGenre]), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: AppColor.yellow,),);
            } else if(snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()),);
            } else {
              var genreMovies = snapshot.data;
              return Expanded(
                child: GridView.builder(
                  itemCount: genreMovies?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 20,childAspectRatio: .8),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          print("details inside the search");
                          return MovieDetailsScreen(movieId: genreMovies[index].id??0);
                        },));
                      },
                      child: Container(
                        // width: 190,
                        // height: 400,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadiusGeometry.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(
                              genreMovies?[index].largeCoverImage ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentGeometry.topLeft,
                          child: Container(
                            margin: EdgeInsetsGeometry.all(10),
                            padding: EdgeInsetsGeometry.all(6),
                            decoration: BoxDecoration(
                              color: AppColor.darkGray,
                              borderRadius: BorderRadiusGeometry.circular(
                                10,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  genreMovies![index].rating.toString(),
                                ),
                                Icon(Icons.star, color: AppColor.yellow),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },)
        ],
      ),
    );
  }
}
