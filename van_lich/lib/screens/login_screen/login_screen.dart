import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/loader_dialog.dart';
import '../../components/notification.dart';
import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';
import 'components/custom_divider.dart';
import 'components/illustration.dart';
import 'components/login_button.dart';
import 'components/social_buttons.dart';
import 'components/password_textfield.dart';
import 'components/remember_forgot.dart';
import 'components/signup_button.dart';
import 'components/username_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  Future _handleLogin() async {
    try {
      if (_formKey.currentState!.validate()) {
        LoaderDialog.show(context);

        LoaderDialog.hide();

        NotificationDialog.show(context, 'Login', 'Login success');

        Get.offAllNamed(Routes.home);
      }
    } catch (error) {
      LoaderDialog.hide();
      NotificationDialog.show(context, "Error", error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Illustration(),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.2),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "login_desc".tr,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      UsernameTextField(controller: _phoneController),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      PasswordTextField(controller: _passwordController),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      const RememberForgot(),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      LoginButton(onPress: _handleLogin),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      const CustomDivider(),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      const SocialButtons(),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      const SignUpButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
