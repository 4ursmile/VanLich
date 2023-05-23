import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../constants/theme_constant.dart';

class LoaderDialog {
  static void show(BuildContext context, [String? title]) {
    Widget alert = WillPopScope(
        child: AlertDialog(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          content: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: SpinKitSpinningLines(
                  duration: const Duration(milliseconds: 2000),
                  color: Theme.of(context).primaryColor,
                  size: 36,
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              Text(title ?? "Loading..."),
            ],
          ),
        ),
        onWillPop: () async => false);

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => alert,
    );
  }

  static void hide() {
    Get.back();
  }
}
