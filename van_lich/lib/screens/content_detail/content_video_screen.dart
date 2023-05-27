import 'package:flutter/material.dart';
class ContentVideoScreen extends StatefulWidget {
  const ContentVideoScreen({Key? key}) : super(key: key);

  @override
  State<ContentVideoScreen> createState() => _ContentVideoScreenState();
}

class _ContentVideoScreenState extends State<ContentVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
