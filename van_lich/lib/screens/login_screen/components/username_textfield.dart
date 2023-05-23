import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number or email address';
    } else if (value.length < 6 || value.length > 15) {
      return 'This field must be between 6 and 15 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: johndoe123",
        labelText: "profile_username".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
