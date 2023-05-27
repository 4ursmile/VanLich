import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_lich/api/index.dart';
import 'package:van_lich/screens/content_detail/content_detail_screen.dart';

import '../../components/behavior_button.dart';
<<<<<<< HEAD
import '../video_player/video_player.dart';
=======
import '../../models/content.dart';
>>>>>>> 88c961f19561c6c0057b4bdf962aa86eb5c52b79
import 'components/more_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List cards = [
    Hero(
      tag: '0',
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/ba-trieu-01.png')),
                  borderRadius: BorderRadius.circular(10),
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
              const Positioned(
                bottom: 20,
                left: 30,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bà Triệu',
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
                      'Sử thi Bà Triệu Thị Trinh',
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

    Hero(
      tag: '1',
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/ba-trieu-01.png')),
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: const [
                  //    BoxShadow(
                  //      spreadRadius: 2, blurRadius: 3.0,
                  //   )
                  //
                  // ]
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
            ],
          ),
        ),
      ),
    ),

  ];

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
            //test video
            TikTokVideoPlayerScreen(
              videoFilePaths: ['assets/videos/demo1.mp4','assets/videos/demo2.mp4'],
              videoTitles: ['Đại chiến thành Đa Bang - Phần 1', 'Đại chiến thành Đa Bang - Phần 2'],
              videoDescriptions: ['Nhà Hồ thành lập', 'Mộc Thạnh xuất hiện'],
            )),
            // ContentDetailScreen(id: contents[currentIndex ?? previousIndex].id)),
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
    print('vao day');
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
            if(contents == []) {
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
                    cardsCount: contents.length,
                    cardBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ContentDetailScreen(id: index.toString())),
                        );
                      },
                      child: Hero(
                        tag: contents[index].id,
                        child: Material(
                          type: MaterialType.transparency,
                          child: SizedBox(
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(contents[index].mainGraphicUrl)),
                                    borderRadius: BorderRadius.circular(10),
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
                                        contents[index].name,
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
                                        contents[index].caption,
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
                            text: '${contents[snapshot.data].nOfStars}K',
                            onTap: () {}),
                        BehaviorButton(
                            icon: Icons.favorite,
                            color: Colors.red,
                            text: '${contents[snapshot.data].nOfFavs}K',
                            onTap: () {
                              print('hihi');
                            }),
                        BehaviorButton(
                            icon: Icons.messenger, text: '${contents[snapshot.data].nOfComments}K', onTap: () {}),
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
