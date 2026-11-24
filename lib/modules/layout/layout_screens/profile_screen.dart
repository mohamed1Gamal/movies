import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/authentication/services/auth_service.dart';
import 'package:movies/modules/layout/layout_screens/movie_details_screen.dart';
import 'package:movies/modules/layout/layout_screens/update_profile_screen.dart';
import 'package:movies/modules/layout/service/api_manager.dart';

import '../../../core/widgets/avatar_widget.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentTab=0;
  late int currentAvatar = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = FirebaseAuth.instance.currentUser;
    // currentAvatar = UpdateProfileScreen.currentAvatar;
    // var user =
    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        child: Image.asset(AvatarWidget.avatars[currentAvatar]),
                        maxRadius: 59,
                      ),
                      Text(user!.displayName.toString()),
                    ],
                  ),
                  Column(
                    children: [
                      Text("12", style: theme.textTheme.titleLarge),
                      Text("Wish List", style: theme.textTheme.bodyLarge),
                    ],
                  ),
                  Column(
                    children: [
                      Text("10", style: theme.textTheme.titleLarge),
                      Text("History", style: theme.textTheme.bodyLarge),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return UpdateProfileScreen(currentAvatar: 4);
                        },));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Edit Profile"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.red,
                        foregroundColor: AppColor.white,
                      ),
                      onPressed: () {
                        print(currentAvatar);
                        setState(() {

                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Text("Exit", softWrap: false),
                            SizedBox(width: 8),
                            Icon(Icons.exit_to_app_sharp, size: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              DefaultTabController(
                length: 2,
                child: TabBar(
                  onTap: (value) {
                    currentTab = value;
                    setState(() {
                      print(currentTab);
                    });
                  },
                  dividerColor: Colors.transparent,
                  indicatorColor: AppColor.yellow,
                  tabs: [
                    Column(
                      children: [
                        Icon(Icons.menu, color: AppColor.yellow, size: 28),
                        Text("Watch List", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.folder, color: AppColor.yellow, size: 28),
                        Text("History", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            // color: Colors.blue,
          ),
          (currentTab == 0)?Expanded(child: Image.asset("assets/layout/empty_search.png")):Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: .7,
              ),
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: ApiManager.getMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("Wainit ");
                      return Center(child: CircularProgressIndicator(
                        color: AppColor.white,),);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.data.toString(),
                        style: TextStyle(color: AppColor.white),);
                    } else {
                      var movies = snapshot.data;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return MovieDetailsScreen(movieId: movies[index].id??0);
                          },));
                        },
                        child: Container(
                          width: 234,
                          height: 351,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  movies?[index].largeCoverImage ?? ""),
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
                                  Text(movies![index].rating.toString(),style: TextStyle(fontSize: 18),),
                                  Icon(Icons.star, color: AppColor.yellow),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                  }
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// appBar: AppBar(
//
// foregroundColor: AppColor.white,
// backgroundColor: Colors.transparent,
// centerTitle: true,
//
// actions: [
// Icon(Icons.bookmark_outlined)
// ],
// ),
