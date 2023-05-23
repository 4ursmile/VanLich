import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants/theme_constant.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) handleChangeIndex;

  const BottomNavigation(
      {Key? key, required this.selectedIndex, required this.handleChangeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: selectedIndex,
      onTap: handleChangeIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'Home'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          label: 'Explore'.tr,
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.collections),
        //   label: 'Story',
        // ),
        BottomNavigationBarItem(
          // icon: CachedNetworkImage(
          //   imageUrl: context.watch<Auth>().user?.avatar == ""
          //       ? kDefaultAvatarUrl
          //       : context.watch<Auth>().user?.avatar as String,
          //   imageBuilder: (context, imageProvider) => CircleAvatar(
          //     backgroundImage: imageProvider,
          //     radius: 13,
          //   ),
          //   placeholder: (context, url) => const CircleAvatar(radius: 13),
          //   errorWidget: (context, url, error) => const CircleAvatar(
          //     radius: 13,
          //   ),
          // ),
          icon: Icon(Icons.account_circle),
          label: 'Profile'.tr,
        ),
      ],
    );
  }
}
