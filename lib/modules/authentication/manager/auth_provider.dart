import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/core/toast_service/toast.dart';
import 'package:movies/modules/authentication/services/auth_service.dart';
import 'package:movies/modules/layout/layout_screens/layout_screen.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  late User user;

  Future<void> createAccount({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      user = (await AuthService.createAccount(
        emailAddress: email,
        password: password,
        name: name,
      ))!;
      if (user.emailVerified) {
        Toast.show(title: "Welcome $name", context: context);
        Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
      }
    } catch (e) {
      Toast.show(title: e.toString(), context: context, type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      user = await AuthService.signIn(email: email, password: password);
      if (user.emailVerified) {
        Toast.show(title: "Welcome back ${user.displayName}", context: context);
        Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
      }
    } catch (e) {
      Toast.show(title: e.toString(), context: context, type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      await AuthService.forgetPassword(email: email);
      if (user.emailVerified) {
        Toast.show(title: "Check your email", context: context);
      }
    } catch (e) {
      Toast.show(title: e.toString(), context: context, type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }

}
