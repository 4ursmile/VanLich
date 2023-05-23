import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.6,
            child: Text(
              "login_dont_have_account".tr,
              style: const TextStyle(
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.signUp),
            child: Text(
              'login_signup'.tr,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
