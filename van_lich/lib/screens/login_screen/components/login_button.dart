import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.onPress}) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(Get.width * 0.9, 50),
        ),
      ),
      onPressed: onPress,
      child: Text(
        "login_login".tr,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
