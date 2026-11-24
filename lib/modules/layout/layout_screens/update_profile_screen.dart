import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/core/widgets/avatar_widget.dart';

import '../../authentication/screens/forget_password_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
   UpdateProfileScreen({super.key,required this.currentAvatar});
  static String routeName = "updateProfileScreen";
    int currentAvatar;
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.currentAvatar);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        iconTheme: IconThemeData(color: AppColor.yellow),

        centerTitle: true,
        title: Text(
          "Pick Avatar",
          style: theme.textTheme.labelSmall?.copyWith(color: AppColor.yellow),
        ),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 75,
                child: Image.asset(AvatarWidget.avatars[widget.currentAvatar]),
              ),
              SizedBox(height: 35),
              TextFormField(
                obscureText: true,
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  // hintText: user!.displayName.toString(),
                  prefix: Text(
                    user!.displayName.toString(),
                    style: TextStyle(color: AppColor.white),
                  ),
                  prefixIconColor: AppColor.white,
                  enabled: true,
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off_rounded),
                  suffixIconColor: AppColor.white,
                ),
                autofocus: true,
              ),
              SizedBox(height: 16),
              Align(
                alignment: AlignmentGeometry.centerStart,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                  },
                  child: Text(
                    "Forget Password ?",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Expanded(child: SizedBox(height: 40)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsetsGeometry.all(16),
                  backgroundColor: AppColor.red,
                  foregroundColor: AppColor.white,
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "Delete Account",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsetsGeometry.all(16),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: AppColor.darkGray,
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          itemCount: 9,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: .9
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                widget.currentAvatar = index;
                                print(index);
                                setState(() {
          
                                });
                              },
                              child: Container(
                                width: 86,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: AppColor.yellow),
                                    borderRadius: BorderRadiusGeometry.circular(20),
                                  ),
                                  child: Image.asset(AvatarWidget.avatars[index],width: 20,)),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Center(
                  child: Text(
                    "Update Data",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
