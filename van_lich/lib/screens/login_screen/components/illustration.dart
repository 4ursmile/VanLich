import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';

class Illustration extends StatelessWidget {
  const Illustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 1.5),
        child: SvgPicture.asset(
          'assets/images/login_svg.svg',
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
