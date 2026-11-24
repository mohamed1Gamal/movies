import 'package:flutter/material.dart';
import 'package:movies/core/services/api_service.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/layout/layout_screens/movie_details_screen.dart';
import 'package:movies/modules/layout/service/api_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController? searchController;

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? search;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Column(
        children: [
          TextFormField(
            controller: searchController,
            onChanged: (value) {
              search = value;
              setState(() {});
              print(searchController?.text);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
            ),
          ),
          Expanded(
            child: (search =="" || search == null)? Image.asset("assets/layout/empty_search.png") : FutureBuilder(
              future: ApiManager.getSearch(search ?? ""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColor.yellow),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: theme.textTheme.titleMedium,
                    ),
                  );
                } else {
                  var searchMovies = snapshot.data;
                  print(searchMovies);
                  return searchMovies != null ? GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    itemCount: searchMovies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .9
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                print("details inside the search");
                                return MovieDetailsScreen(movieId: searchMovies[index].id??0);
                              },));
                            },
                            child: Container(
                              width: 180,
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(16),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    searchMovies?[index].largeCoverImage ?? "",
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
                                    color: AppColor.darkGray.withValues(alpha: 0.7),
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        searchMovies![index].rating.toString(),
                                      ),
                                      Icon(Icons.star, color: AppColor.yellow),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ) :Text("No movies with this search", style: theme.textTheme.bodyMedium,);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
