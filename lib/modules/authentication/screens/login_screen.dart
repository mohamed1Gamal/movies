import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/authentication/manager/auth_provider.dart';
import 'package:movies/modules/authentication/screens/forget_password_screen.dart';
import 'package:movies/modules/authentication/screens/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "loginScreen";

  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        // backgroundColor: AppColor.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Image.asset("assets/logo/logo.png"),
                          SizedBox(height: 40),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter a valid name";
                              } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]",
                              ).hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                            style: theme.textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Icons.mail_outline_sharp),
                              // label: Text("Email", style: theme.textTheme.labelSmall),
                            ),
                          ),
                          SizedBox(height: 22),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            style: theme.textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.visibility_off_rounded),
                              suffixIconColor: AppColor.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Align(
                            alignment: AlignmentGeometry.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ForgetPasswordScreen.routeName,
                                );
                              },
                              child: Text(
                                "Forget Password ?",
                                style: TextStyle(
                                  color: AppColor.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColor.yellow,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  provider.signIn(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                }
                              },
                              child: provider.isLoading? SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(color: AppColor.black,strokeWidth: 2,)) :Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t Have Account ? ",
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RegisterScreen.routeName,
                            );
                          },
                          child: Text(
                            "Create One",
                            style: theme.textTheme.titleSmall?.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.5,
                            color: AppColor.yellow,
                            indent: 40,
                            endIndent: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("OR"),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.5,
                            color: AppColor.yellow,
                            indent: 10,
                            endIndent: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SvgPicture.asset("assets/auth/google_icon.svg"),
                          Text(
                            "Login With Google",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: AppColor.yellow),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: AppColor.yellow,
                                ),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: ClipRRect(
                                child: Image.asset(
                                  "assets/auth/LR.png",
                                  width: 30,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: AppColor.black,
                                ),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: ClipRRect(
                                child: Image.asset(
                                  "assets/auth/EG.png",
                                  width: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
