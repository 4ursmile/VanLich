import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Container> cards = [
    Container(
      height: 300,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
           BoxShadow(
            spreadRadius: 3.4, blurRadius: 13.0,
          )

        ]
      ), child: Image.asset('assets/images/ba-trieu-01.png')
    ),
    Container(
      height: 300,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 3.4, blurRadius: 13.0,
            )

          ]
      ),
      child: Image.asset('assets/images/ba-trieu-01.png'),
    ),
    Container(
      height: 300,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 3.4, blurRadius: 13.0,
            )

          ]
      ),
        child: Image.asset('assets/images/ba-trieu-01.png')
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 600,
          child: SizedBox(
            height: 500,
            width: 300,
            child: CardSwiper(
              scale: 0.9,
              threshold: 1,
              cardsCount: cards.length,
              cardBuilder: (context, index) => cards[index],
            ),
          ),
        ),
      ),
    );
  }
}
