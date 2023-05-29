import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_lich/api/index.dart';
import 'package:van_lich/screens/content_detail/content_detail_screen.dart';

import '../../components/behavior_button.dart';
import '../video_player/video_player.dart';
import '../../models/content.dart';
import 'components/more_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Content> filterAndRotateArray(String selectedId, List<Content> contentList) {
    List<Content> filteredList = contentList.where((content) => content.type == 'video').toList();

    int selectedIndex = filteredList.indexWhere((content) => content.id == selectedId);

    if (selectedIndex != -1) {
      List<Content> rotatedList = [...filteredList];
      Content selectedContent = rotatedList.removeAt(selectedIndex);
      rotatedList.insert(0, selectedContent);
      return rotatedList;
    } else {
      return filteredList;
    }
  }

  StreamController indexController = StreamController();
  final CardSwiperController swiperController = CardSwiperController();
  List<Content> contents = [];
  bool _onSwipe(
      int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,
      ) {
    indexController.sink.add(currentIndex ?? previousIndex);
    if (direction == CardSwiperDirection.top) {
      print('top');
      int index = previousIndex!;
      if (contents[index].type == 'video') {
        var videoList = filterAndRotateArray(contents[index].id, contents);
        List<String> videoFilePaths = videoList.map((content) => content.content).toList();
        List<String> videoTitles = videoList.map((content) => content.name).toList();
        List<String> videoDescriptions = videoList.map((content) => content.caption).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TikTokVideoPlayerScreen(
              videoFilePaths: videoFilePaths,
              videoTitles: videoTitles,
              videoDescriptions: videoDescriptions,
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContentDetailScreen(content: contents[index])),
        );
      }
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
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            contents = snapshot.data ?? [];
            if (contents.isEmpty) {
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
                    allowedSwipeDirection: AllowedSwipeDirection.only(up: true, left: true, right: true),
                    scale: 0.9,
                    threshold: 30,
                    cardsCount: contents.length,
                    cardBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (contents[index].type == 'video') {
                          var videoList = filterAndRotateArray(contents[index].id, contents);
                          List<String> videoFilePaths = videoList.map((content) => content.content).toList();
                          List<String> videoTitles = videoList.map((content) => content.name).toList();
                          List<String> videoDescriptions = videoList.map((content) => content.caption).toList();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TikTokVideoPlayerScreen(
                                videoFilePaths: videoFilePaths,
                                videoTitles: videoTitles,
                                videoDescriptions: videoDescriptions,
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContentDetailScreen(content: contents[index])),
                          );
                        }
                      },
                      child: Hero(
                        tag: contents[index].id,
                        child: Material(
                          type: MaterialType.transparency,
                          child: SizedBox(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 11.0, right: 11.0, bottom: 0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(contents[index].mainGraphicUrl),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0, left: 11.0, right: 11.0, bottom: 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text('by Editor', style: TextStyle(color: Colors.white)),
                                          SizedBox(width: 5),
                                          Text('following', style: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        contents[index].caption,
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                StreamBuilder(
                  stream: indexController.stream,
                  builder: (context, snapshot) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 11.0, right: 11.0, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BehaviorButton(
                          icon: Icons.star,
                          color: Colors.yellow,
                          text: '${contents[snapshot.data].nOfStars}',
                          onTap: () {},
                          scale: 1,
                        ),
                        BehaviorButton(
                          icon: Icons.favorite,
                          color: Colors.red,
                          text: '${contents[snapshot.data].nOfFavs}',
                          onTap: () {},
                          scale: 1,
                        ),
                        BehaviorButton(
                          icon: Icons.chat_bubble,
                          color: Colors.grey,
                          text: '${contents[snapshot.data].nOfComments}',
                          onTap: () {},
                          scale: 1,
                        ),
                        MoreButton(
                        ),
                      ],
                    ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
