import 'package:flutter/material.dart';
import 'package:van_lich/screens/message/components/my_list_tile.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreen();
}

class _MessageScreen extends State<MessageScreen> {
  //TODO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          Text(
            'Tin nhắn',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20,),
          MyListTile(),
          ],
        ),
      )
      )
    );


  }

}

