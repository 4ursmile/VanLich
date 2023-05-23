import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/loader_dialog.dart';
import '../../../components/notification.dart';
import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  void _handleFacebookLogin() {}

  void _handleAppleLogin() {}

  @override
  Widget build(BuildContext context) {
    Future _handleGoogleLogin() async {
      try {
        LoaderDialog.show(context);
        LoaderDialog.hide();
        NotificationDialog.show(context, "Login", "Login successfully");

        Get.offAllNamed(Routes.home);
      } catch (error) {
        LoaderDialog.hide();
        NotificationDialog.show(context, "Error", error.toString());
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100.0),
          child: SvgPicture.asset(
            'assets/images/google_svg.svg',
            height: 40,
          ),
          onTap: _handleGoogleLogin,
        ),
        const SizedBox(width: kDefaultPadding),
        InkWell(
          child: SvgPicture.asset(
            'assets/images/facebook_svg.svg',
            height: 40,
          ),
          borderRadius: BorderRadius.circular(100.0),
          onTap: _handleFacebookLogin,
        ),
        const SizedBox(width: kDefaultPadding),
        InkWell(
          child: SvgPicture.asset(
            'assets/images/apple_svg.svg',
            height: 40,
          ),
          borderRadius: BorderRadius.circular(100.0),
          onTap: _handleAppleLogin,
        ),
      ],
    );
  }
}
