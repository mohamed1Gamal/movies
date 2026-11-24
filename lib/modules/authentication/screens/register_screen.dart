import 'package:flutter/material.dart';
import 'package:movies/modules/authentication/manager/auth_provider.dart';
import 'package:movies/modules/authentication/screens/login_screen.dart';
import 'package:movies/modules/authentication/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_color.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "registerScreen";

  RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        // backgroundColor: AppColor.black,
        appBar: AppBar(
          toolbarHeight: 40,
          foregroundColor: AppColor.yellow,
          backgroundColor: AppColor.black,
          centerTitle: true,
      
          title: Text(
            "Register",
            style: theme.textTheme.labelSmall?.copyWith(color: AppColor.yellow),
          ),
        ),
      
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/auth/avatar_1.png",
                              width: 94,
                              height: 94,
                            ),
                            Image.asset(
                              "assets/auth/avatar_2.png",
                              width: 158,
                              height: 160,
                            ),
                            Image.asset(
                              "assets/auth/avatar_3.png",
                              width: 94,
                              height: 94,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("Avatar", style: theme.textTheme.labelSmall),
                        SizedBox(height: 12),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter a valid name";
                            }
                            return null;
                          },
                          controller: nameController,
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.contact_phone_outlined),
                            // label: Text("Email", style: theme.textTheme.labelSmall),
                          ),
                        ),
                        SizedBox(height: 22),
                        TextFormField(
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
                          controller: emailController,
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.mail_outline_sharp),
                            // label: Text("Email", style: theme.textTheme.labelSmall),
                          ),
                        ),
                        SizedBox(height: 22),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter a password";
                            } else if (value.length < 6) {
                              return "Password must be more than 6 char of number";
                            }
                            return null;
                          },
                          controller: passwordController,
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility_off_rounded),
                            suffixIconColor: AppColor.white,
                          ),
                        ),
                        SizedBox(height: 22),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please re-enter the valid password";
                            } else if (value != passwordController.text) {
                              return "Password is not matched";
                            }
                          },
                          controller: rePasswordController,
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility_off_rounded),
                            suffixIconColor: AppColor.white,
                          ),
                        ),
                        SizedBox(height: 22),
                        TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter a number";
                            } else if(!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
                              return "Please enter a number";
                            }
                            return null;
                          },
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                provider.createAccount(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  context: context
                                );
                              }
                            },
                            child: provider.isLoading ? SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(color: AppColor.black,strokeWidth: 2,)) : Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have Account ? ",
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, LoginScreen.routeName);
                              },
                              child: Text(
                                "Login",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColor.yellow,
                                ),
                              ),
                            ),
                          ],
                        ),
          
                        SizedBox(height: 18),
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
                                    border: Border.all(width: 2, color: AppColor.yellow),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: ClipRRect(
                                    child: Image.asset("assets/auth/LR.png", width: 30),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: AppColor.black),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: ClipRRect(
                                    child: Image.asset("assets/auth/EG.png", width: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
