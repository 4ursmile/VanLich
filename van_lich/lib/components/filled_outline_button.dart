import 'package:flutter/material.dart';

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    Key? key,
    this.isFilled = true,
    required this.press,
    required this.text,
  }) : super(key: key);

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.white),
      ),
      color: isFilled ? Colors.white : Colors.transparent,
      elevation: !isFilled ? 0 : 4,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? Theme.of(context).primaryColor : Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
