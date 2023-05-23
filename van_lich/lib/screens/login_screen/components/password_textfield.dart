import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isShow = false;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !isShow,
      validator: _validator,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.verified_user_rounded,
          color: Theme.of(context).primaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "*********",
        labelText: "login_password".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: Icon(
            isShow ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            setState(() {
              isShow = !isShow;
            });
          },
        ),
      ),
    );
  }
}
