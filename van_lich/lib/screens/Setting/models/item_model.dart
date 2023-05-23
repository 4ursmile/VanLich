import 'package:flutter/material.dart';

class ItemModel {
  IconData icon;
  Color iconColor;
  String title;
  String subTitle;
  bool isNavigation;
  VoidCallback? handleClick;

  ItemModel({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subTitle,
    required this.isNavigation,
    this.handleClick,
  });
}
