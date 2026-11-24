import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/authentication/manager/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "forgetPasswordScreen";

   ForgetPasswordScreen({super.key});
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: AppColor.yellow,
          backgroundColor: AppColor.black,
          centerTitle: true,
          title: Text(
            "Forget Password",
            style: theme.textTheme.labelSmall?.copyWith(color: AppColor.yellow),
          ),
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Image.asset("assets/auth/Forgot password.png"),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.resetPassword(email: emailController.text, context: context);
                    },
                    child:provider.isLoading ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(color: AppColor.black,strokeWidth: 2,)) :Center(
                      child: Text(
                        "Verify Email",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
