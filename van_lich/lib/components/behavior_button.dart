import 'package:flutter/material.dart';

class BehaviorButton extends StatelessWidget {
  BehaviorButton(
      {super.key,
      required this.icon,
      this.color,
      required this.text,
      required this.onTap});

  IconData icon;
  Color? color;
  String text;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(text),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}