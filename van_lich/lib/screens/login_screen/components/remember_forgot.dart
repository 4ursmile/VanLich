import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constant.dart';

class RememberForgot extends StatefulWidget {
  const RememberForgot({Key? key}) : super(key: key);

  @override
  State<RememberForgot> createState() => _RememberForgotState();
}

class _RememberForgotState extends State<RememberForgot> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => setState(() => isRemember = !isRemember),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: isRemember,
                    onChanged: (value) => setState(() => isRemember = value!),
                  ),
                ),
                Text(
                  "login_remember".tr,
                ),
              ],
            )),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.forgotPassword),
          child: Text(
            "login_forgot".tr,
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
