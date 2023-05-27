import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_lich/api/index.dart';
import 'package:van_lich/components/behavior_button.dart';
import 'package:van_lich/models/collection.dart';
import 'package:van_lich/screens/content_detail/content_detail_screen.dart';
import 'package:van_lich/screens/home/components/more_button.dart';

import '../../../models/content.dart';
List<Content> filterContentsByIDs(Collection collection, List<Content> allContents) {
  List<Content> filteredContents = allContents.where((content) => collection.contentIds.contains(content.id)).toList();
  return filteredContents;
}

class collectionView extends StatefulWidget {
  final Collection collection;
  const collectionView({
    Key? key,
    required this.collection
  }) : super(key: key);

  @override
  State<collectionView> createState() => _collectionView();
}

class _collectionView extends State<collectionView> {
  late Collection collect;

  StreamController indexController = StreamController();
  final CardSwiperController swiperController = CardSwiperController();
  List<Content> contents = [];

  bool _onSwipe(int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,) {

    indexController.sink.add(currentIndex ?? previousIndex);
    if (direction == CardSwiperDirection.top) {
      print('top');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            ContentDetailScreen(content: contents[currentIndex ?? previousIndex])
        ),
      );

    }
    if (direction == CardSwiperDirection.left) {
      print('left');
    }
    if (direction == CardSwiperDirection.right) {
      print('right');
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    collect = widget.collection;

  }

  @override
  void dispose() {
    swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: SizedBox(
        height: 900,
        child: FutureBuilder<List<Content>>(
            future: API.getListOfSuggestionContents(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              contents = snapshot.data ?? [];
              List<Content> filteredContents = filterContentsByIDs(widget.collection, contents);

              if (filteredContents.isEmpty) {
                return const Text('Something went wrong!');
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 600,
                    width: 400,
                    child: CardSwiper(
                      controller: swiperController,
                      onSwipe: _onSwipe,
                      allowedSwipeDirection: AllowedSwipeDirection.only(
                          up: true, left: true, right: true),
                      scale: 0.9,
                      threshold: 30,
                      cardsCount: filteredContents.length,
                      cardBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                ContentDetailScreen(content: filteredContents[index])),
                          );
                        },
                        child: Hero(
                          tag: contents[index].id,
                          child: Material(
                            type: MaterialType.transparency,
                            child: SizedBox(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 11.0, right: 11.0, bottom: 0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(filteredContents[index].mainGraphicUrl), fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 11.0, right: 11.0, bottom: 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Colors.black.withOpacity(0.6),
                                              Colors.transparent
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 30,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          filteredContents[index].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'by Editor',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'following',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          filteredContents[index].caption,
                                          style: TextStyle(
                                              color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StreamBuilder(
                      stream: indexController.stream,
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BehaviorButton(
                                icon: Icons.star,
                                color: Colors.yellow,
                                text: '${filteredContents[snapshot.data].nOfStars}K',
                                onTap: () {}),
                            BehaviorButton(
                                icon: Icons.favorite,
                                color: Colors.red,
                                text: '${filteredContents[snapshot.data].nOfFavs}K',
                                onTap: () {
                                  print('hihi');
                                }),
                            BehaviorButton(
                                icon: Icons.messenger, text: '${filteredContents[snapshot.data].nOfComments}K', onTap: () {}),
                            const MoreButton(),
                          ],
                        );
                      }
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
