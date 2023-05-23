import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/theme_constant.dart';

class NotificationDialog {
  static void show(BuildContext context, String title, String body,
      {bool isPrimary = false, int duration = 3000}) {
    Get.snackbar(
      title,
      body,
      borderWidth: 2,
      backgroundColor: isPrimary ? Theme.of(context).primaryColor : null,
      colorText: isPrimary ? Colors.white : Colors.black,
      borderRadius: kDefaultRadius / 2,
      snackPosition: SnackPosition.TOP,
      duration: Duration(milliseconds: duration),
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      animationDuration: const Duration(milliseconds: 400),
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: Icon(
          Icons.close,
          color: isPrimary ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
