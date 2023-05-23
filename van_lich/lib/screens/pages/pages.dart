import 'package:flutter/material.dart';
import 'package:van_lich/screens/home/home_screen.dart';
import '../setting/setting_screen.dart';
import '../home/home_screen.dart';
import 'components/bottom_navigation.dart';

class Pages extends StatefulWidget {
  Pages({Key? key}) : super(key: key);
  final List<Widget> tabs = [
     HomeScreen(),
     HomeScreen(),
     HomeScreen()
  ];

  @override
  State<Pages> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Pages> {
  int selectedIndex = 0;

  void handleChangeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.tabs[selectedIndex],
      bottomNavigationBar: BottomNavigation(
        handleChangeIndex: handleChangeIndex,
        selectedIndex: selectedIndex,
      ),
    );
  }
}

class S1 extends StatelessWidget {
  const S1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oke');
  }
}

class S2 extends StatelessWidget {
  const S2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oke 2');
  }
}

class S3 extends StatelessWidget {
  const S3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oke 3');
  }
}
