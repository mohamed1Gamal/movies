import 'package:flutter/material.dart';

import '../theme/app_color.dart';

 class Toast {



 static void show({required String title, required BuildContext context,ToastType type = ToastType.success}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: Text(title,style: TextStyle(color: AppColor.black),),
        backgroundColor: type.color,
        behavior: SnackBarBehavior.floating,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }
}

enum ToastType {
  error(color: Colors.red),

  success(color: Color(0xffFFBB3B));

  final Color color;

  const ToastType({required this.color});
}