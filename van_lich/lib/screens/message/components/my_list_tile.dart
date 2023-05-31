import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person), // Icon widget displayed at the start
      title: Text('Lẩu bò'), // Title text
      subtitle: Text('Hôm qua ăn gà lá é ngon ghê'), // Subtitle text
      trailing: const Text('1 ngày'), // Icon widget displayed at the end
      onTap: () {
        // Action to perform when the list tile is tapped
        print('List tile tapped');
      },
    );
  }
}