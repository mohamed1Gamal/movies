import 'dart:ui';

import 'package:movies/core/theme/app_color.dart';

class OnboardingData {
  String imgPath;
  String header;
  String? body;
  Color color;

  OnboardingData({
    required this.header,
    this.body,
    required this.imgPath,
    required this.color
  });

  static List<OnboardingData> boardingData = [
    OnboardingData(header: "Discover Movies", body: "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.", imgPath: "assets/onBoarding/avengers.png",color: AppColor.blueGradient),
    OnboardingData(header: "Explore All Genres", body: "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.", imgPath: "assets/onBoarding/oppenheimer.png",color: AppColor.darkRedGradient),
    OnboardingData(header: "Create Watchlists", body: "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.", imgPath: "assets/onBoarding/bad-boys.png",color: AppColor.violetGradient),
    OnboardingData(header: "Rate, Review, and Learn", body: "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.", imgPath: "assets/onBoarding/dr.strange.png",color: AppColor.redGradient),
    OnboardingData(header: "Start Watching Now", imgPath: "assets/onBoarding/1917.png",color: AppColor.grayGradient),
  ];
}
